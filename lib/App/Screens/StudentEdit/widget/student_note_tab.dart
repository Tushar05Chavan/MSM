import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/model/responseModek/get_student_notes_response_model.dart';
import 'package:msm_unify/model/responseModek/student_note_response_model.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
import 'package:msm_unify/viewModel/get_notes_view_model.dart';
import 'package:msm_unify/viewModel/get_student_notes_view_model.dart';
import 'package:msm_unify/viewModel/student_note_view_model.dart';

import '../../../common/color_constant.dart';

class StdNoteTab extends StatefulWidget {
  final StudentViewResponseModel? data;
  const StdNoteTab({Key? key, this.data}) : super(key: key);

  @override
  State<StdNoteTab> createState() => _StdNoteTabState();
}

class _StdNoteTabState extends State<StdNoteTab> {
  final GetStudentNotesViewModel _getStudentNotesViewModel =
      Get.put(GetStudentNotesViewModel());

  @override
  void initState() {
    _getStudentNotesViewModel.getStudentNotesViewModel(
        activityId: widget.data!.genInfo!.studentId);
    super.initState();
  }

  TextEditingController _notes = TextEditingController();
  void showInSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        backgroundColor: kGreen,
        content: Text(
          'Add Note Successfully',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  void showInErrorSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        backgroundColor: kRed,
        content: Text(
          'Somthing Went Wrong',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      "Student's Comments",
                      style: TextStyle(
                          color: kNavy,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: Get.height * 0.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: kGrey4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _notes,
                      cursorColor: kRed,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.2),
                              fontFamily: 'Roboto'),
                          hintText: 'Write your notes here.....',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.005,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Comments will be emailed to the Admission Executive.',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontFamily: 'Roboto',
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                InkWell(
                  onTap: () {
                    Map<String, dynamic> map = {
                      "ActivityType": "10",
                      "StatusId": 0,
                      "Priority": -1,
                      "ApplicationId": widget.data!.genInfo!.studentId,
                      "Remark": _notes.text,
                    };
                    _getStudentNotesViewModel
                        .addStudentNotesViewModel(map)
                        .whenComplete((() {
                      _notes.clear();
                      Future.delayed(Duration(seconds: 4), () {
                        setState(() {
                          _getStudentNotesViewModel.getStudentNotesViewModel(
                              activityId: map["ApplicationId"]);
                        });
                      });
                    }));

                    if (_getStudentNotesViewModel.apiResponse.status ==
                        Status.COMPLETE) {
                      setState(() {
                        showInSnackBar();
                      });
                    } else {
                      if (_getStudentNotesViewModel.apiResponse.status ==
                          Status.ERROR) {
                        showInErrorSnackBar();
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: Get.height * 0.05,
                    width: Get.width * 0.29,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: kNavy, style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.add,
                          color: kNavy,
                        ),
                        Flexible(
                          child: Text(
                            'Add More',
                            style: TextStyle(
                              color: kNavy,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.07),
                GetBuilder<GetStudentNotesViewModel>(
                  builder: (controller) {
                    if (controller.apiResponse.status == Status.COMPLETE) {
                      List<GetStudentNotesResponseModel> response =
                          controller.apiResponse.data;
                      print('RESPONSEEEE>>>>> $response');
                      return Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: response.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "${response[index].activityRemark}/${response[index].activityStamp}/${response[index].displayName}",
                                        style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            color: kRed),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(color: kGrey, height: 2),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${response[index].activityRemark}",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          color: Colors.black.withOpacity(0.6)),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          },
                        ),
                      );
                    } else if (controller.apiResponse.status == Status.ERROR) {
                      return const CircularProgressIndicator();
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                supportSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
