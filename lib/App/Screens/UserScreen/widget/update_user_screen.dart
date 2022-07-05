import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';

import '../../../common/color_constant.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({Key? key}) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _mobileNo = TextEditingController();
  final _skypeId = TextEditingController();
  final _city = TextEditingController();
  final _zipCode = TextEditingController();

  String? _selectedCountry;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];

  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;
  bool _primaryCheck = true;

  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];

  String? _province;
  final List<String> _provinceType = ['None'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Search program to apply",
                      style: TextStyle(
                          color: Color(0xff555555),
                          fontFamily: 'Roboto',
                          fontSize: 11),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height * 0.060,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kGrey4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                borderRadius: BorderRadius.circular(5),
                                hint: const Text("Nationalities"),
                                value: _selectedCountry,
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
                                    _selectedCountry = newValue as String?;
                                  });
                                }),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: Get.height * 0.060,
                            width: Get.width * 0.55,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.2)),
                                  hintText: 'What do you Want to study?',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height * 0.060,
                          width: Get.width * 0.30,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.2)),
                                hintText: 'Destination',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.060,
                          width: Get.width * 0.35,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kGrey4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                borderRadius: BorderRadius.circular(5),
                                hint: const Text("All"),
                                value: _selectedPartner,
                                items: _partner.map((partner) {
                                  return DropdownMenuItem(
                                      value: partner,
                                      child: Text(
                                        partner,
                                        style: const TextStyle(
                                            color: kGrey4,
                                            fontFamily: "Roboto",
                                            fontSize: 13),
                                      ));
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedPartner = newValue as String?;
                                  });
                                }),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.060,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                              color: kNavy,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/back.svg',
                            height: 22,
                            width: 22,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Back',
                            style: TextStyle(
                                color: kGrey5,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Row(
                  children: const [
                    Text(
                      'Update User Detail',
                      style: TextStyle(
                          color: kNavy,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Container(
                  height: Get.height * 0.15,
                  width: Get.width * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/images/avatar.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: Get.height * 0.03,
                        width: Get.width * 0.15,
                        decoration: BoxDecoration(
                            color: Color(0xff34bf49),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Upload',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 13),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    InkWell(
                      child: Container(
                        height: Get.height * 0.03,
                        width: Get.width * 0.23,
                        decoration: BoxDecoration(
                            color: kRed,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Remove',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 13),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.red,
                      value: _primaryCheck,
                      onChanged: (value) {
                        setState(() {
                          _primaryCheck = value!;
                        });
                      },
                    ),
                    Text(
                      'Primary',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontFamily: 'Roboto',
                          fontSize: 14),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _name,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Display Name',
                      labelText: 'Display Name',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: 'Roboto',
                          fontSize: 13),
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
                            width: 1,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _email,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'infoeduglobal.org@gmail.com',
                      labelText: 'Email ID',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: 'Roboto',
                          fontSize: 13),
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
                            width: 1,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _mobileNo,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: '9904275187',
                      labelText: 'Mobile No',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: 'Roboto',
                          fontSize: 13),
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
                            width: 1,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _skypeId,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Skype ID',
                      // labelText: 'Skype ID',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: 'Roboto',
                          fontSize: 13),
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
                            width: 1,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: Get.height * 0.055,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kGrey),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          borderRadius: BorderRadius.circular(15),
                          hint: const Text("Country"),
                          value: _selectedCountry,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 13),
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
                              _selectedCountry = newValue as String?;
                            });
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: Get.height * 0.055,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kGrey),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          borderRadius: BorderRadius.circular(15),
                          hint: const Text("Province"),
                          value: _province,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 13),
                          items: _provinceType.map((country) {
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
                              _province = newValue as String?;
                            });
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _city,
                    decoration: InputDecoration(
                      hintText: 'City',
                      labelText: 'City',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: 'Roboto',
                          fontSize: 13),
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
                            width: 1,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _zipCode,
                    decoration: InputDecoration(
                      hintText: 'Zip Code',
                      labelText: 'Zip Code',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: 'Roboto',
                          fontSize: 13),
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
                            width: 1,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: Get.height * 0.045,
                        width: Get.width * 0.25,
                        decoration: BoxDecoration(
                            border: Border.all(color: kRed),
                            borderRadius: BorderRadius.circular(13)),
                        child: const Center(
                          child: Text('Cancel',
                              style: TextStyle(
                                  color: kRed,
                                  fontSize: 16,
                                  fontFamily: 'Roboto')),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: Get.height * 0.045,
                        width: Get.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kRed),
                        child: const Center(
                          child: Text(
                            'Update',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.04,
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
