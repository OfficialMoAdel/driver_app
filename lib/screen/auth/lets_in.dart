import 'package:driver_app/widgets/halper_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants.dart';
import '../../widgets/coustom_button.dart';
import '../../widgets/socal_card.dart';
import 'login_page.dart';
import 'register_page.dart';

class LetsIn extends StatelessWidget {
  LetsIn({super.key});
  bool isloding = false;
  static String id = 'letsIn';
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloding,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset('assets/icon/lets.svg'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Lets you in',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ThirdColor,
                    fontSize: 46,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocalCard1(
                      icon: 'assets/icon/google.svg',
                      text: 'Continue with Google',
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SocalCard1(
                      icon: 'assets/icon/icons8-facebook.svg',
                      text: 'Continue with Facebook',
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SocalCard1(
                      icon: 'assets/icon/apple.svg',
                      text: 'Continue with Apple  ',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(children: const [
                  Expanded(
                      child: Divider(
                    endIndent: 10,
                    thickness: 1,
                  )),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                      child: Divider(
                    indent: 10,
                    thickness: 1,
                  )),
                ]),
                const SizedBox(
                  height: 40,
                ),
                CoustomButton(
                  onTap: () {
                    context.Replacement(new LoginPage());
                    //Navigator.pushNamed(context, LoginPage.id);
                  },
                  text: 'Sign in with password',
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: ScandryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(context, RegisterPage.id);
                        context.Replacement(new RegisterPage());
                      },
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(color: PrimaryColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
