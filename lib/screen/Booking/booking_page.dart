import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'ActiveNow.dart';
import 'Cancelled.dart';
import 'Completed.dart';
import '../../constants.dart';

class BookingPage extends StatefulWidget {
  static String id = 'booking_page';

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'My Bookings',
            style: TextStyle(
                color: ThirdColor, fontWeight: FontWeight.w500, fontSize: 21),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  //  context.push(new HomepageCar());
                },
                child: SvgPicture.asset('assets/icon/Search.svg')),
            const SizedBox(
              width: 24,
            ),
            SvgPicture.asset('assets/icon/More Circle.svg'),
            const SizedBox(
              width: 24,
            ),
          ],
          bottom: const TabBar(
            labelColor: PrimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
            labelPadding: EdgeInsets.symmetric(horizontal: 22),
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            indicatorColor: PrimaryColor,
            unselectedLabelColor: ScandryColor,
            tabs: [
              Tab(
                text: "Active Now",
              ),
              Tab(
                text: "Completed",
              ),
              Tab(
                text: "Cancelled",
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              ActiveNow(),
              Completed(),
              Cancelled(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String activeText;
  final Color activeColor;

  CustomCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.activeText,
    required this.activeColor,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  minRadius: 30,
                  maxRadius: 30,
                  backgroundImage: NetworkImage(widget.imageUrl),
                ),
                title: Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.subtitle),
                trailing: Column(
                  children: [
                    Container(
                      height: 32,
                      width: 86,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: widget.activeColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        widget.activeText,
                        style: const TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 110,
                    ),
                    const Text('HSW 4736 XK')
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                endIndent: 12,
                indent: 12,
              ),
              if (isExpanded) ...[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                    child: SvgPicture.asset(
                                        'assets/icon/Location.svg')),
                                TextSpan(text: '  6.4 km'),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                    child: SvgPicture.asset(
                                        'assets/icon/Time Circle.svg')),
                                TextSpan(text: '   14 mins'),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                    child: SvgPicture.asset(
                                        'assets/icon/Wallet.svg')),
                                TextSpan(text: '   \$24.00'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date & Time'),
                          Text('Dec 18, 2024 | 14:27 PM')
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 80,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                  child: Image.asset(
                                'assets/image/Location.png',
                                height: 42,
                              )),
                              const VerticalDivider(
                                endIndent: 8,
                                indent: 8,
                                thickness: 2,
                              ),
                              Container(
                                  child: Image.asset(
                                'assets/image/map.png',
                                height: 42,
                              ))
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'National Grand Park',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '6 Glendale St. Worcester, MA 01604',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: ScandryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fitness Center',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '83 Cypress Street Longwood, FL 32779',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: ScandryColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 110,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
