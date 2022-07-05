import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.18,
                            ),
                            Container(
                              height: Get.height * 0.10,
                              width: Get.width * 0.25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logout.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.13,
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: Get.height * 0.03,
                                width: Get.width * 0.06,
                                decoration: BoxDecoration(
                                    color: kRed,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Text(
                          'Are you sure, you want to logout?',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                              // fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: Get.height * 0.07,
                        ),
                        InkWell(
                          child: Container(
                            height: Get.height * 0.065,
                            width: Get.width * 0.60,
                            decoration: BoxDecoration(
                                color: kRed,
                                borderRadius: BorderRadius.circular(13)),
                            child: const Center(
                              child: Text('Yes, I am sure!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto')),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        InkWell(
                          child: Container(
                            height: Get.height * 0.065,
                            width: Get.width * 0.38,
                            decoration: BoxDecoration(
                                border: Border.all(color: kRed),
                                borderRadius: BorderRadius.circular(13)),
                            child: const Center(
                              child: Text('No',
                                  style: TextStyle(
                                      color: kRed,
                                      fontSize: 16,
                                      fontFamily: 'Roboto')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
        child: Container(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
