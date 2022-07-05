import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msm_unify/App/Screens/Authentication/Login/Controller/login_controller.dart';
import 'package:msm_unify/App/Screens/Authentication/SignUp/View/sign_up.dart';
import 'package:msm_unify/App/Screens/ForgotPassword/forgot_password.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class LoginScreen extends GetView<LoginController> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    color: kColorPrimary,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            "assets/icons/logo.png",
                            width: Get.width * 0.15,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 1,
                    height: Get.height * 0.26,
                    child: Image.network(
                      "https://msquaremedia.com/wp-content/uploads/2020/06/LOGIN-PAGE2-1024x804.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('Sign-In',
                        style: GoogleFonts.notoSerifGeorgian(
                          color: kColorPrimary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                          return "Please enter a valid email address";
                        }
                      },
                      onChanged: (value) {
                        controller.userInputEmail.value = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email ID',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: kColorPrimary,
                              width: 0.5,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: kColorPrimary,
                              width: 0.5,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: kColorPrimary,
                              width: 2,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Password';
                        }
                      },
                      onChanged: (value) {
                        controller.userInputPassword.value = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: kColorPrimary,
                              width: 0.5,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: kColorPrimary,
                              width: 2,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: kColorPrimary,
                              width: 0.5,
                            )),
                      ),
                    ),
                  ),
                  GetBuilder<LoginController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: SizedBox(
                          height: 20.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: Colors.red,
                                value: controller.checkbox,
                                onChanged: (value) {
                                  controller.setCheckBox(value);
                                },
                              ),
                              Text(
                                "Remember me",
                                style: GoogleFonts.notoSerifGeorgian(
                                    fontSize: 12.sp),
                              ),
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: VerticalDivider(
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const ForgotPasswordScreen());
                                },
                                child: Text(
                                  "Forget password",
                                  style: GoogleFonts.notoSerifGeorgian(
                                      color: Colors.blue, fontSize: 12.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    child: MaterialButton(
                      onPressed: () {
                        if (_form.currentState!.validate()) {
                          controller.loginCredentials();
                        }
                        // Get.off(() => const DashboardPage());

                        //controller.loginCredentials();
                      },
                      elevation: 0,
                      color: kColorPrimary,
                      minWidth: 150.w,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'Continue',
                        style: GoogleFonts.notoSerifGeorgian(
                            color: Colors.white, fontSize: 12.sp),
                      ),
                    ),
                  ),
                  const Divider(
                      color: kColorPrimary, endIndent: 15.0, indent: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15),
                    child: Text(
                      "Don't have an account?",
                      style: GoogleFonts.notoSerifGeorgian(
                          fontSize: 18.sp, color: kColorPrimary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: MaterialButton(
                      onPressed: () {
                        Get.to(() => const SignUp());
                      },
                      elevation: 0,
                      color: kColorYellow,
                      minWidth: 150.w,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'Register as Agent',
                        style: GoogleFonts.notoSerifGeorgian(
                            color: Colors.black, fontSize: 12.sp),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 31),
                    width: Get.width,
                    color: kColorPrimary,
                    height: 50.h,
                    child: Center(
                      child: Text(
                        'Copyright Â© 2021 M Square Media | All Rights Reserved',
                        style: GoogleFonts.notoSerifGeorgian(
                            color: Colors.white, fontSize: 12.sp),
                      ),
                    ),
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
