import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/what_do_you_want_response_model.dart';

class StudiesDialog extends StatefulWidget {
  final List<WhatDoYouWantResponseModel> response;
  final Function(String) onSubmit;
  StudiesDialog({Key? key, required this.onSubmit, required this.response})
      : super(key: key);

  @override
  _StudiesDialogState createState() => _StudiesDialogState();
}

class _StudiesDialogState extends State<StudiesDialog> {
  List<WhatDoYouWantResponseModel> responseDummy = [];

  @override
  void initState() {
    responseDummy.addAll(widget.response);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.70,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: Get.height * 0.03,
                  width: Get.width * 0.07,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 5,
          // ),
          // TextFormField(
          //   onChanged: (_) {
          //     setState(() {
          //       if (_.length != 0) {
          //         List<String> toRemove = [];
          //         responseDummy.addAll(widget.response);
          //         responseDummy.forEach((element) {
          //           element.data.forEach((e) {
          //             if (!e.contains(_)) {
          //               toRemove.add(e);
          //             }
          //           });
          //         });
          //         print(toRemove);
          //         responseDummy.removeWhere((element) {

          //           toRemove.forEach((e) {

          //           });
          //         });
          //         // responseDummy.removeWhere((element) => element.data
          //         //     .where((e) => toRemove.contains(e))
          //         //     .toList()
          //         //     .isNotEmpty);
          //       } else {
          //         responseDummy.addAll(widget.response);
          //       }
          //     });
          //   },
          //   decoration: InputDecoration(
          //       hintStyle: TextStyle(color: Colors.black.withOpacity(0.2)),
          //       hintText: 'What do you want to study ?',
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       )),
          // ),
          const SizedBox(
            height: 30,
          ),
          Expanded(child: ListView.builder(itemBuilder: (con, index) {
            final data = responseDummy[index];
            return Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.label,

                  //textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kGrey5,
                    fontSize: 15,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: kRedLight,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(data.data.length, (index) {
                    return InkWell(
                        onTap: () {
                          widget.onSubmit(data.data[index]);

                          Get.back();
                        },
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Flexible(child: Text(data.data[index])),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: kGrey6,
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ));
                  }),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            );
          }))
          // Column(
          //   // mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: List.generate(responseDummy.length, (index) {

          //   }),
          // ),
        ],
      ),
    );
  }
}
