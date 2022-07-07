import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  bool _checkvalue = false;
  final _cmtController = TextEditingController();
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.red)),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(children: [
                          const Text(
                            'Feedback',
                            style: TextStyle(
                                color: kNavy,
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: Get.height * 0.04,
                              width: Get.width * 0.08,
                              decoration: BoxDecoration(
                                  color: kRed,
                                  borderRadius: BorderRadius.circular(5)),
                                  child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Container(
                          height: Get.height * 0.2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: kGrey4),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            controller: _cmtController,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.2)),
                                hintText: 'Write down your comments here.....',
                                border: InputBorder.none),
                          ),
                        ),
                        Row(
                          children: [
                            StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return Checkbox(
                                  activeColor: Colors.red,
                                  value: _checkvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      _checkvalue = value!;
                                    });
                                  },
                                );
                              },
                            ),
                            Text(
                              "Include Screenshot",
                            ),
                          ],
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kRed),
                          child: const Center(
                            child: Text(
                              'Update',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Recent Feedbacks',
                                style: TextStyle(color: kRed),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: Get.height * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: kGrey4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Text('Its an amazing app ever',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontFamily: 'Roboto',
                                        fontSize: 15)),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                const Text('ScreenShot',
                                    style: TextStyle(
                                        color: kRed,
                                        fontFamily: 'Roboto',
                                        fontSize: 15)),
                                SizedBox(
                                  height: Get.height * 0.15,
                                )
                              ],
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
