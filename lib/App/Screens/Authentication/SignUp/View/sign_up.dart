import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msm_unify/App/Screens/Authentication/SignUp/Controller/sign_up_controller.dart';

import '../../../../common/color_constant.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      child: Image.network(
                        "https://app.msmunify.com/assets/img/MyMSM_logo_1.png",
                        width: 100,
                      )),
                ),
              ),
              SizedBox(
                width: 100.sw,
                height: 180.h,
                child: Image.network(
                  "https://msquaremedia.com/wp-content/uploads/2020/06/LOGIN-PAGE2-1024x804.png",
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Sign-Up',
                    style: GoogleFonts.notoSerifGeorgian(
                      color: kColorPrimary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                    'All the details has to be as per the Company Registration Certificate. ',
                    style: GoogleFonts.notoSerifGeorgian(
                      color: kColorPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              Row(
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.all(kColorPrimary),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.grey)),
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text("Agent"),
                  Checkbox(
                    fillColor: MaterialStateProperty.all(kColorPrimary),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.grey)),
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text("Institution")
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Institution name',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Address',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'City',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Country',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Province',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Zip/Postal Code',
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
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Text(
                    "Please add details of Founder/ CEO/Owner of the Institution."),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Phone',
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
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Text("Please add details of Primary Contact Person."),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Name',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Phone',
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
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all(kColorPrimary),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: Colors.grey)),
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text("I consent to the MSM Unify Terms of Service"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 20),
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      //controller.loginCredentials();
                    },
                    elevation: 0,
                    color: kColorPrimary,
                    minWidth: 100.sw,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.notoSerifGeorgian(
                          color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 20),
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      Get.back();
                    },
                    elevation: 0,
                    color: kColorYellow,
                    minWidth: 100.sw,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Already have an account',
                      style: GoogleFonts.notoSerifGeorgian(
                          color: Colors.black, fontSize: 12.sp),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
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
    );
  }
}
