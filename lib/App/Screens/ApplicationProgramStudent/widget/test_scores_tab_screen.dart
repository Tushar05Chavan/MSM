import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/App/Screens/Reports/widget/institution_dropdown.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/test_score_exam_drop_response_model.dart';
import 'package:msm_unify/viewModel/test_score_exam_drop_view_model.dart';

class TestScoresTabScreen extends StatefulWidget {
  const TestScoresTabScreen({Key? key}) : super(key: key);

  @override
  _TestScoresTabScreenState createState() => _TestScoresTabScreenState();
}

class _TestScoresTabScreenState extends State<TestScoresTabScreen> {
  String? selectedExam;
  String? selected;
  final List<String> _exam = ['Duolingo', 'IELTS', 'PTE', 'Toffel'];
  final List<String> _selected = ['None', 'ACT', 'GRE', 'Toffel'];
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final TextEditingController _dob = TextEditingController();

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
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'English Proficiency Test',
                  style: TextStyle(
                      color: kNavy, fontSize: 14, fontFamily: 'Nunito'),
                ),
                const SizedBox(
                  height: 20,
                ),
                examDropDown(selectedExam: _selectedExam, exam: exams),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _dob,
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
                          _dob.text = formatter.format(date);
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
                      hintText: '06/05/2022',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'DD/MM/YYY',
                  style: TextStyle(fontSize: 9, fontFamily: 'Roboto'),
                ),
                const SizedBox(
                  height: 5,
                ),
                commontextfiled(hintText: '10'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Other Exams',
                  style: TextStyle(
                      color: kNavy, fontSize: 14, fontFamily: " Nunito"),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(5),
                      hint: const Text("None"),
                      value: selected,
                      items: _selected.map((exam) {
                        return DropdownMenuItem(
                            value: exam,
                            child: Text(
                              exam,
                              style: const TextStyle(
                                  color: kGrey4,
                                  fontFamily: "Roboto",
                                  fontSize: 13),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selected = newValue as String?;
                        });
                      }),
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: Get.width * 0.20,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
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
