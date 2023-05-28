import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import '../widgets/coustom_button.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icon/Frame.svg'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Trip to Destination',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('4.5 km')
            ],
          ),
        ),
        const Divider(
          endIndent: 8,
          indent: 8,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                radius: 30.0,
              ),
              const SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    ' hihhhh',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 4.0),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height / 6,
              ),
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: SvgPicture.asset(
                          'assets/icon/stare.svg',
                          color: PrimaryColor,
                        )),
                        const TextSpan(text: ' 4.5'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text('HSW 4736')
                ],
              )
            ],
          ),
        ),
        const Divider(
          endIndent: 8,
          indent: 8,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
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
                    children: const [
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
                    children: const [
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
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height / 20,
              ),
              Column(
                children: [
                  const Text('0 KM'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  const Text('20 KM')
                ],
              ),
            ],
          ),
        ),
        const Divider(
          endIndent: 8,
          indent: 8,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CoustomButton(text: 'text'),
              // CoustomButton(text: 'text'),
              /* Container(
                                        decoration: BoxDecoration(
                                            color: PrimaryColor,
                                            borderRadius: BorderRadius.circular(50)),
                                        height: 64,
                                        width: 64,
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: SvgPicture.asset(
                                            'assets/icon/Chat.svg',
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: PrimaryColor,
                                            borderRadius: BorderRadius.circular(50)),
                                        height: 64,
                                        width: 64,
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: SvgPicture.asset(
                                            'assets/icon/Call.svg',
                                          ),
                                        )), */
            ],
          ),
        ),
      ],
    );
  }
}
