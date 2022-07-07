import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/Screens/Operation/student_screen.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/country_code_relation_response_model.dart';
import 'package:msm_unify/model/responseModek/country_for_search_response_model.dart';
import 'package:msm_unify/model/responseModek/language_response_model.dart';
import 'package:msm_unify/model/responseModek/province_country_response_model.dart';
import 'package:msm_unify/model/responseModek/relation_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/viewModel/add_new_student_view_model.dart';
import 'package:msm_unify/viewModel/country_code_view_model.dart';
import 'package:msm_unify/viewModel/country_for_search_view_model.dart';
import 'package:msm_unify/viewModel/language_view_model.dart';
import 'package:msm_unify/viewModel/province_country_view_model.dart';
import 'package:msm_unify/viewModel/relation_view_model.dart';

import '../../../repo/add_new_student_repo.dart';

class NewStudentScreen extends StatefulWidget {
  @override
  _NewStudentScreenState createState() => _NewStudentScreenState();
}

class _NewStudentScreenState extends State<NewStudentScreen> {
  String? _selectedCountry;
  String? _residentialSelectedCountry;
  String? _mailingSelectedCountry;
  String? _selectedProvinceState;
  String? _mailingSelectedProvinceState;
  String? _selectedTitle;
  String? _selectedGender;
  String? _selectedMaritalStatus;
  String? _selectedCountryCode;
  String? _emergencySelectedCountryCode1;
  String? _emergencySelectedCountryCode2;
  String? _selectedCitizenship;
  String? _selectedLanguage;
  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  final List<String> _title = ['Mr.', 'Ms.', 'Miss', 'Mrs'];
  final List<String> _citizenship = [
    'India',
    'Afghanistan',
    'Brazil',
    'British Indian Ocean Territory',
    'Canada'
  ];
  final List<String> _countryCode = [
    '+91(India)',
    '+93(Afghanistan)',
    '+55(Brazil)',
    '+246(British Indian Ocean Territory)',
    '+1 (Canada)',
  ];

