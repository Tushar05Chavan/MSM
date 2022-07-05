import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msm_unify/App/Screens/Authentication/Login/Views/login_screen.dart';
import 'package:msm_unify/App/common/color_constant.dart';

import '../../../viewModel/forgot_password_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotPasswordViewModel _forgotPasswordViewModel =
      Get.put(ForgotPasswordViewModel());

  final _form = GlobalKey<FormState>();
  TextEditingController _useName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Form(
              key: _form,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Container(
                  height: Get.height * 1,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Color(0xff008CBA),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
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
                      SizedBox(
                        height: Get.height * 0.09,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Forgot Password',
                            style: GoogleFonts.notoSerifGeorgian(
                              color: kColorPrimary,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: SizedBox(
                          width: Get.width * 0.60,
                          child: TextFormField(
                            controller: _useName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "UserName is Required";
                              } else if (!RegExp(r'\S+@\S+\.\S+')
                                  .hasMatch(value)) {
                                return "Enter Valid UserName";
                              }
                            },
                            onChanged: (value) {
                              _forgotPasswordViewModel.changeStatus(false);
                            },
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 18),
                              hintText: 'Enter Username',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: GetBuilder<ForgotPasswordViewModel>(
                          builder: (controller) {
                            return MaterialButton(
                              onPressed: () async {
                                if (_form.currentState!.validate()) {
                                  controller.changeLoadingState(true);
                                  var m =
                                      await controller.forgotPasswordViewModel(
                                          username: _useName.text);
                                  if (m == 'OK') {
                                    print('123');
                                    controller.changeLoadingState(false);
                                    controller.changeStatus(true);
                                  } else {
                                    controller.changeLoadingState(false);
                                    controller.changeStatus(false);
                                  }
                                }
                              },
                              elevation: 0,
                              color: kColorPrimary,
                              minWidth: 150.w,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Reset',
                                style: GoogleFonts.notoSerifGeorgian(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                            );
                          },
                        ),
                      ),
                      Obx(() => _forgotPasswordViewModel.status.value == true
                          ? const Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                'Reset link sent on your registered mail.',
                                style: TextStyle(
                                  color: Color(0xff4caf50),
                                  fontSize: 14,
                                ),
                              ),
                            )
                          : SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<ForgotPasswordViewModel>(
              builder: (controller) => controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox(),
            ),
            Positioned(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
