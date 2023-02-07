import 'dart:ui';

import 'package:competition/sign_in/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignUpScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            {
              // Navigator.pushReplacementNamed(context, Layout.RouteName);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.blue.shade500
              //Color(0xff192028),
              ,
              body: SingleChildScrollView(
                child: SizedBox(
                  height: size.height,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * .1),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.7),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  wordSpacing: 4,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                component1(context, Icons.person, 'Name...',
                                    false, true, nameController),
                                component1(context, Icons.email_outlined,
                                    'Email...', false, true, emailController),
                                component1(
                                    context,
                                    Icons.lock_outline,
                                    'Password...',
                                    true,
                                    false,
                                    passwordController),
                                component1(context, Icons.phone, 'Phone...',
                                    true, false, phoneController),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    component2(
                                      context,
                                      'SIGN UP',
                                      2.58,
                                      () {
                                        RegisterCubit.get(context).userRegister(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text);
                                        HapticFeedback.lightImpact();
                                        Fluttertoast.showToast(
                                            msg: 'Login button pressed');
                                      },
                                    ),
                                    SizedBox(width: size.width / 20),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: component2(
                                    context,
                                    'SIGN IN',
                                    2,
                                    () {
                                      HapticFeedback.lightImpact();
                                      Fluttertoast.showToast(
                                          msg: 'SIGN IN button pressed');
                                      Get.to(() => SignInScreen(),
                                          //   transition: Transition.fade,
                                          duration: Duration(seconds: 1));
                                    },
                                  ),
                                ),
                                SizedBox(height: size.height * .05),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}

Widget component1(context, IconData icon, String hintText, bool isPassword,
    bool isEmail, controller) {
  Size size = MediaQuery.of(context).size;
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 15,
        sigmaX: 15,
      ),
      child: Container(
        height: size.width / 8,
        width: size.width / 1.2,
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: size.width / 30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          style: TextStyle(color: Colors.white.withOpacity(.9)),
          cursorColor: Colors.white,
          obscureText: isPassword,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.white.withOpacity(.7),
            ),
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
          ),
        ),
      ),
    ),
  );
}

Widget component2(
    context, String string, double width, VoidCallback voidCallback) {
  Size size = MediaQuery.of(context).size;
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: voidCallback,
        child: Container(
          height: size.width / 8,
          width: size.width / width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            string,
            style: TextStyle(color: Colors.white.withOpacity(.9)),
          ),
        ),
      ),
    ),
  );
}
