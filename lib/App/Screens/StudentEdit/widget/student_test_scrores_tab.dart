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

  //English Proficiency Test all Controllers

  // 1. CAEL Controllers
  TextEditingController cael_Date = new TextEditingController();
  TextEditingController cael_Listening = new TextEditingController();
  TextEditingController cael_Reading = new TextEditingController();
  TextEditingController cael_Writing = new TextEditingController();
  TextEditingController cael_Speaking = new TextEditingController();
  TextEditingController cael_Overall = new TextEditingController();

  // 2. Cambridge English Controllers
  TextEditingController ce_Date = new TextEditingController();
  TextEditingController ce_Listening = new TextEditingController();
  TextEditingController ce_Reading = new TextEditingController();
  TextEditingController ce_Writing = new TextEditingController();
  TextEditingController ce_Speaking = new TextEditingController();
  TextEditingController ce_Overall = new TextEditingController();

  // 3. Duolingo Controllers
  TextEditingController du_Date = new TextEditingController();
  TextEditingController du_Overall = new TextEditingController();

  // 4. ESOL Controllers
  TextEditingController esol_Date = new TextEditingController();
  TextEditingController esol_Overall = new TextEditingController();

  // 5. CAEL Controllers
  TextEditingController ielts_Date = new TextEditingController();
  TextEditingController ielts_Listening = new TextEditingController();
  TextEditingController ielts_Reading = new TextEditingController();
  TextEditingController ielts_Writing = new TextEditingController();
  TextEditingController ielts_Speaking = new TextEditingController();
  TextEditingController ielts_Overall = new TextEditingController();

  // 6. MELAB Controllers
  TextEditingController melab_Date = new TextEditingController();
  TextEditingController melab_Listening = new TextEditingController();
  TextEditingController melab_GCVR = new TextEditingController();
  TextEditingController melab_Writing = new TextEditingController();
  TextEditingController melab_Speaking = new TextEditingController();
  TextEditingController melab_Final = new TextEditingController();

  // 7. Not Applicable Controllers
  TextEditingController na__Remark = new TextEditingController();

  // 8. Oxford Online Controllers
  TextEditingController ox_Date = new TextEditingController();
  TextEditingController ox_Listening = new TextEditingController();
  TextEditingController ox_English = new TextEditingController();
  TextEditingController ox_Overall = new TextEditingController();

  // 9. PTE Controllers
  TextEditingController pte_date = new TextEditingController();
  TextEditingController pte_Listening = new TextEditingController();
  TextEditingController pte_Reading = new TextEditingController();
  TextEditingController pte_Writing = new TextEditingController();
  TextEditingController pte_Speaking = new TextEditingController();
  TextEditingController pte_Overall = new TextEditingController();
  TextEditingController pte_Username = new TextEditingController();
  TextEditingController pte_Password = new TextEditingController();

  // 9. PTE Controllers
  TextEditingController cbt_date = new TextEditingController();
  TextEditingController cbt_Listening = new TextEditingController();
  TextEditingController cbt_Reading = new TextEditingController();
  TextEditingController cbt_Writing = new TextEditingController();
  TextEditingController cbt_Speaking = new TextEditingController();
  TextEditingController cbt_Overall = new TextEditingController();
  TextEditingController cbt_Username = new TextEditingController();
  TextEditingController cbt_Password = new TextEditingController();

  // 10. IBT Controllers
  TextEditingController ibt_date = new TextEditingController();
  TextEditingController ibt_Listening = new TextEditingController();
  TextEditingController ibt_Reading = new TextEditingController();
  TextEditingController ibt_Writing = new TextEditingController();
  TextEditingController ibt_Speaking = new TextEditingController();
  TextEditingController ibt_Overall = new TextEditingController();
  TextEditingController ibt_Username = new TextEditingController();
  TextEditingController ibt_Password = new TextEditingController();

  // 11. PBT Controllers
  TextEditingController pbt_date = new TextEditingController();
  TextEditingController pbt_Listening = new TextEditingController();
  TextEditingController pbt_Reading = new TextEditingController();
  TextEditingController pbt_Writing = new TextEditingController();
  TextEditingController pbt_Speaking = new TextEditingController();
  TextEditingController pbt_Overall = new TextEditingController();
  TextEditingController pbt_Username = new TextEditingController();
  TextEditingController pbt_Password = new TextEditingController();

  //Exam Types controllers

  // 1. ACT Controllers
  TextEditingController act_Date = new TextEditingController();
  TextEditingController act_English = new TextEditingController();
  TextEditingController act_Maths = new TextEditingController();
  TextEditingController act_Reading = new TextEditingController();
  TextEditingController act_Science = new TextEditingController();
  TextEditingController act_Writing = new TextEditingController();
  TextEditingController act_TotalScore = new TextEditingController();

  // 2. GMAT Controllers
  TextEditingController gmat_Date = new TextEditingController();
  TextEditingController gmat_Verbal = new TextEditingController();
  TextEditingController gmat_Quantitative = new TextEditingController();
  TextEditingController gmat_Analytical = new TextEditingController();
  TextEditingController gmat_Total = new TextEditingController();

  // 3. GRE Controllers
  TextEditingController gre_Date = new TextEditingController();
  TextEditingController gre_Verbal = new TextEditingController();
  TextEditingController gre_Quantitative = new TextEditingController();
  TextEditingController gre_Analytical = new TextEditingController();

  // 4. SAT Controllers
  TextEditingController sat_Date = new TextEditingController();
  TextEditingController sat_Maths = new TextEditingController();
  TextEditingController sat_RW = new TextEditingController();
  TextEditingController sat_TotalScore = new TextEditingController();

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
                examDropDown(
                    selectedExam: _selectedExam,
                    exam: exams,
                    onChanged: (exam) {
                      setState(() {
                        _selectedExam = exam;
                      });
                    }),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                _selectedExam == "CAEL" // CAEL
                    ? Column(
                        children: [
                          SizedBox(height: Get.height * 0.01),
                          TextFormField(
                            controller: cael_Date,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Enter valid date";
                              }
                            },
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.today),
                                  onPressed: () async {
                                    DateTime date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());

                                    date = (await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now()))!;
                                    cael_Date.text = formatter.format(date);
                                  },
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Exam Date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text('DD/MM/YYYY',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5))),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          TextFormField(
                            controller: cael_Listening,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Enter valid score";
                              }
                              // if(cael_Listening.value < 10 || value > 90) {
                              //   return "Value should be in between 10 to 90";
                              // }
                            },
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Listening',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            controller: cael_Reading,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Reading',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            controller: cael_Writing,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Writing',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            controller: cael_Speaking,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Speaking',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            controller: cael_Overall,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Overall',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ],
                      )
                    : _selectedExam == "Cambridge English" // Cambridge English
                        ? Column(
                            children: [
                              SizedBox(height: Get.height * 0.01),
                              TextFormField(
                                controller: ce_Date,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.today),
                                      onPressed: () async {
                                        DateTime date = DateTime(1900);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());

                                        date = (await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now()))!;
                                        ce_Date.text = formatter.format(date);
                                      },
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Exam Date',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text('DD/MM/YYYY',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              TextFormField(
                                controller: ce_Listening,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Listening',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                controller: ce_Reading,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Reading',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                controller: ce_Writing,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Writing',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                controller: ce_Speaking,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Speaking',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                controller: ce_Overall,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Overall',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                            ],
                          )
                        : _selectedExam == "Duolingo" //Duolingo
                            ? Column(
                                children: [
                                  SizedBox(height: Get.height * 0.01),
                                  TextFormField(
                                    controller: du_Date,
                                    cursorColor: kRed,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: const Icon(Icons.today),
                                          onPressed: () async {
                                            DateTime date = DateTime(1900);
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());

                                            date = (await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now()))!;
                                            du_Date.text =
                                                formatter.format(date);
                                          },
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            )),
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            fontFamily: 'Roboto'),
                                        hintText: 'Exam Date',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Text('DD/MM/YYYY',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.5))),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  TextFormField(
                                    controller: du_Overall,
                                    cursorColor: kRed,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            )),
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            fontFamily: 'Roboto'),
                                        hintText: 'Overall',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                ],
                              )
                            : _selectedExam == "ESOL" //ESOL
                                ? Column(
                                    children: [
                                      SizedBox(height: Get.height * 0.01),
                                      TextFormField(
                                        controller: esol_Date,
                                        cursorColor: kRed,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: const Icon(Icons.today),
                                              onPressed: () async {
                                                DateTime date = DateTime(1900);
                                                FocusScope.of(context)
                                                    .requestFocus(FocusNode());

                                                date = (await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime.now()))!;
                                                esol_Date.text =
                                                    formatter.format(date);
                                              },
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Exam Date',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Text('DD/MM/YYYY',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.5))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      TextFormField(
                                        controller: esol_Overall,
                                        cursorColor: kRed,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Overall',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                    ],
                                  )
                                : _selectedExam == "IELTS" //IELTS
                                    ? Column(
                                        children: [
                                          SizedBox(height: Get.height * 0.01),
                                          TextFormField(
                                            controller: ielts_Date,
                                            cursorColor: kRed,
                                            decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  icon: const Icon(Icons.today),
                                                  onPressed: () async {
                                                    DateTime date =
                                                        DateTime(1900);
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            FocusNode());

                                                    date =
                                                        (await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate: DateTime
                                                                .now()))!;
                                                    ielts_Date.text =
                                                        formatter.format(date);
                                                  },
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                hintStyle: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    fontFamily: 'Roboto'),
                                                hintText: 'Exam Date',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 10),
                                              Text('DD/MM/YYYY',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          TextFormField(
                                            controller: ielts_Listening,
                                            cursorColor: kRed,
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                hintStyle: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    fontFamily: 'Roboto'),
                                                hintText: 'Listening',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.03,
                                          ),
                                          TextFormField(
                                            controller: ielts_Reading,
                                            cursorColor: kRed,
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                hintStyle: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    fontFamily: 'Roboto'),
                                                hintText: 'Reading',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.03,
                                          ),
                                          TextFormField(
                                            controller: ielts_Writing,
                                            cursorColor: kRed,
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                hintStyle: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    fontFamily: 'Roboto'),
                                                hintText: 'Writing',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.03,
                                          ),
                                          TextFormField(
                                            controller: ielts_Speaking,
                                            cursorColor: kRed,
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                hintStyle: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    fontFamily: 'Roboto'),
                                                hintText: 'Speaking',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.03,
                                          ),
                                          TextFormField(
                                            controller: ielts_Overall,
                                            cursorColor: kRed,
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.black,
                                                        )),
                                                hintStyle: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    fontFamily: 'Roboto'),
                                                hintText: 'Overall',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                        ],
                                      )
                                    : _selectedExam == "MELAB" //MELAB
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                  height: Get.height * 0.01),
                                              TextFormField(
                                                controller: melab_Date,
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

                                                        date =
                                                            (await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                firstDate:
                                                                    DateTime(
                                                                        1900),
                                                                lastDate: DateTime
                                                                    .now()))!;
                                                        melab_Date.text =
                                                            formatter
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
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        fontFamily: 'Roboto'),
                                                    hintText: 'Exam Date',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    )),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 10),
                                                  Text('DD/MM/YYYY',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.5))),
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ),
                                              TextFormField(
                                                controller: melab_Listening,
                                                cursorColor: kRed,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        fontFamily: 'Roboto'),
                                                    hintText: 'Listening',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.03,
                                              ),
                                              TextFormField(
                                                controller: melab_GCVR,
                                                cursorColor: kRed,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        fontFamily: 'Roboto'),
                                                    hintText: 'GCVR',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.03,
                                              ),
                                              TextFormField(
                                                controller: melab_Writing,
                                                cursorColor: kRed,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        fontFamily: 'Roboto'),
                                                    hintText: 'Writing',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.03,
                                              ),
                                              TextFormField(
                                                controller: melab_Speaking,
                                                cursorColor: kRed,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        fontFamily: 'Roboto'),
                                                    hintText: 'Speaking',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.03,
                                              ),
                                              TextFormField(
                                                controller: melab_Final,
                                                cursorColor: kRed,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        fontFamily: 'Roboto'),
                                                    hintText: 'Final MELAB',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    )),
                                              ),
                                            ],
                                          )
                                        : _selectedExam == "Not Applicable"
                                            ? Column(
                                                children: [
                                                  TextFormField(
                                                    controller: na__Remark,
                                                    cursorColor: kRed,
                                                    decoration: InputDecoration(
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
                                                                .withOpacity(
                                                                    0.3),
                                                            fontFamily:
                                                                'Roboto'),
                                                        hintText: 'Remark',
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        )),
                                                  ),
                                                ],
                                              )
                                            : _selectedExam ==
                                                    "Oxford Online" // Oxford Online
                                                ? Column(
                                                    children: [
                                                      SizedBox(
                                                          height: Get.height *
                                                              0.01),
                                                      TextFormField(
                                                        controller: ox_Date,
                                                        cursorColor: kRed,
                                                        decoration:
                                                            InputDecoration(
                                                                suffixIcon:
                                                                    IconButton(
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .today),
                                                                  onPressed:
                                                                      () async {
                                                                    DateTime
                                                                        date =
                                                                        DateTime(
                                                                            1900);
                                                                    FocusScope.of(
                                                                            context)
                                                                        .requestFocus(
                                                                            FocusNode());

                                                                    date = (await showDatePicker(
                                                                        context:
                                                                            context,
                                                                        initialDate:
                                                                            DateTime
                                                                                .now(),
                                                                        firstDate:
                                                                            DateTime(
                                                                                1900),
                                                                        lastDate:
                                                                            DateTime.now()))!;
                                                                    ox_Date.text =
                                                                        formatter
                                                                            .format(date);
                                                                  },
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.3),
                                                                    fontFamily:
                                                                        'Roboto'),
                                                                hintText:
                                                                    'Exam Date',
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                )),
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(width: 10),
                                                          Text('DD/MM/YYYY',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5))),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            ox_Listening,
                                                        cursorColor: kRed,
                                                        decoration:
                                                            InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.3),
                                                                    fontFamily:
                                                                        'Roboto'),
                                                                hintText:
                                                                    'Listening',
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                )),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.03,
                                                      ),
                                                      TextFormField(
                                                        controller: ox_English,
                                                        cursorColor: kRed,
                                                        decoration:
                                                            InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.3),
                                                                    fontFamily:
                                                                        'Roboto'),
                                                                hintText:
                                                                    'English',
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                )),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.03,
                                                      ),
                                                      TextFormField(
                                                        controller: ox_Overall,
                                                        cursorColor: kRed,
                                                        decoration:
                                                            InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.3),
                                                                    fontFamily:
                                                                        'Roboto'),
                                                                hintText:
                                                                    'Overall',
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                )),
                                                      ),
                                                    ],
                                                  )
                                                : _selectedExam == "PTE" //PTE
                                                    ? Column(
                                                        children: [
                                                          SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.01),
                                                          TextFormField(
                                                            controller:
                                                                pte_date,
                                                            cursorColor: kRed,
                                                            decoration:
                                                                InputDecoration(
                                                                    suffixIcon:
                                                                        IconButton(
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .today),
                                                                      onPressed:
                                                                          () async {
                                                                        DateTime
                                                                            date =
                                                                            DateTime(1900);
                                                                        FocusScope.of(context)
                                                                            .requestFocus(FocusNode());

                                                                        date = (await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                DateTime.now(),
                                                                            firstDate: DateTime(1900),
                                                                            lastDate: DateTime.now()))!;
                                                                        pte_date.text =
                                                                            formatter.format(date);
                                                                      },
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.3),
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                    hintText:
                                                                        'Exam Date',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: 10),
                                                              Text('DD/MM/YYYY',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.5))),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.02,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                pte_Listening,
                                                            cursorColor: kRed,
                                                            decoration:
                                                                InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.3),
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                    hintText:
                                                                        'Listening',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.03,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                pte_Reading,
                                                            cursorColor: kRed,
                                                            decoration:
                                                                InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.3),
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                    hintText:
                                                                        'Reading',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.03,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                pte_Writing,
                                                            cursorColor: kRed,
                                                            decoration:
                                                                InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.3),
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                    hintText:
                                                                        'Writing',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.03,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                pte_Speaking,
                                                            cursorColor: kRed,
                                                            decoration:
                                                                InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.3),
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                    hintText:
                                                                        'Speaking',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.03,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                pte_Overall,
                                                            cursorColor: kRed,
                                                            decoration:
                                                                InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.3),
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                    hintText:
                                                                        'Overall',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.03,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                pte_Username,
                                                            cursorColor: kRed,
                                                            decoration:
                                                                InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.3),
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                    hintText:
                                                                        'Username',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.03,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                pte_Password,
                                                            cursorColor: kRed,
                                                            decoration:
                                                                InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.3),
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                    hintText:
                                                                        'Password',
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                          ),
                                                        ],
                                                      )
                                                    : _selectedExam ==
                                                            "TOEFL CBT" // TOEFL CBT
                                                        ? Column(
                                                            children: [
                                                              SizedBox(
                                                                  height:
                                                                      Get.height *
                                                                          0.01),
                                                              TextFormField(
                                                                controller:
                                                                    cbt_date,
                                                                cursorColor:
                                                                    kRed,
                                                                decoration: InputDecoration(
                                                                    suffixIcon: IconButton(
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .today),
                                                                      onPressed:
                                                                          () async {
                                                                        DateTime
                                                                            date =
                                                                            DateTime(1900);
                                                                        FocusScope.of(context)
                                                                            .requestFocus(FocusNode());

                                                                        date = (await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                DateTime.now(),
                                                                            firstDate: DateTime(1900),
                                                                            lastDate: DateTime.now()))!;
                                                                        cbt_date.text =
                                                                            formatter.format(date);
                                                                      },
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                    hintText: 'Exam Date',
                                                                    border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                      width:
                                                                          10),
                                                                  Text(
                                                                      'DD/MM/YYYY',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black
                                                                              .withOpacity(0.5))),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.02,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    cbt_Listening,
                                                                cursorColor:
                                                                    kRed,
                                                                decoration: InputDecoration(
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                    hintText: 'Listening',
                                                                    border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.03,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    cbt_Reading,
                                                                cursorColor:
                                                                    kRed,
                                                                decoration: InputDecoration(
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                    hintText: 'Reading',
                                                                    border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.03,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    cbt_Writing,
                                                                cursorColor:
                                                                    kRed,
                                                                decoration: InputDecoration(
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                    hintText: 'Writing',
                                                                    border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.03,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    cbt_Speaking,
                                                                cursorColor:
                                                                    kRed,
                                                                decoration: InputDecoration(
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                    hintText: 'Speaking',
                                                                    border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.03,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    cbt_Overall,
                                                                cursorColor:
                                                                    kRed,
                                                                decoration: InputDecoration(
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                    hintText: 'Overall',
                                                                    border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.03,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    cbt_Username,
                                                                cursorColor:
                                                                    kRed,
                                                                decoration: InputDecoration(
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                    hintText: 'Username',
                                                                    border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.03,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    cbt_Password,
                                                                cursorColor:
                                                                    kRed,
                                                                decoration: InputDecoration(
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: const BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                    hintText: 'Password',
                                                                    border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    )),
                                                              ),
                                                            ],
                                                          )
                                                        : _selectedExam == //TOEFL IBT
                                                                "TOEFL IBT"
                                                            ? Column(
                                                                children: [
                                                                  SizedBox(
                                                                      height: Get
                                                                              .height *
                                                                          0.01),
                                                                  TextFormField(
                                                                    controller:
                                                                        ibt_date,
                                                                    cursorColor:
                                                                        kRed,
                                                                    decoration: InputDecoration(
                                                                        suffixIcon: IconButton(
                                                                          icon:
                                                                              const Icon(Icons.today),
                                                                          onPressed:
                                                                              () async {
                                                                            DateTime
                                                                                date =
                                                                                DateTime(1900);
                                                                            FocusScope.of(context).requestFocus(FocusNode());

                                                                            date = (await showDatePicker(
                                                                                context: context,
                                                                                initialDate: DateTime.now(),
                                                                                firstDate: DateTime(1900),
                                                                                lastDate: DateTime.now()))!;
                                                                            ibt_date.text =
                                                                                formatter.format(date);
                                                                          },
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            borderSide: const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                        hintText: 'Exam Date',
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        )),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Text(
                                                                          'DD/MM/YYYY',
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style:
                                                                              TextStyle(color: Colors.black.withOpacity(0.5))),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.02,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        ibt_Listening,
                                                                    cursorColor:
                                                                        kRed,
                                                                    decoration: InputDecoration(
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            borderSide: const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                        hintText: 'Listening',
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        )),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.03,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        ibt_Reading,
                                                                    cursorColor:
                                                                        kRed,
                                                                    decoration: InputDecoration(
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            borderSide: const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                        hintText: 'Reading',
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        )),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.03,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        ibt_Writing,
                                                                    cursorColor:
                                                                        kRed,
                                                                    decoration: InputDecoration(
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            borderSide: const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                        hintText: 'Writing',
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        )),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.03,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        ibt_Speaking,
                                                                    cursorColor:
                                                                        kRed,
                                                                    decoration: InputDecoration(
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            borderSide: const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                        hintText: 'Speaking',
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        )),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.03,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        ibt_Overall,
                                                                    cursorColor:
                                                                        kRed,
                                                                    decoration: InputDecoration(
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            borderSide: const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                        hintText: 'Overall',
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        )),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.03,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        ibt_Username,
                                                                    cursorColor:
                                                                        kRed,
                                                                    decoration: InputDecoration(
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            borderSide: const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                        hintText: 'Username',
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        )),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.03,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        ibt_Password,
                                                                    cursorColor:
                                                                        kRed,
                                                                    decoration: InputDecoration(
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            borderSide: const BorderSide(
                                                                              color: Colors.black,
                                                                            )),
                                                                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                        hintText: 'Password',
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        )),
                                                                  ),
                                                                ],
                                                              )
                                                            : _selectedExam == // TOEFL PBT
                                                                    "TOEFL PBT"
                                                                ? Column(
                                                                    children: [
                                                                      SizedBox(
                                                                          height:
                                                                              Get.height * 0.01),
                                                                      TextFormField(
                                                                        controller:
                                                                            pbt_date,
                                                                        cursorColor:
                                                                            kRed,
                                                                        decoration: InputDecoration(
                                                                            suffixIcon: IconButton(
                                                                              icon: const Icon(Icons.today),
                                                                              onPressed: () async {
                                                                                DateTime date = DateTime(1900);
                                                                                FocusScope.of(context).requestFocus(FocusNode());

                                                                                date = (await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now()))!;
                                                                                pbt_date.text = formatter.format(date);
                                                                              },
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.black,
                                                                                )),
                                                                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                            hintText: 'Exam Date',
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                            )),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          SizedBox(
                                                                              width: 10),
                                                                          Text(
                                                                              'DD/MM/YYYY',
                                                                              textAlign: TextAlign.left,
                                                                              style: TextStyle(color: Colors.black.withOpacity(0.5))),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.02,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            pbt_Listening,
                                                                        cursorColor:
                                                                            kRed,
                                                                        decoration: InputDecoration(
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.black,
                                                                                )),
                                                                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                            hintText: 'Listening',
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                            )),
                                                                      ),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.03,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            pbt_Reading,
                                                                        cursorColor:
                                                                            kRed,
                                                                        decoration: InputDecoration(
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.black,
                                                                                )),
                                                                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                            hintText: 'Reading',
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                            )),
                                                                      ),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.03,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            pbt_Writing,
                                                                        cursorColor:
                                                                            kRed,
                                                                        decoration: InputDecoration(
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.black,
                                                                                )),
                                                                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                            hintText: 'Writing',
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                            )),
                                                                      ),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.03,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            pbt_Speaking,
                                                                        cursorColor:
                                                                            kRed,
                                                                        decoration: InputDecoration(
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.black,
                                                                                )),
                                                                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                            hintText: 'Speaking',
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                            )),
                                                                      ),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.03,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            pbt_Overall,
                                                                        cursorColor:
                                                                            kRed,
                                                                        decoration: InputDecoration(
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.black,
                                                                                )),
                                                                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                            hintText: 'Overall',
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                            )),
                                                                      ),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.03,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            pbt_Username,
                                                                        cursorColor:
                                                                            kRed,
                                                                        decoration: InputDecoration(
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.black,
                                                                                )),
                                                                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                            hintText: 'Username',
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                            )),
                                                                      ),
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.03,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            pbt_Password,
                                                                        cursorColor:
                                                                            kRed,
                                                                        decoration: InputDecoration(
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.black,
                                                                                )),
                                                                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontFamily: 'Roboto'),
                                                                            hintText: 'Password',
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                            )),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Container(),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Divider(
                  color: kRedLight,
                  thickness: 1,
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
                SizedBox(height: Get.height * 0.005),
                
                SizedBox(
                  height: Get.height * 0.0,
                ),
                _selectedTest == "ACT" // ACT
                    ? Column(
                        children: [
                          SizedBox(height: Get.height * 0.01),
                          TextFormField(
                            controller: act_Date,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.today),
                                  onPressed: () async {
                                    DateTime date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());

                                    date = (await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now()))!;
                                    act_Date.text = formatter.format(date);
                                  },
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Exam Date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text('DD/MM/YYYY',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5))),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          TextFormField(
                            controller: act_English,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'English',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            controller: act_Maths,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Maths',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            controller: act_Reading,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Reading',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            controller: act_Science,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Science',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            controller: act_Writing,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: 'Roboto'),
                                hintText: 'Writing',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            controller: act_TotalScore,
                            cursorColor: kRed,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    )),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: 'Roboto'),
                                hintText: 'Total Score',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ],
                      )
                    : _selectedTest == "GMAT" // GMAT
                        ? Column(
                            children: [
                              SizedBox(height: Get.height * 0.01),
                              TextFormField(
                                controller: gmat_Date,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.today),
                                      onPressed: () async {
                                        DateTime date = DateTime(1900);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());

                                        date = (await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now()))!;
                                        gmat_Date.text = formatter.format(date);
                                      },
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Exam Date',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text('DD/MM/YYYY',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              TextFormField(
                                controller: gmat_Verbal,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Verbal',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                controller: gmat_Quantitative,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Quantitative',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                controller: gmat_Analytical,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Analytical',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                controller: gmat_Total,
                                cursorColor: kRed,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontFamily: 'Roboto'),
                                    hintText: 'Total',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                            ],
                          )
                        : _selectedTest == "GRE" // GRE
                            ? Column(
                                children: [
                                  SizedBox(height: Get.height * 0.01),
                                  TextFormField(
                                    controller: gre_Date,
                                    cursorColor: kRed,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: const Icon(Icons.today),
                                          onPressed: () async {
                                            DateTime date = DateTime(1900);
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());

                                            date = (await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now()))!;
                                            gre_Date.text =
                                                formatter.format(date);
                                          },
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            )),
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            fontFamily: 'Roboto'),
                                        hintText: 'Exam Date',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Text('DD/MM/YYYY',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.5))),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  TextFormField(
                                    controller: gre_Verbal,
                                    cursorColor: kRed,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            )),
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            fontFamily: 'Roboto'),
                                        hintText: 'Verbal',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  TextFormField(
                                    controller: gre_Quantitative,
                                    cursorColor: kRed,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            )),
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            fontFamily: 'Roboto'),
                                        hintText: 'Quantitative',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  TextFormField(
                                    controller: gre_Analytical,
                                    cursorColor: kRed,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            )),
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            fontFamily: 'Roboto'),
                                        hintText: 'Analytical',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                ],
                              )
                            : _selectedTest == "SAT" // SAT
                                ? Column(
                                    children: [
                                      SizedBox(height: Get.height * 0.01),
                                      TextFormField(
                                        controller: sat_Date,
                                        cursorColor: kRed,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: const Icon(Icons.today),
                                              onPressed: () async {
                                                DateTime date = DateTime(1900);
                                                FocusScope.of(context)
                                                    .requestFocus(FocusNode());

                                                date = (await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime.now()))!;
                                                sat_Date.text =
                                                    formatter.format(date);
                                              },
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Exam Date',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Text('DD/MM/YYYY',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.5))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      TextFormField(
                                        controller: sat_Maths,
                                        cursorColor: kRed,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Maths',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      TextFormField(
                                        controller: sat_RW,
                                        cursorColor: kRed,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontFamily: 'Roboto'),
                                            hintText:
                                                'Evidence-Based Reading and Writing',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      TextFormField(
                                        controller: sat_TotalScore,
                                        cursorColor: kRed,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Total Score',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                    ],
                                  )
                                : Container(),
                SizedBox(
                  height: 10,
                ),
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
