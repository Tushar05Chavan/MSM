import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/App/common/AppConfig/common_language.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/model/responseModek/country_dropdown_response_model.dart';
import 'package:msm_unify/model/responseModek/grade_response_model.dart';
import 'package:msm_unify/model/responseModek/level_of_education_response_model.dart';
import 'package:msm_unify/model/responseModek/student_education_province_response_model.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
import 'package:msm_unify/viewModel/country_dropdown_view_model.dart';
import 'package:msm_unify/viewModel/grade_view_model.dart';
import 'package:msm_unify/viewModel/level_of_education_view_model.dart';
import 'package:msm_unify/viewModel/student_education_province_view_model.dart';

import '../../../common/color_constant.dart';

class AppEducationTab extends StatefulWidget {
  final StudentViewResponseModel? data;

  const AppEducationTab({Key? key, this.data}) : super(key: key);

  @override
  State<AppEducationTab> createState() => _AppEducationTabState();
}

class _AppEducationTabState extends State<AppEducationTab> {
  final _gradeAvg = TextEditingController();
  final _institute = TextEditingController();
  final _city = TextEditingController();
  final _startDate = TextEditingController();
  final _endDate = TextEditingController();
  final _awdDate = TextEditingController();
  final _degree = TextEditingController();

  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  String? _selectedCountry;

  String? _selectedProvince;
  String? _selectedLanguage;

  final LevelOfEducationViewModel _levelOfEducationViewModel =
      Get.put(LevelOfEducationViewModel());

  String? _selectedLevelOfEducation;
  List<LevelOfEducationResponseModel> levelOfEdu = [];
  Future<void> getLevelOfEducation() async {
    await _levelOfEducationViewModel.levelOfEducationViewModel(
        parentId: widget.data!.genInfo!.studentId);
    List<LevelOfEducationResponseModel> response =
        _levelOfEducationViewModel.apiResponse.data;
    response.forEach((element) {
      levelOfEdu.add(element);
    });
    setState(() {});
  }

  final GradeViewModel _gradeViewModel = Get.put(GradeViewModel());

  String? _selectedGradeEducation;
  List<GradeResponseModel> grades = [];
  Future<void> getGrade() async {
    await _gradeViewModel.gradeViewModel();
    List<GradeResponseModel> response = _gradeViewModel.apiResponse.data;
    response.forEach((element) {
      grades.add(element);
    });
    setState(() {});
  }

  final CountryDropViewModel countryDropViewModel =
      Get.put(CountryDropViewModel());

  String? _selectedCountryEducation;
  List<CountryDropResponseModel> countries = [];
  Future<void> getCountry() async {
    await countryDropViewModel.countryDropViewModel();
    List<CountryDropResponseModel> response =
        countryDropViewModel.apiResponse.data;

    response.forEach((element) {
      countries.add(element);
    });
    setState(() {});
  }

