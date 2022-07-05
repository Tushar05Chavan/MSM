import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../color_constant.dart';

Container supportSection() {
  return Container(
    height: 55,
    width: Get.width,
    decoration: BoxDecoration(
      color: kGrey2,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      border: Border.all(color: kBorderGrey),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Support Email: support@msmunify.com',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kDarkGrey,
          ),
        ),
        Text(
          '© 2022 v2.1.9',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kDarkGrey,
          ),
        ),
      ],
    ),
  );
}
