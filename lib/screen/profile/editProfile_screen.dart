import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../widgets/coustom_button.dart';
import '../../widgets/custom-text_filed.dart';

class EditeProfileScreen extends StatefulWidget {
  const EditeProfileScreen({super.key});
  static String id = 'EditeProfileScreen';
  @override
  State<EditeProfileScreen> createState() => _EditeProfileScreenState();
}

class _EditeProfileScreenState extends State<EditeProfileScreen> {
  String username = 'johndoe';
  String name = 'John';
  String birthday = '03/08/1990';
  String email = 'johndoe@gmail.com';
  String country = 'United States';
  String mobileNumber = '+1 123 456 7890';
  String gender = 'Male';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: ThirdColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            "Edite Profile",
            style: TextStyle(color: ThirdColor),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomTextFiled(
                      hintText: 'username',
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFiled(
                      hintText: 'Name',
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFiled(
                      hintText: 'Birthday',
                      onChanged: (value) {
                        setState(() {
                          birthday = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFiled(
                      sufixI: SvgPicture.asset("assets/icon/Hide.svg"),
                      hintText: 'Email',
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFiled(
                      hintText: 'Country',
                      onChanged: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomTextFiled(
                        hintText: 'Mobile Number',
                        onChanged: (value) {
                          setState(() {
                            mobileNumber = value;
                          });
                        }),
                    const SizedBox(height: 16.0),
                    CustomTextFiled(
                        hintText: 'Enter gender',
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        }),
                    const SizedBox(height: 16.0),
                    Center(
                      child: CoustomButton(
                          text: 'Update',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // Perform update action here
                              print('Update successful!');
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
