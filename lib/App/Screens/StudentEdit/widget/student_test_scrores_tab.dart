import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/App/Screens/Reports/widget/institution_dropdown.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/model/responseModek/test_score_exam_drop_response_model.dart';
import 'package:msm_unify/viewModel/test_score_exam_drop_view_model.dart';

import '../../../common/color_constant.dart';

class StdTestScoreTab extends StatefulWidget {
  const StdTestScoreTab({Key? key}) : super(key: key);

  @override
  State<StdTestScoreTab> createState() => _StdTestScoreTabState();
}

class _StdTestScoreTabState extends State<StdTestScoreTab> {
  final _date = TextEditingController();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  TestScoreExamDropdownViewModel examDropdownViewModel =
      Get.put(TestScoreExamDropdownViewModel());

  String? _selectedExam;
  List<ExamDropResponseModel> exams = [];
  Future<void> getExam() async {
    await examDropdownViewModel.testScoreExamDropdownViewModel();
    List<ExamDropResponseModel> response =
        examDropdownViewModel.apiResponse.data;

    response.forEach((element) {
      exams.add(element);
    });
    setState(() {});
  }

  String? _selectedTest;
  final List<String> _test = ['None', 'ACT', 'GMAT', 'GRE', 'SAT'];

  @override
  void initState() {
    getExam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'English Proficiency Test',
                      style: TextStyle(
                          color: kNavy,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                examDropDown(selectedExam: _selectedExam, exam: exams),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                TextFormField(
                  controller: _date,
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.today),
                        onPressed: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());

                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now()))!;
                          _date.text = formatter.format(date);
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'DD/MM/YYYY',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                TextFormField(
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: '10',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Other Exams',
                      style: TextStyle(
                          color: kNavy,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator: (title) {
                        if (title != null) {
                          return "Please Select Other Exam";
                        }
                      },
                      borderRadius: BorderRadius.circular(5),
                      hint: const Text("None"),
                      value: _selectedTest,
                      items: _test.map((countryEducation) {
                        return DropdownMenuItem(
                            value: countryEducation,
                            child: Text(
                              countryEducation,
                              style: const TextStyle(
                                  color: kGrey4,
                                  fontFamily: "Roboto",
                                  fontSize: 13),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedTest = newValue as String?;
                        });
                      }),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                _selectedTest == "ACT"
                    ? Column(
                        children: [
                          //
                          Text("AMT")
                        ],
                      )
                    : _selectedTest == "GMAT"
                        ? Column(
                            children: [Text("GMAT")],
                          )
                        : _selectedTest == "GRE"
                            ? Column(
                                children: [Text("GRE")],
                              )
                            : _selectedTest == "SAT"
                                ? Column(
                                    children: [Text("SAT")],
                                  )
                                : Container(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.20,
                    decoration: BoxDecoration(
                      color: kGreen1,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.22,
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
