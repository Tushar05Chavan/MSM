import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
import 'package:msm_unify/viewModel/student_view_view_model.dart';

import '../../../../Api/api_response.dart';

class PersonalInfoTab extends StatefulWidget {
  final StudentViewResponseModel? data;
  const PersonalInfoTab({Key? key, this.data}) : super(key: key);

  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  final _firstName = TextEditingController();
  final _midName = TextEditingController();
  final _lastName = TextEditingController();
  final _date = TextEditingController();
  final _dob = TextEditingController();
  final _email = TextEditingController();
  final _mobileNo = TextEditingController();
  final _passportNo = TextEditingController();
  final _passDate = TextEditingController();

  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final DateFormat formatter2 = DateFormat('dd-MM-yyyy');
  String? _selectedType;
  final List<String> _type = [
    'Mr.',
    'Ms.',
    'Miss',
    'Mrs.',
  ];

  String? _selectedGender;
  final List<String> _gender = ['Male', 'Female', 'Other'];

  String? _selectedStatus;
  final List<String> _status = [
    'Common-law',
    'Divorced',
    'Married',
    'Separeted'
        'Single',
    'Widowed'
  ];

  String? _selectedLanguage;
  final List<String> _language = [
    'English',
    'Gujarati',
    'Hindi',
    'Nepali',
    'Marathi',
    'Oromo'
  ];

  String? _selectedCode;
  final List<String> _code = [
    '91(India)',
    '856(Laos)',
    '371(Latvia)',
    '223(Mali)',
    '218(Libya)'
  ];

  String? _selectedCountry;
  final List<String> _country = ['India', 'Laos', 'Latvia', 'Mali', 'Libya'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GetBuilder<StudentViewViewModel>(
              builder: (controller) {
                if (controller.apiResponse.status == Status.COMPLETE) {
                  StudentViewResponseModel resp = controller.apiResponse.data;
                  print('province: ${resp.genInfo!.province}');
                  _firstName.text = resp.genInfo!.firstName.toString();
                  _midName.text = resp.genInfo!.middleName.toString();
                  _lastName.text = resp.genInfo!.lastName.toString();
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Personal Information',
                            style: TextStyle(
                                color: kNavy,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            children: [
                              TextSpan(
                                  text: '(As indicated on your passport)',
                                  style: TextStyle(
                                      color: kNavy,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w100,
                                      fontSize: 17)),
                            ],
                          ),
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: kGrey, width: 1))),
                            borderRadius: BorderRadius.circular(10),
                            hint: Text('${widget.data!.genInfo!.salution}'),
                            value: _selectedType,
                            items: _type.map((type) {
                              return DropdownMenuItem(
                                  value: type,
                                  child: Text(
                                    type,
                                    style: const TextStyle(
                                        color: kGrey,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedType = newValue as String?;
                              });
                            }),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CommonTextField(
                          control: _firstName,
                          hintText: '${widget.data!.genInfo!.firstName}'),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CommonTextField(
                          control: _midName,
                          hintText: '${widget.data!.genInfo!.middleName}'),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CommonTextField(
                          control: _lastName,
                          hintText: '${widget.data!.genInfo!.lastName}'),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: kGrey, width: 1))),
                            borderRadius: BorderRadius.circular(10),
                            hint: const Text("Male"),
                            value: _selectedGender,
                            items: _gender.map((gender) {
                              return DropdownMenuItem(
                                  value: gender,
                                  child: Text(
                                    gender,
                                    style: const TextStyle(
                                        color: kGrey,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedGender = newValue as String?;
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
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: kGrey, width: 1))),
                            borderRadius: BorderRadius.circular(10),
                            hint: const Text("Status"),
                            value: _selectedStatus,
                            items: _status.map((status) {
                              return DropdownMenuItem(
                                  value: status,
                                  child: Text(
                                    status,
                                    style: const TextStyle(
                                        color: kGrey,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedStatus = newValue as String?;
                              });
                            }),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      TextFormField(
                        controller: _dob,
                        cursorColor: kRed,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.today, color: kGrey),
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
                          hintText: '${widget.data!.genInfo!.dateOfBirth}',
                          hintStyle: const TextStyle(
                              color: kGrey, fontFamily: 'Roboto'),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'DD/MM/YYYY',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'Ronoto',
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Container(
                        height: Get.height * 0.070,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: kGrey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              hint: const Text("Language"),
                              value: _selectedLanguage,
                              items: _language.map((language) {
                                return DropdownMenuItem(
                                    value: language,
                                    child: Text(
                                      language,
                                      style: const TextStyle(
                                          color: kGrey,
                                          fontFamily: "Roboto",
                                          fontSize: 13),
                                    ));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLanguage = newValue as String?;
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CommonTextField(
                          control: _email,
                          hintText: '${widget.data!.genInfo!.email}'),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        height: Get.height * 0.070,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: kGrey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              hint: const Text("Country Code"),
                              value: _selectedCode,
                              items: _code.map((code) {
                                return DropdownMenuItem(
                                    value: code,
                                    child: Text(
                                      code,
                                      style: const TextStyle(
                                          color: kGrey,
                                          fontFamily: "Roboto",
                                          fontSize: 13),
                                    ));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCode = newValue as String?;
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CommonTextField(
                          control: _mobileNo,
                          hintText: '${widget.data!.genInfo!.mobileNo}'),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Passport Details',
                            style: TextStyle(
                                color: kNavy,
                                fontFamily: 'Roboto',
                                fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: kGrey, width: 1))),
                            borderRadius: BorderRadius.circular(10),
                            hint: const Text("Country"),
                            value: _selectedCountry,
                            items: _country.map((country) {
                              return DropdownMenuItem(
                                  value: country,
                                  child: Text(
                                    country,
                                    style: const TextStyle(
                                        color: kGrey,
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
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      CommonTextField(
                        control: _passportNo,
                        hintText: '${widget.data!.genInfo!.passportNo}',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Please write Passport number/Passport applied/Passport not available',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'Ronoto',
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      TextFormField(
                        controller: _passDate,
                        cursorColor: kRed,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.today, color: kGrey),
                            onPressed: () async {
                              DateTime date = DateTime(1900);
                              FocusScope.of(context).requestFocus(FocusNode());

                              date = (await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2039)))!;
                              _passDate.text = formatter2.format(date);
                            },
                          ),
                          hintText:
                              '${widget.data!.genInfo!.passportExpiryDate}',
                          hintStyle: const TextStyle(
                              color: kGrey, fontFamily: 'Roboto'),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'DD/MM/YYYY',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'Ronoto',
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ],
                        ),
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
                                style: TextStyle(
                                    fontFamily: 'Roboto', color: kGrey),
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
                                                            BorderRadius
                                                                .circular(5)),
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
                                                  border:
                                                      Border.all(color: kRed),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Center(
                                                  child: Text('Retry',
                                                      style: TextStyle(
                                                          color: kRed,
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
                        height: Get.height * 0.03,
                      ),
                      supportSection()
                    ],
                  );
                } else {
                  if (controller.apiResponse.status == Status.ERROR) {
                    return const CircularProgressIndicator();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {Key? key,
      this.control,
      this.hintText,
      this.title,
      this.subtitle,
      this.lableText})
      : super(key: key);

  final control;
  final hintText;
  final title;
  final subtitle;
  final lableText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      decoration: InputDecoration(
        labelText: lableText,
        hintText: hintText,
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
    );
  }
}
