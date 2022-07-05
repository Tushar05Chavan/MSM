import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/common_country.dart';
import 'package:msm_unify/App/common/AppConfig/common_language.dart';
import 'package:msm_unify/App/common/AppConfig/common_province_state.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/application_view_response_model.dart';
import 'package:msm_unify/model/responseModek/grade_response_model.dart';
import 'package:msm_unify/model/responseModek/level_of_education_response_model.dart';
import 'package:msm_unify/viewModel/education_update_view_model.dart';
import 'package:msm_unify/viewModel/grade_view_model.dart';
import 'package:msm_unify/viewModel/level_of_education_view_model.dart';

class EducationTab extends StatefulWidget {
  final ApplicationViewResponseModel data;

  const EducationTab({super.key, required this.data});
  @override
  _EducationTabState createState() => _EducationTabState();
}

class _EducationTabState extends State<EducationTab> {
  final TextEditingController _startDate = TextEditingController();

  final TextEditingController _endDate = TextEditingController();
  final TextEditingController _degreeawarded = TextEditingController();
  String? _selectedDegreeEducation;
  String? _selectedGradeEducation;
  String? _selectedCountryEducation;
  String? _selectedLevelOfEducation;
  String? _selectedPrimaryLanguage;
  String? _selectedProvince;
  String? _selectedCountryInstitution;

  final GradeViewModel _gradeViewModel = Get.put(GradeViewModel());

  final EducationUpdateViewModel _educationUpdateViewModel =
      Get.put(EducationUpdateViewModel());

  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  List<GradeResponseModel> grades = [];
  Future<void> getGrade() async {
    await _gradeViewModel.gradeViewModel();
    List<GradeResponseModel> response = _gradeViewModel.apiResponse.data;
    response.forEach((element) {
      grades.add(element);
    });
    setState(() {});
  }

  final LevelOfEducationViewModel _levelOfEducationViewModel =
      Get.put(LevelOfEducationViewModel());
  List<LevelOfEducationResponseModel> levelOfEdu = [];
  Future<void> getLevelOfEducation() async {
    await _levelOfEducationViewModel.levelOfEducationViewModel(
        parentId: widget.data.genInfo!.applicationId);
    List<LevelOfEducationResponseModel> response =
        _levelOfEducationViewModel.apiResponse.data;
    response.forEach((element) {
      levelOfEdu.add(element);
    });
    setState(() {});
  }

