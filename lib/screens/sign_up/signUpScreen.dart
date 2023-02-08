import 'package:competition/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../const/const.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../sign_in/signInScreen.dart';
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
              navigateToReplacement(context, HomeScreen());
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
                                EditTextField(
                                    context: context,
                                    icon: Icons.person,
                                    hintText: 'Name...',
                                    isPassword: false,
                                    isEmail: true,
                                    controller: nameController),
                                EditTextField(
                                    context: context,
                                    icon: Icons.email_outlined,
                                    hintText: 'Email...',
                                    isPassword: false,
                                    isEmail: true,
                                    controller: emailController),
                                EditTextField(
                                    context: context,
                                    icon: Icons.lock_outline,
                                    hintText: 'Password...',
                                    isPassword: true,
                                    isEmail: false,
                                    controller: passwordController),
                                EditTextField(
                                    context: context,
                                    icon: Icons.phone,
                                    hintText: 'Phone...',
                                    isPassword: true,
                                    isEmail: false,
                                    controller: phoneController),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Button(
                                      context: context,
                                      string: 'SIGN UP',
                                      width: 2.58,
                                      voidCallback:() {
                                        RegisterCubit.get(context).userRegister(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text);
                                        HapticFeedback.lightImpact();
                                        Fluttertoast.showToast(
                                            msg: 'Login button pressed');
                                        navigateToReplacement(
                                            context, HomeScreen());
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
                                  child: Button(
                                    context:context,
                                    string: 'SIGN IN',
                                    width: 2,
                                    voidCallback:() {
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



