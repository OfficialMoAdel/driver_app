import 'package:driver_app/widgets/halper_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../widgets/coustom_button.dart';
import '../../widgets/custom-text_filed.dart';
import '../../widgets/show_snack_bar.dart';
import '../../widgets/socal_card.dart';
import '../car/home_page_car.dart';
import '../main_app.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';
  GlobalKey<FormState> formkey = GlobalKey();
  String? email, password;
  bool isloding = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloding = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, HomepageCar.id);
          isloding = false;
        } else if (state is LoginFaliure) {
          showSnackBar(context, state.errMassge);
          isloding = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isloding,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Login to you \nAccount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThirdColor,
                          fontSize: 46,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFiled(
                    icon: SvgPicture.asset("assets/icon/Message.svg",
                        fit: BoxFit.scaleDown),
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                    icon: SvgPicture.asset("assets/icon/Lock.svg",
                        fit: BoxFit.scaleDown),
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                    // sufixI: SvgPicture.asset("assets/icon/Hide.svg",
                    //     fit: BoxFit.scaleDown),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      'Forgot the password?',
                      style: TextStyle(
                          color: PrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CoustomButton(
                    onTap: () async {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.getString('email');
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .loginUser(email: email!, password: password!);
                      } else {}
                    },
                    text: 'Sin in',
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
                      "or contine with",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocalCard(
                        press: () {},
                        icon: 'assets/icon/google.svg',
                      ),
                      SocalCard(
                        press: () {},
                        icon: 'assets/icon/icons8-facebook.svg',
                      ),
                      SocalCard(
                        press: () {},
                        icon: 'assets/icon/apple.svg',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(color: ScandryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, RegisterPage.id);
                          context.Replacement(new MainApp());
                        },
                        child: Text(
                          ' Sign up',
                          style: TextStyle(color: PrimaryColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
