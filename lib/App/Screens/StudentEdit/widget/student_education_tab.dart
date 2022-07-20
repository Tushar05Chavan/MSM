import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/common_country.dart';
import 'package:msm_unify/App/common/AppConfig/common_language.dart';
import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/model/responseModek/student_education_province_response_model.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
import 'package:msm_unify/viewModel/country_view_model.dart';
import 'package:msm_unify/viewModel/level_of_education_view_model.dart';

import '../../../../model/responseModek/grade_response_model.dart';
import '../../../../model/responseModek/level_of_education_response_model.dart';
import '../../../../repo/level_of_education_repo.dart';
import '../../../../viewModel/grade_view_model.dart';
import '../../../../viewModel/student_education_province_view_model.dart';
import '../../../../viewModel/student_education_update_view_model.dart';
import '../../../common/AppConfig/support_section.dart';
import '../../../common/color_constant.dart';

class StudentEducationTab extends StatefulWidget {
  final StudentViewResponseModel? data;
  final int? countryId;

  const StudentEducationTab({Key? key, this.data, this.countryId})
      : super(key: key);

  @override
  State<StudentEducationTab> createState() => _StudentEducationTabState();
}

class _StudentEducationTabState extends State<StudentEducationTab> {
  final TextEditingController _gradeAverage = TextEditingController();

  final StudentEduUpdateViewModel _studentEduUpdateViewModel =
      Get.put(StudentEduUpdateViewModel());

  final TextEditingController _startDate = TextEditingController();

  final TextEditingController _endDate = TextEditingController();
  final TextEditingController _degreeawarded = TextEditingController();
  String? _selectedDegreeEducation;
  String? _selectedGradeEducation;
  String? _selectedCountryEducation;
  String? _selectedLevelOfEducation;
  String? _selectedPrimaryLanguage;
  String? _selectedProvince;

