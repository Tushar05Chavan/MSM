import 'package:flutter/material.dart';
import 'package:msm_unify/App/common/color_constant.dart';

TextFormField commontextfiled({
  String? hintText,
  Text? labelText,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    cursorColor: kRed,
    decoration: InputDecoration(
        label: labelText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.black,
            )),
        hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.7), fontFamily: 'Roboto'),
        hintText: hintText,

        // 'Please specify  Major/Concentration',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        )),
  );
}
