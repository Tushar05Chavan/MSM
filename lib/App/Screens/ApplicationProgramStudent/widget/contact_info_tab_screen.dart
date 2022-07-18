import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/country_code_relation_response_model.dart';
import 'package:msm_unify/model/responseModek/country_dropdown_response_model.dart';
import 'package:msm_unify/model/responseModek/province_country_response_model.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
import 'package:msm_unify/viewModel/country_code_view_model.dart';
import 'package:msm_unify/viewModel/country_dropdown_view_model.dart';
import 'package:msm_unify/viewModel/province_country_view_model.dart';

class ContactInfoTabScreen extends StatefulWidget {
  final StudentViewResponseModel? data;
  const ContactInfoTabScreen({Key? key, this.data}) : super(key: key);

  @override
  _ContactInfoTabScreenState createState() => _ContactInfoTabScreenState();
}

class _ContactInfoTabScreenState extends State<ContactInfoTabScreen> {
  String? selectedCountry;
  String? selectedCountryCode;
  String? selectedState;
  final List<String> _country = [
    'India',
    'Pakistan',
    'nepal',
    'China',
    'Japan'
  ];
  bool _checkboxListTile = false;
  final List<String> _state = ['gujrat', 'maharashtra', 'punjab', 'MP', 'UP'];
  final List<String> _countryCode = [
    '+91(India)',
    'maharashtra',
    'punjab',
    'MP',
    'UP'
  ];

  final CountryDropViewModel countryDropViewModel =
      Get.put(CountryDropViewModel());

  String? _selectedCountry;
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

  final ProvinceCountryViewModel _provinceCountryViewModel =
      Get.put(ProvinceCountryViewModel());

  String? _selectedProvinceState;
  List<ProvinceCountryResponseModel> provinceState = [];
  Future<void> provinceCountry() async {
    await _provinceCountryViewModel.provinceCountryViewModel(12);
    List<ProvinceCountryResponseModel> response =
        _provinceCountryViewModel.apiResponse.data;
    response.forEach((element) {
      provinceState.add(element);
    });
  }

  final CountryCodeViewModel _countryCodeViewModel =
      Get.put(CountryCodeViewModel());

  List<CountryCodeResponseModel> countryCode1 = [];
  Future<void> getCountryCode() async {
    await _countryCodeViewModel.countryCodeViewModel();
    List<CountryCodeResponseModel> response =
        _countryCodeViewModel.apiResponse.data;
    response.forEach((element) {
      countryCode1.add(element);
    });
  }

  String? selectedCountryCode1;
  List<CountryCodeResponseModel> countryCode2 = [];
  Future<void> getCountryCode2() async {
    await _countryCodeViewModel.countryCodeViewModel();
    List<CountryCodeResponseModel> response =
        _countryCodeViewModel.apiResponse.data;
    response.forEach((element) {
      countryCode2.add(element);
    });
  }

  @override
  void initState() {
    getCountry();
    provinceCountry();
    getCountryCode();
    getCountryCode2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Residential Address  (As mentioned on the passport) ",
                style: TextStyle(
                  color: kNavy,
                  fontSize: 14,
                  fontFamily: "Roboto",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              commontextfiled(hintText: 'mumbai chembur'),
              const SizedBox(
                height: 20,
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
                    hint:
                        Text("${widget.data!.eduInfo!.countryOfEducationName}"),
                    value: _selectedCountry,
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
                        _selectedCountry = newValue as String?;
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Province/State is required";
                      }
                    },
                    borderRadius: BorderRadius.circular(5),
                    hint: Text('${widget.data!.genInfo!.province}'),
                    value: _selectedProvinceState,
                    items: provinceState.map((state) {
                      return DropdownMenuItem(
                          value: state.provinceId.toString(),
                          child: Text(
                            state.provinceName.toString(),
                            style: const TextStyle(
                                color: kGrey4,
                                fontFamily: "Roboto",
                                fontSize: 13),
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedProvinceState = newValue as String?;
                      });
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(hintText: 'City/Town'),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(hintText: '${widget.data!.genInfo!.pincode}'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Mailing Address (Current residence address)',
                style: TextStyle(
                  color: kNavy,
                  fontSize: 14,
                  fontFamily: "Roboto",
                ),
              ),
              CheckboxListTile(
                activeColor: Colors.orange,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Same as above'),
                value: _checkboxListTile,
                onChanged: (value) {
                  setState(() {
                    _checkboxListTile = !_checkboxListTile;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(hintText: 'Mumbai Chembur'),
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
                    hint: const Text("India"),
                    value: selectedCountry,
                    items: _country.map((country) {
                      return DropdownMenuItem(
                          value: country,
                          child: Text(
                            country,
                            style: const TextStyle(
                                color: kGrey4,
                                fontFamily: "Roboto",
                                fontSize: 13),
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCountry = newValue as String?;
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(5),
                    hint: const Text("Maharashtra"),
                    value: selectedState,
                    items: _state.map((state) {
                      return DropdownMenuItem(
                          value: state,
                          child: Text(
                            state,
                            style: const TextStyle(
                                color: kGrey4,
                                fontFamily: "Roboto",
                                fontSize: 13),
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedState = newValue as String?;
                      });
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(hintText: 'mumbai'),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(hintText: '470071'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Emergency Contact ",
                style: TextStyle(
                  color: kNavy,
                  fontSize: 14,
                  fontFamily: "Roboto",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(
                  hintText: '${widget.data!.genInfo!.emrgencyName}'),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(
                  hintText: '${widget.data!.genInfo!.emergencyRelation}'),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(
                  hintText: '${widget.data!.genInfo!.emergencyEmail}'),
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
                    validator: (value) {
                      if (value == null) {
                        return "Country is required";
                      }
                    },
                    borderRadius: BorderRadius.circular(5),
                    hint: const Text("Country"),
                    value: selectedCountryCode,
                    items: countryCode1.map((country) {
                      return DropdownMenuItem(
                          value: country.countryCode.toString(),
                          child: Text(
                            country.countryName.toString(),
                            style: const TextStyle(
                                color: kGrey4,
                                fontFamily: "Roboto",
                                fontSize: 13),
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCountryCode = newValue as String?;
                      });
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(
                  hintText: '${widget.data!.genInfo!.emergencyCellPhone}'),
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
                    validator: (value) {
                      if (value == null) {
                        return "Country is required";
                      }
                    },
                    borderRadius: BorderRadius.circular(5),
                    hint: const Text("Country"),
                    value: selectedCountryCode1,
                    items: countryCode2.map((country) {
                      return DropdownMenuItem(
                          value: country.countryCode.toString(),
                          child: Text(
                            country.countryName.toString(),
                            style: const TextStyle(
                                color: kGrey4,
                                fontFamily: "Roboto",
                                fontSize: 13),
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCountryCode1 = newValue as String?;
                      });
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              commontextfiled(
                  hintText: '${widget.data!.genInfo!.emergencyBusinessPhone}'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
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
                  InkWell(
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
                  InkWell(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              supportSection(),
            ],
          ),
        ),
      ),
    );
  }
}
