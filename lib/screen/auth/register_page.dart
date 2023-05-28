import 'package:driver_app/widgets/halper_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../widgets/coustom_button.dart';
import '../../widgets/custom-text_filed.dart';
import '../../widgets/show_snack_bar.dart';
import '../../widgets/socal_card.dart';
import '../car/home_page_car.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  String? email, password;
  bool isloding = false;
  static String id = 'registerPage';
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isloding = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, HomepageCar.id);
          isloding = false;
        } else if (state is RegisterFaliure) {
          showSnackBar(context, state.errMassge);
          isloding = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                          'Create your \nAccount',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ThirdColor,
                            fontSize: 46,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextFiled(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                      icon: SvgPicture.asset("assets/icon/Message.svg",
                          fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFiled(
                      obscureText: true,
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Password',
                      icon: SvgPicture.asset("assets/icon/Lock.svg",
                          fit: BoxFit.scaleDown),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CoustomButton(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context)
                              .registerUser(email: email!, password: password!);
                        }
                      },
                      text: 'Sign up',
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
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: ScandryColor),
                        ),
                        GestureDetector(
                          onTap: () {
                            /* Navigator.pushNamed(context, LoginPage.id);
                           */
                            context.Replacement(new LoginPage());
                          },
                          child: Text(
                            ' Sign in',
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
        );
      },
    );
  }
}