  EducationProvinceViewModel educationProvinceViewModel =
      Get.put(EducationProvinceViewModel());
  List<EducationProvinceResponseModel> educProvince = [];
  Future<void> getEducationProvince() async {
    await educationProvinceViewModel.educationDropViewModel(
        countryId: int.parse(_selectedCountry.toString()));
    List<EducationProvinceResponseModel> response =
        educationProvinceViewModel.apiResponse.data;
    response.forEach((element) {
      educProvince.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    getCountry();
    getLevelOfEducation();
    getGrade();
    getEducationProvince();
    super.initState();
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
                  height: 10,
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
                          "${widget.data!.eduInfo!.countryOfEducationName}"),
                      value: _selectedCountryEducation,
                      items: countries.map((countryEducation) {
                        return DropdownMenuItem(
                            value: countryEducation.countryName.toString(),
                            child: Text(
                              countryEducation.countryName.toString(),
                              style: const TextStyle(
                                  color: kGrey4,
                                  fontFamily: "Roboto",
                                  fontSize: 13),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCountryEducation = newValue as String?;
                        });
                      }),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                      isExpanded: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator: (title) {
                        if (title != null) {
                          return "Level of Education";
                        }
                      },
                      borderRadius: BorderRadius.circular(5),
                      hint: Text(
                          "${widget.data!.eduInfo!.highestLevelOfEducationName}"),
                      value: _selectedLevelOfEducation,
                      items: levelOfEdu.map((levelOfEducation) {
                        return DropdownMenuItem(
                            value: levelOfEducation.eduLevelId.toString(),
                            child: Text(
                              levelOfEducation.eduLevelName.toString(),
                              style: const TextStyle(
                                  color: kGrey4,
                                  fontFamily: "Roboto",
                                  fontSize: 13),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLevelOfEducation = newValue as String?;
                        });
                      }),
                ),
                SizedBox(
                  height: Get.height * 0.02,
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
                      hint: Text("${widget.data!.eduInfo!.gradingSchemeName}"),
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
                SizedBox(
                  height: Get.height * 0.02,
                ),
                TextFormField(
                  controller: _gradeAvg,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.eduInfo!.gradeAverage}',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: kGrey,
                          width: 1,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: kGrey,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: kGrey,
                          width: 2,
                        )),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(color: kRed)),
                              children: [
                                StatefulBuilder(
                                  builder: (BuildContext context,
                                      void Function(void Function()) setState) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
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
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Flexible(
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    height: Get.height * 0.03,
                                                    width: Get.width * 0.08,
                                                    decoration: BoxDecoration(
                                                        color: kRed,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
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
                                          DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                    label: const Text(
                                                        'Level of Education',
                                                        style: TextStyle(
                                                            color: kGrey)),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                                validator: (title) {
                                                  if (title != null) {
                                                    return "Level of Education";
                                                  }
                                                },
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                hint: const Text(
                                                  "Level Of Education",
                                                ),
                                                value:
                                                    _selectedLevelOfEducation,
                                                items:
                                                    levelOfEdu.map((eduLevel) {
                                                  return DropdownMenuItem(
                                                      value: eduLevel
                                                          .eduLevelName
                                                          .toString(),
                                                      child: Text(
                                                        eduLevel.eduLevelName
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.2),
                                                            fontFamily:
                                                                "Roboto",
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
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                    label: const Text(
                                                        'Country of Institution',
                                                        style: TextStyle(
                                                            color: kGrey)),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                                validator: (title) {
                                                  if (title != null) {
                                                    return "Country of institution";
                                                  }
                                                },
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                hint: const Text(
                                                    "Country of institution"),
                                                value:
                                                    _selectedCountryEducation,
                                                items: countries
                                                    .map((countryDrop) {
                                                  return DropdownMenuItem(
                                                      value: countryDrop
                                                          .countryId
                                                          .toString(),
                                                      child: Text(
                                                        countryDrop.countryName
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.2),
                                                            fontFamily:
                                                                "Roboto",
                                                            fontSize: 13),
                                                      ));
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  educProvince.clear();
                                                  _selectedCountryEducation =
                                                      newValue as String?;

                                                  getEducationProvince().then(
                                                      (value) =>
                                                          setState(() {}));
                                                }),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          TextFormField(
                                            controller: _institute,
                                            decoration: InputDecoration(
                                              hintText: 'Name of Institution',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 2,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                                validator: (title) {
                                                  if (title != null) {
                                                    return "select Province";
                                                  }
                                                },
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                hint: const Text("Province"),
                                                value: _selectedProvince,
                                                items: educProvince
                                                    .map((educProvince) {
                                                  return DropdownMenuItem(
                                                      value: educProvince
                                                          .provinceName
                                                          .toString(),
                                                      child: Text(
                                                        educProvince
                                                            .provinceName
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: kGrey4,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontSize: 13),
                                                      ));
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selectedProvince =
                                                        newValue as String?;
                                                  });
                                                }),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          TextFormField(
                                            controller: _city,
                                            decoration: InputDecoration(
                                              hintText: 'City/Town',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 2,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          CommonLanguage(
                                              selectedLanguage:
                                                  _selectedLanguage,
                                              hintText:
                                                  "Primary Language of Instruction"),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          TextFormField(
                                            controller: _startDate,
                                            cursorColor: kRed,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                icon: const Icon(Icons.today,
                                                    color: kGrey),
                                                onPressed: () async {
                                                  DateTime date =
                                                      DateTime(1900);
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          FocusNode());

                                                  date = (await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1900),
                                                      lastDate:
                                                          DateTime.now()))!;
                                                  _startDate.text =
                                                      formatter.format(date);
                                                },
                                              ),
                                              hintText: 'Start date DD/MM/YYYY',
                                              hintStyle: const TextStyle(
                                                  color: kGrey,
                                                  fontFamily: 'Roboto'),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 2,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          TextFormField(
                                            controller: _endDate,
                                            cursorColor: kRed,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                icon: const Icon(Icons.today,
                                                    color: kGrey),
                                                onPressed: () async {
                                                  DateTime date =
                                                      DateTime(1900);
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          FocusNode());

                                                  date = (await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1900),
                                                      lastDate:
                                                          DateTime.now()))!;
                                                  _endDate.text =
                                                      formatter.format(date);
                                                },
                                              ),
                                              hintText: 'End date DD/MM/YYYY',
                                              hintStyle: const TextStyle(
                                                  color: kGrey,
                                                  fontFamily: 'Roboto'),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 2,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          TextFormField(
                                            controller: _awdDate,
                                            cursorColor: kRed,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                icon: const Icon(Icons.today,
                                                    color: kGrey),
                                                onPressed: () async {
                                                  DateTime date =
                                                      DateTime(1900);
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          FocusNode());

                                                  date = (await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1900),
                                                      lastDate:
                                                          DateTime.now()))!;
                                                  _awdDate.text =
                                                      formatter.format(date);
                                                },
                                              ),
                                              hintText:
                                                  'Degree awarded date DD/MM/YYYY',
                                              hintStyle: const TextStyle(
                                                  color: kGrey,
                                                  fontFamily: 'Roboto'),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 2,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          TextFormField(
                                            controller: _degree,
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Degree Awarded/Program Name',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 1,
                                                  )),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: kGrey,
                                                    width: 2,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.05,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return SimpleDialog(
                                                    shape:
                                                        ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            side:
                                                                const BorderSide(
                                                                    color:
                                                                        kRed)),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        Get.height *
                                                                            0.03,
                                                                    width:
                                                                        Get.width *
                                                                            0.06,
                                                                    decoration: BoxDecoration(
                                                                        color:
                                                                            kRed,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 15,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SvgPicture.asset(
                                                                'assets/icons/Cross_ Payment failed.svg'),
                                                            SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.01,
                                                            ),
                                                            const Text(
                                                              'Fill Mandatory Fields',
                                                              style: TextStyle(
                                                                  color: kRed,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontSize: 25),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.10,
                                                            ),
                                                            Container(
                                                              height:
                                                                  Get.height *
                                                                      0.045,
                                                              width: Get.width *
                                                                  0.25,
                                                              decoration: BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              kRed),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: const Center(
                                                                  child: Text(
                                                                      'Retry',
                                                                      style: TextStyle(
                                                                          color:
                                                                              kRed,
                                                                          fontFamily:
                                                                              'Roboto'))),
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
                                              height: Get.height * 0.04,
                                              width: Get.width * 0.20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: kRed),
                                              child: const Center(
                                                child: Text('Add',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                          width: Get.width * 0.40,
                          height: Get.height * 0.04,
                          decoration: BoxDecoration(
                            color: const Color(0xff565656),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.add, color: Colors.white),
                              Text(
                                'Add More Education',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Roboto',
                                    color: Colors.white),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: Get.width * 0.15,
                        height: Get.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: kGrey, width: 1.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: Text(
                          'Back',
                          style: TextStyle(fontFamily: 'Roboto', color: kGrey),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width * 0.30,
                        height: Get.height * 0.05,
                        decoration: BoxDecoration(
                          color: const Color(0xff203c92),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: Text(
                          'Skip & Continue',
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: kRed)),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Container(
                                              height: Get.height * 0.03,
                                              width: Get.width * 0.06,
                                              decoration: BoxDecoration(
                                                  color: kRed,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/Cross_ Payment failed.svg'),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      const Text(
                                        'Fill Mandatory Fields',
                                        style: TextStyle(
                                            color: kRed,
                                            fontFamily: 'Roboto',
                                            fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.10,
                                      ),
                                      Container(
                                        height: Get.height * 0.045,
                                        width: Get.width * 0.25,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: kRed),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text('Retry',
                                                style: TextStyle(
                                                    color: kRed,
                                                    fontFamily: 'Roboto'))),
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
                        width: Get.width * 0.30,
                        height: Get.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: Text(
                          'Save & Continue',
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.30,
                ),
                supportSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