  final List<String> _gender = ['Male', 'Female', 'other'];
  final List<String> _maritalStatus = [
    'Common-law',
    'Divorced',
    'Married',
    'Separated',
    'Single',
    'Widowed'
  ];
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];

  final formGlobalKey = GlobalKey<FormState>();

  final PageController _controller = PageController(
    initialPage: 0,
  );
  bool _checkboxListTile = false;
  @override
  String? indexed = '0';
  _onPageViewChange(int page) {
    indexed = page.toString();
    setState(() {});
    print('index===$indexed');
  }

  final ProvinceCountryViewModel _provinceCountryViewModel =
      Get.put(ProvinceCountryViewModel());
  final LanguageViewModel _languageViewModel = Get.put(LanguageViewModel());
  final RelationViewModel _relationViewModel = Get.put(RelationViewModel());
  final CountryCodeViewModel _countryCodeViewModel =
      Get.put(CountryCodeViewModel());

  final AddNewStudentViewModel _addNewStudentViewModel =
      Get.put(AddNewStudentViewModel());
  final CountryForSearchViewModel _countryForSearchViewModel =
      Get.put(CountryForSearchViewModel());
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _passportExpiryDate = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _emailId = TextEditingController();
  final TextEditingController _personalContactNumber = TextEditingController();
  final TextEditingController _personalPassportNumber = TextEditingController();
  final TextEditingController _residentialAddress = TextEditingController();
  final TextEditingController _residentialCity = TextEditingController();
  final TextEditingController _mailingAddress = TextEditingController();
  final TextEditingController _mailingCity = TextEditingController();
  final TextEditingController _emergencyName = TextEditingController();
  final TextEditingController _residentialZipCode = TextEditingController();
  final TextEditingController _mailingZipCode = TextEditingController();
  final TextEditingController _businessPhone = TextEditingController();
  final TextEditingController _emergencyCellPhone = TextEditingController();
  final TextEditingController _emergencyEmail = TextEditingController();
  @override
  void initState() {
    countryForSearchCode();
    getCountryCode();
    provinceCountry();
    getLanguage();
    getRelation();

    super.initState();
  }

  List<ProvinceCountryResponseModel> provinceState = [];
  Future<void> provinceCountry() async {
    await _provinceCountryViewModel.provinceCountryViewModel();
    List<ProvinceCountryResponseModel> response =
        _provinceCountryViewModel.apiResponse.data;
    response.forEach((element) {
      provinceState.add(element);
    });
    setState(() {});
  }

  List<LanguageResponseModel> getLanguages = [];
  Future<void> getLanguage() async {
    await _languageViewModel.languageViewModel();
    List<LanguageResponseModel> response = _languageViewModel.apiResponse.data;
    response.forEach((element) {
      getLanguages.add(element);
    });
    setState(() {});
  }

  String? _selectedRelation;
  List<RelationResponseModel> relation = [];
  Future<void> getRelation() async {
    await _relationViewModel.relationViewModel();
    List<RelationResponseModel> response = _relationViewModel.apiResponse.data;
    response.forEach((element) {
      relation.add(element);
    });
    setState(() {});
  }

  List<CountryCodeResponseModel> countryCode1 = [];
  Future<void> getCountryCode() async {
    await _countryCodeViewModel.countryCodeViewModel();
    List<CountryCodeResponseModel> response =
        _countryCodeViewModel.apiResponse.data;
    response.forEach((element) {
      countryCode1.add(element);
    });
    setState(() {});
  }

  List<CountryForSearchProgramResponseModel> countryForSearch = [];
  Future countryForSearchCode() async {
    await _countryForSearchViewModel.countryForSearchViewModel();
    List<CountryForSearchProgramResponseModel> response =
        _countryForSearchViewModel.apiResponse.data;
    response.forEach((element) {
      countryForSearch.add(element);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorPrimary,
          title: const Text('Student Personal Information'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formGlobalKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView(
                    onPageChanged: _onPageViewChange,
                    controller: _controller,
                    children: <Widget>[
                      indexed == 0.toString()
                          ? SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Personal Information (As indicated on your passport)',
                                    style: TextStyle(
                                      color: kNavy,
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        validator: (value) {
                                          if (value == null) {
                                            return "Select  Title";
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("Title"),
                                        value: _selectedTitle,
                                        items: _title.map((title) {
                                          return DropdownMenuItem(
                                              value: title,
                                              child: Text(
                                                title,
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedTitle =
                                                newValue as String?;
                                          });
                                          print(
                                              'selected tile==$_selectedTitle');
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  commontextfiled(
                                      controller: _firstName,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return " First Name is required";
                                        }
                                      },
                                      hintText: 'First Name'),
                                  // TextFormField(
                                  //   validator: (fName) {
                                  //     if (fName != null) {
                                  //       return "Please Enter First Name";
                                  //     }
                                  //   },
                                  //   cursorColor: kRed,
                                  //   controller: _firstName,
                                  //   decoration: InputDecoration(
                                  //       focusedBorder: OutlineInputBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(15),
                                  //           borderSide: const BorderSide(
                                  //             color: Colors.black,
                                  //           )),
                                  //       hintStyle: TextStyle(
                                  //           color:
                                  //               Colors.black.withOpacity(0.2),
                                  //           fontFamily: 'Roboto'),
                                  //       hintText: 'First Name',
                                  //       border: OutlineInputBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(15),
                                  //       )),
                                  // ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _middleName,
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
                                        hintText: 'Middle Name',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return " Last Name is required";
                                      }
                                    },
                                    cursorColor: kRed,
                                    controller: _lastName,
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
                                        hintText: 'Last Name',
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
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                        validator: (value) {
                                          if (value == null) {
                                            return "Gender is required";
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("Gender"),
                                        value: _selectedGender,
                                        items: _gender.map((title) {
                                          return DropdownMenuItem(
                                              value: title,
                                              child: Text(
                                                title,
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedGender =
                                                newValue as String?;
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null) {
                                            return "Martial status is required";
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("Marital Status"),
                                        value: _selectedMaritalStatus,
                                        items:
                                            _maritalStatus.map((maritalStatus) {
                                          return DropdownMenuItem(
                                              value: maritalStatus,
                                              child: Text(
                                                maritalStatus,
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedMaritalStatus =
                                                newValue as String?;
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: _dob,
                                    cursorColor: kRed,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter valid date";
                                      }
                                    },
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
                                            _dob.text = formatter.format(date);
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
                                        hintText: 'Date Of Birth',
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
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("First Language"),
                                        value: _selectedLanguage,
                                        items: getLanguages.map((language) {
                                          return DropdownMenuItem(
                                              value: language.languageName,
                                              child: Text(
                                                language.languageName
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedLanguage =
                                                newValue as String?;
                                            print(
                                                'FIRST LANGUAGE==$_selectedLanguage');
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return "Email ID is required";
                                    //   }
                                    // },
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(errorText: "Email ID is required"),
                                        EmailValidator(errorText: "Email ID is invalid")
                                      ]
                                    ),
                                    controller: _emailId,
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
                                        hintText: 'Contact Email ID',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null) {
                                            return "Country Code is required";
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("Country code"),
                                        value: _selectedCountryCode,
                                        items: countryCode1.map((countryCode) {
                                          return DropdownMenuItem(
                                              value: countryCode.countryCode
                                                  .toString(),
                                              child: Text(
                                                countryCode.countryName
                                                    .toString(),semanticsLabel: "+",
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedCountryCode =
                                                newValue as String?;
                                            print(
                                                'selected country code==$_selectedCountryCode');
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: _personalContactNumber,
                                    cursorColor: kRed,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Contact number is required";
                                      }
                                    },
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
                                        hintText: 'Contact Number',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Passport Details',
                                    style: TextStyle(
                                      color: kNavy,
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null) {
                                            return "Country of citizenship is required";
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text(
                                            "Country of Citizenship"),
                                        value: _selectedCitizenship,
                                        items:
                                            countryForSearch.map((citizenship) {
                                          return DropdownMenuItem(
                                              value: citizenship.countryId
                                                  .toString(),
                                              child: Text(
                                                citizenship.countryName
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedCitizenship =
                                                newValue as String?;
                                            print(
                                                'selected citizenship===$_selectedCitizenship');
                                          });
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  commontextfiled(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Passport number is required";
                                      }
                                    },
                                    hintText: 'Passport Number',
                                    controller: _personalPassportNumber,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Please write Passport number/Passport applied/Passport not available',
                                    style: TextStyle(
                                        color: Color(0xff808080),
                                        fontFamily: 'Roboto',
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _passportExpiryDate,
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
                                                lastDate: DateTime(2050)))!;
                                            _passportExpiryDate.text =
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
                                        hintText: 'Expiry Date',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'DD/MM/YYYY',
                                    style: TextStyle(
                                        color: Color(0xff808080),
                                        fontFamily: 'Roboto',
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (formGlobalKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                indexed = 1.toString();
                                              });
                                            } else {
                                              return null;
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            height: Get.height * 0.05,
                                            decoration: BoxDecoration(
                                                color: kGreen1,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Center(
                                              child: Text(
                                                'Save & Continue',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 11),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: indexed == 0.toString()
                                            ? kGreen1
                                            : Color(0xffAAAAAA),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: indexed == 1.toString()
                                            ? kGreen1
                                            : Color(0xffAAAAAA),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: indexed == 2.toString()
                                            ? kGreen1
                                            : Color(0xffAAAAAA),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  supportSection(),
                                ],
                              ),
                            )
                          : indexed == 1.toString()
                              ? SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Residential Address (As mentioned on the passport) ',
                                        style: TextStyle(
                                          color: kNavy,
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: _residentialAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Address is required";
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
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Address',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null) {
                                                return "Country is required";
                                              }
                                            },
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Country"),
                                            value: _residentialSelectedCountry,
                                            items: 
                                            //countryCode1.map((country) 
                                            countryForSearch.map((country){
                                              return DropdownMenuItem(
                                                  value: country.countryId
                                                      .toString(),
                                                  child: Text(
                                                    country.countryName
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: kGrey4,
                                                        fontFamily: "Roboto",
                                                        fontSize: 13),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _residentialSelectedCountry =
                                                    newValue as String?;
                                              });
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField(
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
                                            hint: const Text("Province/State"),
                                            value: _selectedProvinceState,
                                            items: provinceState.map((state) {
                                              return DropdownMenuItem(
                                                  value: state.provinceId
                                                      .toString(),
                                                  child: Text(
                                                    state.provinceName
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: kGrey4,
                                                        fontFamily: "Roboto",
                                                        fontSize: 13),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedProvinceState =
                                                    newValue as String?;

                                                print(
                                                    '_selectedProvinceState==${_selectedProvinceState}');
                                              });
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        cursorColor: kRed,
                                        controller: _residentialCity,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "City/Town is required";
                                          }
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                fontFamily: 'Roboto'),
                                            hintText: 'City/Town',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _residentialZipCode,
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
                                                    .withOpacity(0.2),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Postal/Zip code',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      const Text(
                                        ' Mailing Address (Current residence address) ',
                                        style: TextStyle(
                                          color: kNavy,
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      CheckboxListTile(
                                        activeColor: Colors.red,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        title: const Text('Same as above'),
                                        value: _checkboxListTile,
                                        onChanged: (value) {
                                          setState(() {
                                            print(
                                                'data==${_residentialAddress.text}');
                                            _checkboxListTile =
                                                !_checkboxListTile;
                                            _mailingAddress.text =
                                                _residentialAddress.text;

                                            _mailingSelectedProvinceState =
                                                _selectedProvinceState;
                                            _mailingSelectedCountry =
                                                _residentialSelectedCountry;
                                            _mailingCity.text =
                                                _residentialCity.text;
                                            _mailingZipCode.text =
                                                _residentialZipCode.text;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        cursorColor: kRed,
                                        controller: _mailingAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Address is required";
                                          }
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Address',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null) {
                                                return "Country is required";
                                              }
                                            },
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Country"),
                                            value: _mailingSelectedCountry,
                                            items:
                                                countryForSearch.map((country) {
                                              return DropdownMenuItem(
                                                  value: country.countryId
                                                      .toString(),
                                                  child: Text(
                                                    country.countryName
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: kGrey4,
                                                        fontFamily: "Roboto",
                                                        fontSize: 13),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _mailingSelectedCountry =
                                                    newValue as String?;
                                                print(
                                                    'mailingcountry==$_mailingSelectedCountry');
                                              });
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField(
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
                                            hint: const Text("Province/State"),
                                            value:
                                                _mailingSelectedProvinceState,
                                            items: provinceState.map((state) {
                                              return DropdownMenuItem(
                                                  value: state.provinceId
                                                      .toString(),
                                                  child: Text(
                                                    state.provinceName
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: kGrey4,
                                                        fontFamily: "Roboto",
                                                        fontSize: 13),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _mailingSelectedProvinceState =
                                                    newValue as String?;

                                                print(
                                                    '_selectedProvinceState==${_mailingSelectedProvinceState}');
                                              });
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _mailingCity,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "City/Town is required";
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
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                fontFamily: 'Roboto'),
                                            hintText: 'City/Town',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _mailingZipCode,
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
                                                    .withOpacity(0.2),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Postal/Zip code',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  indexed = 0.toString();
                                                });
                                              },
                                              child: SvgPicture.asset(
                                                'assets/icons/back.svg',
                                                height: 22,
                                                width: 22,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              'Back',
                                              style: TextStyle(
                                                  color: kGrey5,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (formGlobalKey.currentState!
                                                    .validate()) {
                                                  setState(() {
                                                    indexed = 2.toString();
                                                  });
                                                }
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                height: Get.height * 0.05,
                                                decoration: BoxDecoration(
                                                    color: kGreen1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: const Center(
                                                  child: Text(
                                                    'Save & Continue',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 11),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor:
                                                indexed == 0.toString()
                                                    ? kGreen1
                                                    : Color(0xffAAAAAA),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor:
                                                indexed == 1.toString()
                                                    ? kGreen1
                                                    : Color(0xffAAAAAA),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor:
                                                indexed == 2.toString()
                                                    ? kGreen1
                                                    : Color(0xffAAAAAA),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      supportSection(),
                                    ],
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        ' Emergency contact  ',
                                        style: TextStyle(
                                          color: kNavy,
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        cursorColor: kRed,
                                        controller: _emergencyName,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter name";
                                          }
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Name',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField(
                                            validator: (value) {
                                              if (value == null) {
                                                return "Select  Relation";
                                              }
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Relation"),
                                            value: _selectedRelation,
                                            items: relation.map((countryCode) {
                                              return DropdownMenuItem(
                                                  value: countryCode.relation
                                                      .toString(),
                                                  child: Text(
                                                    countryCode.relation
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: kGrey4,
                                                        fontFamily: "Roboto",
                                                        fontSize: 13),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedRelation =
                                                    newValue as String?;
                                              });
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _emergencyEmail,
                                        cursorColor: kRed,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter Emergency Email";
                                          }
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                )),
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Email ID',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Email ID should not be same as registered email ID.',
                                        style: TextStyle(
                                          color: Color(0xff808080),
                                          fontFamily: "Roboto",
                                          fontSize: 11,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField(
                                            validator: (value) {
                                              if (value == null) {
                                                return "Select  Country Code";
                                              }
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Country Code"),
                                            value:
                                                _emergencySelectedCountryCode1,
                                            items: countryForSearch
                                                .map((countryCode) {
                                              return DropdownMenuItem(
                                                  value: countryCode.countryId
                                                      .toString(),
                                                  child: Text(
                                                    countryCode.countryName
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: kGrey4,
                                                        fontFamily: "Roboto",
                                                        fontSize: 13),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _emergencySelectedCountryCode1 =
                                                    newValue as String?;
                                              });
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _emergencyCellPhone,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter Cell Phone";
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
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                fontFamily: 'Roboto'),
                                            hintText: 'Cell Phone',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  indexed = 1.toString();
                                                });
                                              },
                                              child: SvgPicture.asset(
                                                'assets/icons/back.svg',
                                                height: 22,
                                                width: 22,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              'Back',
                                              style: TextStyle(
                                                  color: kGrey5,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                if (formGlobalKey.currentState!
                                                    .validate()) {
                                                  Map<String, dynamic> map = {
                                                    "genInfo": {
                                                      "AgentId": int.parse(
                                                          "${Get.find<AppData>().loginResponseModel.rslt!.refId}"),
                                                      "Salution": _selectedTitle
                                                          .toString(),
                                                      "Gender": _selectedGender
                                                          .toString(),
                                                      "FirstName":
                                                          _firstName.text,
                                                      "MiddleName":
                                                          _middleName.text,
                                                      "LastName":
                                                          _lastName.text,
                                                      "MaritialStatus":
                                                          _selectedMaritalStatus
                                                              .toString(),
                                                      "DateOfBirth":
                                                          "2009-06-06T00:00:00.000Z",
                                                      "Language":
                                                          _selectedLanguage
                                                              .toString(),
                                                      "Email": _emailId.text,
                                                      "MobileNoCountryCode":
                                                          _selectedCountryCode
                                                              .toString(),
                                                      "MobileNo":
                                                          _personalContactNumber
                                                              .text,
                                                      "Citizenship": int.parse(
                                                          _selectedCitizenship
                                                              .toString()),
                                                      "PassportNo":
                                                          _personalPassportNumber
                                                              .text,
                                                      "PassportExpiryDate":
                                                          "2022-07-03T00:00:00.000Z",
                                                      "Addres":
                                                          _residentialAddress
                                                              .text,
                                                      "Country": int.parse(
                                                          _residentialSelectedCountry!),
                                                      "Province": int.parse(
                                                          _selectedProvinceState!),
                                                      "City":
                                                          _residentialCity.text,
                                                      "Pincode":
                                                          _residentialZipCode
                                                              .text,
                                                      "MailingAddressSame":
                                                          _checkboxListTile,
                                                      "MailingAddres":
                                                          _mailingAddress.text,
                                                      "MailingCountry": int.parse(
                                                          _mailingSelectedCountry!),
                                                      "MailingProvince": int.parse(
                                                          _mailingSelectedProvinceState!),
                                                      "MailingCity":
                                                          _mailingCity.text,
                                                      "MailingPincode":
                                                          _mailingZipCode.text,
                                                      "EmrgencyName":
                                                          _emergencyName.text,
                                                      "EmergencyRelation":
                                                          _selectedCitizenship
                                                              .toString(),
                                                      "EmergencyEmail":
                                                          _emergencyEmail.text,
                                                      "EmergencyCellPhoneCountryCode":
                                                          _emergencySelectedCountryCode1
                                                              .toString(),
                                                      "EmergencyCellPhone":
                                                          _emergencyCellPhone
                                                              .text
                                                    },
                                                    "programInfo": {
                                                      "IntekId": 1
                                                    },
                                                    "eduInfo": {
                                                      "StudentId": 0,
                                                      "CountryOfEducation": 0,
                                                      "HighestLevelOfEducation":
                                                          0,
                                                      "GradingScheme": 0,
                                                      "GradeAverage": "",
                                                      "GraduatedMostRecent": 0,
                                                      "EduYearEnd": "",
                                                      "EduYearStart": ""
                                                    },
                                                    "testScore": {
                                                      "StudentId": 0,
                                                      "EnglishExamType": 0,
                                                      "EnglishExamDate": "",
                                                      "EnglishScoreL": "",
                                                      "EnglishScoreR": "",
                                                      "EnglishScoreW": "",
                                                      "EnglishScoreS": "",
                                                      "GREExamDate": "",
                                                      "GREScoreV": "",
                                                      "GREScoreQ": "",
                                                      "GREScoreW": "",
                                                      "GMATExamDate": "",
                                                      "GMATScoreA": "",
                                                      "GMATScoreI": "",
                                                      "GMATScoreQ": "",
                                                      "GMATScoreV": "",
                                                      "EnglishScoreOverall": ""
                                                    },
                                                    "emergencyInfo": {}
                                                  };

                                                  bool milan =
                                                      await AddNewStudentRepo
                                                          .addNewStudentRepo(
                                                              map);
                                                  print(
                                                      'RESPONSE=fsf=${APIService().code}');
                                                  if (milan) {
                                                    print('DOne=====');
                                                    Get.off(
                                                        const StudentListScreen());
                                                  } else {
                                                    print('else ma aavu');
                                                  }
                                                }
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                height: Get.height * 0.05,
                                                decoration: BoxDecoration(
                                                    color: kGreen1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: const Center(
                                                  child: Text(
                                                    'Save',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 11),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor:
                                                indexed == 0.toString()
                                                    ? kGreen1
                                                    : Color(0xffAAAAAA),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor:
                                                indexed == 1.toString()
                                                    ? kGreen1
                                                    : Color(0xffAAAAAA),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor:
                                                indexed == 2.toString()
                                                    ? kGreen1
                                                    : Color(0xffAAAAAA),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      supportSection(),
                                    ],
                                  ),
                                ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
