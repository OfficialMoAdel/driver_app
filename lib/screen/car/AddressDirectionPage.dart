import 'package:driver_app/screen/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../widgets/coustom_button.dart';
import '../../widgets/halper_app.dart';
import '../../constants.dart';

class AddressDirectionPage extends StatefulWidget {
  const AddressDirectionPage({super.key});

  @override
  State<AddressDirectionPage> createState() => _AddressDirectionPageState();
}

class _AddressDirectionPageState extends State<AddressDirectionPage> {
  final LatLng _initialPosition = LatLng(37.422, -122.084);
  late GoogleMapController _mapController;
  final List<String> _locations = [
    'My Current Location',
    'Soft Bank Buildings'
  ];
  final List<String> _titles = ['Title 1', 'Title 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            child: SvgPicture.asset('assets/icon/Arrow - Left.svg'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          const SizedBox(
            width: 12,
          ),
          CircleAvatar(
            backgroundColor: YallowColor,
            child: SvgPicture.asset(
              'assets/icon/Search.svg',
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          CircleAvatar(
            backgroundColor: YallowColor,
            child: SvgPicture.asset(
              'assets/icon/Notification.svg',
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          CircleAvatar(
            backgroundColor: YallowColor,
            child: SvgPicture.asset(
              'assets/icon/Close Square.svg',
            ),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) => _mapController = controller,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 14.0,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ..._buildLocationList(),
          CoustomButton(
              text: "Continue To Order",
              onTap: () => context.push(new WalletScreen())),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  List<Widget> _buildLocationList() {
    List<Widget> locationWidgets = [];

    for (int i = 0; i < _locations.length; i++) {
      locationWidgets.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 8.0),
                  Text(_locations[i], style: TextStyle(fontSize: 16.0)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editTitle(i),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                _titles[i],
                style: TextStyle(fontSize: 14.0, color: ScandryColor),
              ),
              SizedBox(height: 8.0),
              Divider(),
            ],
          ),
        ),
      );
    }

    return locationWidgets;
  }

  void _editTitle(int index) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController controller =
            TextEditingController(text: _titles[index]);

        return AlertDialog(
          title: Text('Edit Title'),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _titles[index] = controller.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