  final TextEditingController _gradeAverage = TextEditingController();
  void getEducationLevel() {}
  @override
  void initState() {
    getLevelOfEducation();
    getGrade();
    super.initState();
  }

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
        backgroundColor: kRed,
        content: Text(
          'Update Successfully',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  @override
  Widget build(BuildContext context) {
    print('_selectedCountryEducation${_selectedCountryEducation}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            CommonCountry(
              hintText: '${widget.data.eduInfo!.countryOfEducationName}',
              selectedCountry: _selectedCountryEducation,
              onchange: (String val) {
                setState(() {
                  _selectedCountryEducation = val;
                  print(
                      '_selectedCountryEducation $_selectedCountryEducation $val');
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  validator: (title) {
                    if (title != null) {
                      return "Please Enter Title";
                    }
                  },
                  borderRadius: BorderRadius.circular(5),
                  hint: Text(
                      "${widget.data.eduInfo!.highestLevelOfEducationName}"),
                  value: _selectedDegreeEducation,
                  items: levelOfEdu.map((countryEducation) {
                    return DropdownMenuItem(
                        value: countryEducation.eduLevelId.toString(),
                        child: Text(
                          countryEducation.eduLevelName.toString(),
                          style: const TextStyle(
                              color: kGrey4,
                              fontFamily: "Roboto",
                              fontSize: 13),
                        ));
                  }).toList(),
                  onChanged: (newValue) {
                    _selectedDegreeEducation = newValue as String?;
                    print('countryOfEducation==$_selectedDegreeEducation');
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  validator: (title) {
                    if (title != null) {
                      return "Please Enter Title";
                    }
                  },
                  borderRadius: BorderRadius.circular(5),
                  hint: Text("${widget.data.eduInfo!.gradingSchemeName}"),
                  value: _selectedGradeEducation,
                  items: grades.map((gradeEducation) {
                    return DropdownMenuItem(
                        value: gradeEducation.grdSchemeId.toString(),
                        child: Text(
                          gradeEducation.grdSchemeName.toString(),
                          style: const TextStyle(
                              color: kGrey4,
                              fontFamily: "Roboto",
                              fontSize: 13),
                        ));
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGradeEducation = newValue as String?;
                    });
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _gradeAverage,
              validator: (fName) {
                if (fName != null) {
                  return "Please Enter Grade Average";
                }
              },
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
                  hintText: '${widget.data.eduInfo!.gradeAverage}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  print('applicatioId==${widget.data.genInfo!.applicationId}');
                  print(
                      'countryOfEducation==${int.parse(_selectedCountryEducation.toString())} ');
                  print(
                      'highestLevelEdu==${int.parse(_selectedDegreeEducation.toString())}');
                  print(
                      'gradeScheme==${int.parse(_selectedGradeEducation.toString())}');
                  print('gradeAverage==${_gradeAverage.text}');
                  _educationUpdateViewModel.educationUpdateViewModel(
                    applicationId: widget.data.genInfo!.applicationId,
                    countryOfEducation:
                        int.parse(_selectedCountryEducation.toString()),
                    highestLevelEdu:
                        int.parse(_selectedDegreeEducation.toString()),
                    gradeScheme: int.parse(_selectedGradeEducation.toString()),
                    gradeAverage: _gradeAverage.text,
                  );
                  if (_educationUpdateViewModel.apiResponse.status ==
                      Status.COMPLETE) {
                    showInSnackBar();
                  } else {
                    showInErrorSnackBar();
                  }
                  // body: {
                  //   "ApplicationId": 107217,
                  //   "CountryOfEducation": 160,
                  //   "HighestLevelOfEducation": 1117,
                  //   "GradingScheme": 14,
                  //   "GradeAverage": "A+",
                  //   "GraduatedMostRecent": 0,
                  //   "EduYearStart": "",
                  //   "EduYearEnd": "",
                  //   "GradingSchemeName": null,
                  //   "HighestLevelOfEducationName": null,
                  //   "CountryOfEducationName": null
                  // },
                },
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
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '*10th Grade and 12th Grade details are mandatory',
              style: TextStyle(
                color: Color(0xff3C4858),
                fontSize: 13,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Colors.red)),
                          content: SizedBox(
                            height: Get.height * 0.70,
                            width: Get.width,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Add School Details',
                                        style: TextStyle(
                                            color: kNavy,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          height: Get.height * 0.04,
                                          width: Get.width * 0.08,
                                          decoration: BoxDecoration(
                                            color: kRed,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        validator: (title) {
                                          if (title != null) {
                                            return "Level of Education";
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("Level Of Education"),
                                        value: _selectedLevelOfEducation,
                                        items:
                                            levelOfEdu.map((levelOfEducation) {
                                          return DropdownMenuItem(
                                              value: levelOfEducation.eduLevelId
                                                  .toString(),
                                              child: Text(
                                                levelOfEducation.eduLevelName
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedLevelOfEducation =
                                                newValue as String?;
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CommonCountry(
                                      hintText: 'Country of Education',
                                      selectedCountry:
                                          _selectedCountryInstitution),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    validator: (fName) {
                                      if (fName != null) {
                                        return "Name Of Institution";
                                      }
                                    },
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
                                                Colors.black.withOpacity(0.2),
                                            fontFamily: 'Roboto'),
                                        hintText: 'Name Of Institution',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CommonProvinceState(
                                      hintText: "Province",
                                      selectedProvince: _selectedProvince),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CommonLanguage(
                                      hintText: 'Primary Language',
                                      selectedLanguage:
                                          _selectedPrimaryLanguage),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _startDate,
                                    cursorColor: kRed,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.today),
                                          onPressed: () async {
                                            DateTime date = DateTime(1900);
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());

                                            date = (await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now()))!;
                                            _startDate.text =
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
                                                Colors.black.withOpacity(0.2),
                                            fontFamily: 'Roboto'),
                                        hintText: 'Start date DD/MM/YYYY',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _endDate,
                                    cursorColor: kRed,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.today),
                                          onPressed: () async {
                                            DateTime date = DateTime(1900);
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());

                                            date = (await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now()))!;
                                            _endDate.text =
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
                                                Colors.black.withOpacity(0.2),
                                            fontFamily: 'Roboto'),
                                        hintText: 'End date DD/MM/YYYY',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _degreeawarded,
                                    cursorColor: kRed,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.today),
                                          onPressed: () async {
                                            DateTime date = DateTime(1900);
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());

                                            date = (await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now()))!;
                                            _degreeawarded.text =
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
                                                Colors.black.withOpacity(0.2),
                                            fontFamily: 'Roboto'),
                                        hintText:
                                            'Degree awarded date DD/MM/YYYY',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    validator: (fName) {
                                      if (fName != null) {
                                        return "Name Of Institution";
                                      }
                                    },
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
                                                Colors.black.withOpacity(0.2),
                                            fontFamily: 'Roboto'),
                                        hintText:
                                            'Degree awarded/ Program name',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: Get.height * 0.035,
                                      width: Get.width * 0.20,
                                      decoration: BoxDecoration(
                                        color: kRed,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Add',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: Get.height * 0.05,
                  width: Get.width * 0.32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kNavy)),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        color: kNavy,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add More',
                        style: TextStyle(
                          color: kNavy,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            supportSection()
          ],
        ),
      ),
    );
  }
}