  final GradeViewModel _gradeViewModel = Get.put(GradeViewModel());

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
        parentId: widget.data!.genInfo!.studentId);
    List<LevelOfEducationResponseModel> response =
        _levelOfEducationViewModel.apiResponse.data;
    response.forEach((element) {
      levelOfEdu.add(element);
    });
    setState(() {});
  }

  final EducationProvinceViewModel _educationProvinceViewModel =
      Get.put(EducationProvinceViewModel());

  List<EducationProvinceResponseModel> provinceState = [];
  Future<void> provinceCountry() async {
    await _educationProvinceViewModel.educationDropViewModel(
        countryId: int.parse(_selectedCountryEducation.toString()));
    List<EducationProvinceResponseModel> response =
        _educationProvinceViewModel.apiResponse.data;
    response.forEach((element) {
      provinceState.add(element);
    });
    setState(() {});
  }

  final CountryViewModel _countryViewModel = Get.put(CountryViewModel());

  List<CountryResponseModel> countryS = [];
  Future<void> getCountry() async {
    await _countryViewModel.countryViewModel();
    List<CountryResponseModel> response = _countryViewModel.apiResponse.data;
    response.forEach((element) {
      countryS.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    getCountry();
    getLevelOfEducation();
    getGrade();
    provinceCountry();
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              CommonCountry(
                hintText: 'Country of Education',
                selectedCountry: _selectedCountryEducation,
                onchange: (String val) {
                  setState(() {
                    _selectedCountryEducation = val;
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
                    validator: (value) {
                      if (value == null) {
                        return "Highest level of education is required";
                      }
                    },
                    borderRadius: BorderRadius.circular(5),
                    hint: Text("Highest Level of Education"),
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
                      //print('countryOfEducation==$_selectedDegreeEducation');
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
                    validator: (value) {
                      if (value == null) {
                        return "Select grade scheme";
                      }
                    },
                    borderRadius: BorderRadius.circular(5),
                    hint: Text("Grading Scheme"),
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
                    return "Please Enter First Name";
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
                    hintText: 'Grade Average',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    // print('Student ID=====${widget.data!.genInfo!.studentId}');
                    // print(
                    //     'countryOfEducation=====${int.parse(_selectedCountryEducation.toString())} ');
                    // print(
                    //     'highestLevelEdu=====${int.parse(_selectedDegreeEducation.toString())}');
                    // print(
                    //     'gradeScheme=====${int.parse(_selectedGradeEducation.toString())}');
                    // print('gradeAverage=====${_gradeAverage.text}');
                    _studentEduUpdateViewModel.studentEduUpdateViewModel(
                      studentId: widget.data!.genInfo!.studentId,
                      countryOfEducation:
                          int.parse(_selectedCountryEducation.toString()),
                      highestLevelEdu:
                          int.parse(_selectedDegreeEducation.toString()),
                      gradeScheme:
                          int.parse(_selectedGradeEducation.toString()),
                      gradeAverage: _gradeAverage.text,
                    );
                    if (_studentEduUpdateViewModel.apiResponse.status ==
                        Status.COMPLETE) {
                      showInSnackBar();
                    } else {
                      showInErrorSnackBar();
                    }
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
                child: InkWell(
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
                                        InkWell(
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
                                                      BorderRadius.circular(
                                                          15))),
                                          validator: (title) {
                                            if (title != null) {
                                              return "Level of Education";
                                            }
                                          },
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          hint:
                                              const Text("Level Of Education"),
                                          value: _selectedLevelOfEducation,
                                          items: levelOfEdu
                                              .map((levelOfEducation) {
                                            return DropdownMenuItem(
                                                value: levelOfEducation
                                                    .eduLevelId
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
                                    DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField(
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                              label: const Text(
                                                  'Country of Institution',
                                                  style:
                                                      TextStyle(color: kGrey)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),
                                          validator: (title) {
                                            if (title != null) {
                                              return "Country of institution";
                                            }
                                          },
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          hint: const Text(
                                              "Country of institution"),
                                          value: _selectedCountryEducation,
                                          items: countryS.map((countryDrop) {
                                            return DropdownMenuItem(
                                                value: countryDrop.countryId
                                                    .toString(),
                                                child: Text(
                                                  countryDrop.countryName
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                      fontFamily: "Roboto",
                                                      fontSize: 13),
                                                ));
                                          }).toList(),
                                          onChanged: (newValue) {
                                            provinceState.clear();
                                            _selectedCountryEducation =
                                                newValue as String?;

                                            provinceCountry().then(
                                                (value) => setState(() {}));
                                          }),
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
                                          hintText: 'Name Of Institution',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          )),
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
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null) {
                                              return "Province/State is required";
                                            }
                                          },
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          hint: Text(
                                              '${widget.data!.eduInfo!.highestLevelOfEducationName}'),
                                          value: _selectedProvince,
                                          items: provinceState.map((state) {
                                            return DropdownMenuItem(
                                                value: state.provinceName
                                                    .toString(),
                                                child: Text(
                                                  state.provinceName.toString(),
                                                  style: const TextStyle(
                                                      color: kGrey4,
                                                      fontFamily: "Roboto",
                                                      fontSize: 13),
                                                ));
                                          }).toList(),
                                          onChanged: (newValue) {
                                            _selectedProvince =
                                                newValue as String?;
                                          }),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CommonLanguage(
                                        hintText: 'Primary Language',
                                        selectedLanguage:
                                            _selectedPrimaryLanguage,
                                        callBack: (value) {
                                          {
                                            setState(() =>
                                                _selectedPrimaryLanguage =
                                                    value);
                                          }
                                        }),
                                    const SizedBox(height: 15),
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
                                    InkWell(
                                      onTap: () async {
                                        Map<String, dynamic> _map = {
                                          "SchoolId": 0,
                                          "ParentId":
                                              widget.data!.genInfo!.studentId,
                                          "ParentType": 6,
                                          "LevelOfEducation": 1108,
                                          "LevelOfEducationName": "Grade 12",
                                          "CountryOfInstitution": 1,
                                          "CountryOfInstitutionName": "",
                                          "NameOfInstitution": "aktu",
                                          "Language": "Acholi",
                                          "AttendendFrom":
                                              "2022-07-05T00:00:00.000Z",
                                          "AttendendTo":
                                              "2022-07-31T00:00:00.000Z",
                                          "Degree":
                                              "Associate of Arts for Transfer",
                                          "DegreeAwardedOn":
                                              "2022-07-15T00:00:00.000Z",
                                          "Addres": "Bihar board",
                                          "City": "patna",
                                          "Province": 42,
                                          "Pincode": "",
                                          "Marks": [
                                            {
                                              "SubjectId": 6,
                                              "SubjectName": "Accounts",
                                              "MaxMarks": "",
                                              "MinMarks": "",
                                              "ObtainMarks": "7",
                                              "GradeId": 0,
                                              "GradeName": ""
                                            }
                                          ],
                                          "StreamId": 0
                                        };
                                        final LevelOfEducationViewModel
                                            _levelOfEducationViewModel =
                                            Get.put(
                                                LevelOfEducationViewModel());
                                        await _levelOfEducationViewModel
                                            .educationHistoryModel(map: _map);

                                        setState(() {});
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: Get.height * 0.035,
                                          width: Get.width * 0.20,
                                          decoration: BoxDecoration(
                                            color: kRed,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Add',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
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
                    padding: EdgeInsets.all(3),
                    height: Get.height * 0.05,
                    width: Get.width * 0.29,
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
      ),
    );
  }
}
