import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/application_view_response_model.dart';
import 'package:msm_unify/model/responseModek/exam_type_response_model.dart';
import 'package:msm_unify/viewModel/exam_type_view_model.dart';
import 'package:msm_unify/viewModel/test_score_update_view_model.dart';

import '../../ApplicationProgramStudent/widget/application_program_personal_info_tab.dart';

class TestScoreTab extends StatefulWidget {
  final ApplicationViewResponseModel data;

  const TestScoreTab({super.key, required this.data});
  @override
  _TestScoreTabState createState() => _TestScoreTabState();
}

class _TestScoreTabState extends State<TestScoreTab> {
  final _date = TextEditingController();
  final _listening = TextEditingController();
  final _reading = TextEditingController();
  final _writing = TextEditingController();
  final _speaking = TextEditingController();
  final _overAll = TextEditingController();

  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  String? _selectedExam;
  final List<String> _exam = [
    'IELTS',
    'PTE',
    'ESOL',
    'Not Applicable',
    'Oxford Online'
  ];

  String? _otherExam;
  final List<String> _exams = [
    'None',
    'ACT',
    'GMAT',
    'GRE',
  ];

  bool duolingo = false;

  void showInSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        backgroundColor: kGreen,
        content: Text(
          'Update Successfully',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  void showInErrorSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: kRed,
        content: Text(
          'Update Successfully',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  final ExamTypeViewModel _examTypeViewModel = Get.put(ExamTypeViewModel());
  List<ExamTypeResponseModel> getExams = [];
  Future<void> getExamType() async {
    await _examTypeViewModel.examTypeViewModel();
    List<ExamTypeResponseModel> response = _examTypeViewModel.apiResponse.data;
    response.forEach((element) {
      getExams.add(element);
    });
  }

  final TextScoreUpdateViewModel _textScoreUpdateViewModel =
      Get.put(TextScoreUpdateViewModel());
  @override
  void initState() {
    _date.text = widget.data.testScore!.englishExamDate.toString();
    _listening.text = widget.data.testScore!.englishScoreL.toString();
    _reading.text = widget.data.testScore!.englishScoreR.toString();
    _writing.text = widget.data.testScore!.englishScoreW.toString();
    _speaking.text = widget.data.testScore!.englishScoreS.toString();
    _overAll.text = widget.data.testScore!.englishScoreOverall.toString();
    getExamType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'English',
                  style: TextStyle(
                    color: kNavy,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return SimpleDialog(
                              shape: ContinuousRectangleBorder(
                                  side: const BorderSide(color: kRed),
                                  borderRadius: BorderRadius.circular(15)),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              'Test Score',
                                              style: TextStyle(
                                                  color: kNavy,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                              onTap: () {
                                                Get.back();
                                                setState(() {
                                                  duolingo = false;
                                                });
                                              },
                                              child: Container(
                                                height: Get.height * 0.03,
                                                width: Get.width * 0.08,
                                                decoration: BoxDecoration(
                                                    color: kRed,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'English Exam',
                                            style: TextStyle(
                                                color: kNavy,
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: Text(
                                                "${widget.data.testScore!.englishExamName}"),
                                            decoration: InputDecoration(
                                              label: const Text(
                                                ' English Exam Type',
                                              ),
                                              labelStyle: const TextStyle(
                                                fontFamily: 'Roboto',
                                                color: kGrey4,
                                              ),
                                              // enabledBorder: OutlineInputBorder(
                                              //     borderRadius: BorderRadius.circular(15),
                                              //     borderSide: BorderSide(
                                              //         color: kGrey4, width: 1)),
                                              //labelText: 'Exam Type',
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: kGrey, width: 2)),
                                              border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: kGrey4, width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                            value: _selectedExam,
                                            items: getExams.map((exam) {
                                              return DropdownMenuItem(
                                                  value: exam.reqId.toString(),
                                                  child: Text(
                                                    exam.reqName.toString(),
                                                    style: const TextStyle(
                                                        color: kGrey4,
                                                        fontFamily: "Roboto",
                                                        fontSize: 13),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedExam =
                                                    newValue as String?;
                                                print(
                                                    '_selectedexam==$_selectedExam');
                                                if (_selectedExam == "8") {
                                                  _examTypeViewModel
                                                      .setExamName('Duolingo');
                                                  print(
                                                      'EXAM NAME${_examTypeViewModel.examName}');
                                                  duolingo = true;
                                                } else if (_selectedExam ==
                                                    "6") {
                                                  _examTypeViewModel
                                                      .setExamName('CAEL');
                                                } else if (_selectedExam ==
                                                    "11") {
                                                  _examTypeViewModel
                                                      .setExamName(
                                                          'Cambridge English');
                                                } else if (_selectedExam ==
                                                    "9") {
                                                  _examTypeViewModel
                                                      .setExamName('ESOL');
                                                } else if (_selectedExam ==
                                                    "1") {
                                                  _examTypeViewModel
                                                      .setExamName('IELTS');
                                                } else if (_selectedExam ==
                                                    "5") {
                                                  _examTypeViewModel
                                                      .setExamName('MELAB');
                                                } else if (_selectedExam ==
                                                    "-1") {
                                                  _examTypeViewModel
                                                      .setExamName(
                                                          'Not Application');
                                                } else if (_selectedExam ==
                                                    "10") {
                                                  _examTypeViewModel
                                                      .setExamName(
                                                          'oxford Online');
                                                } else if (_selectedExam ==
                                                    "2") {
                                                  _examTypeViewModel
                                                      .setExamName('PTE');
                                                } else if (_selectedExam ==
                                                    "7") {
                                                  _examTypeViewModel
                                                      .setExamName('TOEFL CBT');
                                                } else if (_selectedExam ==
                                                    "3") {
                                                  _examTypeViewModel
                                                      .setExamName('TOEFL iBT');
                                                } else if (_selectedExam ==
                                                    "4") {
                                                  _examTypeViewModel
                                                      .setExamName('TOEFL PBT');
                                                }
                                              });
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      GetBuilder<ExamTypeViewModel>(
                                        builder: (controller) {
                                          if (controller.examName == 'IELTS') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  controller: _date,
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                Column(
                                                  children: [
                                                    CommonTextField(
                                                      control: _listening,
                                                      lableText: "Listing",
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _reading,
                                                      title: 'Reading',
                                                      lableText: 'Reading',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _writing,
                                                      title: 'Writing',
                                                      lableText: 'Writing',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _speaking,
                                                      title: 'Speaking',
                                                      lableText: 'Speaking',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _overAll,
                                                      title: 'Overall',
                                                      lableText: 'Overall',
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'Duolingo') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  controller: _date,
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                CommonTextField(
                                                  control: _overAll,
                                                  title: 'Overall',
                                                  lableText: 'Overall',
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'CAEL') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  controller: _date,
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                Column(
                                                  children: [
                                                    CommonTextField(
                                                      control: _listening,
                                                      lableText: "Listing",
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _reading,
                                                      title: 'Reading',
                                                      lableText: 'Reading',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _writing,
                                                      title: 'Writing',
                                                      lableText: 'Writing',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _speaking,
                                                      title: 'Speaking',
                                                      lableText: 'Speaking',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _overAll,
                                                      title: 'Overall',
                                                      lableText: 'Overall',
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'Cambridge English') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  controller: _date,
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                Column(
                                                  children: [
                                                    CommonTextField(
                                                      control: _listening,
                                                      lableText: "Listing",
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _reading,
                                                      title: 'Reading',
                                                      lableText: 'Reading',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _writing,
                                                      title: 'Writing',
                                                      lableText: 'Writing',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _speaking,
                                                      title: 'Speaking',
                                                      lableText: 'Speaking',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    CommonTextField(
                                                      control: _overAll,
                                                      title: 'Overall',
                                                      lableText: 'Overall',
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'ESOL') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  controller: _date,
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                CommonTextField(
                                                  control: _overAll,
                                                  title: 'Overall',
                                                  lableText: 'Overall',
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'MELAB') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  controller: _date,
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                Column(
                                                  children: [
                                                    const CommonTextField(
                                                      lableText: "Listing",
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'GCVR *',
                                                      lableText: 'Reading',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Writing',
                                                      lableText: 'Writing',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Speaking',
                                                      lableText: 'Speaking',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Final MELAB*',
                                                      lableText: 'Final MELAB*',
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'Not Application') {
                                            return Column(
                                              children: const [
                                                CommonTextField(
                                                  title: 'Remark * *',
                                                  lableText: 'Remark *',
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'oxford Online') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                const CommonTextField(
                                                  title: 'Listing *',
                                                  lableText: 'Listing *',
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                const CommonTextField(
                                                  title: 'English *',
                                                  lableText: 'English *',
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                const CommonTextField(
                                                  title: 'Overall *',
                                                  lableText: 'Overall *',
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'PTE') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                Column(
                                                  children: [
                                                    const CommonTextField(
                                                      lableText: "Listing",
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Reading',
                                                      lableText: 'Reading',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Writing',
                                                      lableText: 'Writing',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Speaking',
                                                      lableText: 'Speaking',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Overall',
                                                      lableText: 'Overall',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Username',
                                                      lableText: 'Username',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Password',
                                                      lableText: 'Password',
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'TOEFL CBT') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                Column(
                                                  children: [
                                                    const CommonTextField(
                                                      lableText: "Listing",
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Reading',
                                                      lableText: 'Reading',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Writing',
                                                      lableText: 'Writing',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Speaking',
                                                      lableText: 'Speaking',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Overall',
                                                      lableText: 'Overall',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Username',
                                                      lableText: 'Username',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Password',
                                                      lableText: 'Password',
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'TOEFL iBT') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                Column(
                                                  children: [
                                                    const CommonTextField(
                                                      lableText: "Listing",
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Reading',
                                                      lableText: 'Reading',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Writing',
                                                      lableText: 'Writing',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Speaking',
                                                      lableText: 'Speaking',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Overall',
                                                      lableText: 'Overall',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Username',
                                                      lableText: 'Username',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Password',
                                                      lableText: 'Password',
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          } else if (controller.examName ==
                                              'TOEFL PBT') {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  cursorColor: kRed,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                            Icons.today),
                                                        onPressed: () async {
                                                          DateTime date =
                                                              DateTime(1900);
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  FocusNode());

                                                          date = (await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate: DateTime
                                                                  .now()))!;
                                                          _date.text = formatter
                                                              .format(date);
                                                        },
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          fontFamily: 'Roboto'),
                                                      hintText:
                                                          '${widget.data.testScore!.englishExamDate}',
                                                      label: const Text(
                                                          'DD/MM/YYYY'),
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: kGrey4,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                Column(
                                                  children: [
                                                    const CommonTextField(
                                                      lableText: "Listing",
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Reading',
                                                      lableText: 'Reading',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Writing',
                                                      lableText: 'Writing',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Speaking',
                                                      lableText: 'Speaking',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Overall',
                                                      lableText: 'Overall',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Username',
                                                      lableText: 'Username',
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    const CommonTextField(
                                                      title: 'Password',
                                                      lableText: 'Password',
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                              ],
                                            );
                                          }
                                          return SizedBox();
                                        },
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Other Exam',
                                            style: TextStyle(
                                                color: kNavy,
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Other Exam"),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: kGrey4, width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              label: const Text('Other Exam'),
                                              labelStyle: const TextStyle(
                                                fontFamily: 'Roboto',
                                                color: kGrey4,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: kGrey, width: 2)),
                                            ),
                                            value: _otherExam,
                                            items: _exams.map((exams) {
                                              return DropdownMenuItem(
                                                  value: exams,
                                                  child: Text(
                                                    exams,
                                                    style: const TextStyle(
                                                        color: kGrey4,
                                                        fontFamily: "Roboto",
                                                        fontSize: 13),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _otherExam =
                                                    newValue as String?;
                                              });
                                            }),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _textScoreUpdateViewModel
                                              .textScoreUpdateViewModel(
                                            applicationId: widget
                                                .data.genInfo!.applicationId,
                                            studentId:
                                                widget.data.genInfo!.studentId,
                                            listing: widget
                                                .data.testScore!.englishScoreL,
                                            reading: widget
                                                .data.testScore!.englishScoreR,
                                            speaking: widget
                                                .data.testScore!.englishScoreS,
                                            overAll: widget.data.testScore!
                                                .englishScoreOverall,
                                          );
                                          if (_textScoreUpdateViewModel
                                                  .apiResponse.status ==
                                              Status.COMPLETE) {
                                            showInSnackBar();
                                            Get.back();
                                            setState(() {});
                                          } else {
                                            if (_textScoreUpdateViewModel
                                                    .apiResponse.status ==
                                                Status.ERROR) {
                                              showInErrorSnackBar();
                                            }
                                            showInErrorSnackBar();
                                          }
                                        },
                                        child: Container(
                                          width: Get.width * 0.30,
                                          height: Get.height * 0.04,
                                          decoration: BoxDecoration(
                                            color: kRed,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: const Center(
                                              child: Text(
                                            'Update',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Colors.white),
                                          )),
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
                    );
                  },
                  child: Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.09,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8),
                        )),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Exam',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.testScore!.englishExamName}',
                    style: const TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Exam Date',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.testScore!.englishExamDate}',
                    style: const TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overall',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.testScore!.englishScoreOverall}',
                    style: const TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reading',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.testScore!.englishScoreR}',
                    style: const TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Writing',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.testScore!.englishScoreW}',
                    style: const TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Listening',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.testScore!.englishScoreL}',
                    style: const TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.12,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Speaking',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.testScore!.englishScoreS}',
                    style: const TextStyle(
                        color: Color(0xff192A3E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            supportSection(),
          ],
        ),
      ),
    );
  }
}
