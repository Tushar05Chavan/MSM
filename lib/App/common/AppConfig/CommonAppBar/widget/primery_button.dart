import 'package:flutter/material.dart';

import '../../../color_constant.dart';

class PrimeryButton extends StatelessWidget {
  PrimeryButton(
      {Key? key, required this.callBack, required this.title, this.color})
      : super(key: key);
  Function callBack;
  String title;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callBack(),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 6),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color ?? kNavy,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
