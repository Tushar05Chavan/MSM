import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';

import '../../../common/color_constant.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
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
                    InkWell(
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
                      'Add User',
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
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(
                    'assets/images/avatar.jpg',
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
                const CommonTextField(
                  name: 'Display Name',
                  label: 'Display Name',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonTextField(
                  name: 'Email ID',
                  label: 'Email ID',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonTextField(
                  name: 'Mobile No',
                  label: 'Mobile No',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonTextField(
                  name: 'Skype Id',
                  label: 'Skype Id',
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
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 13),
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
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 13),
                          value: _province,
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
                const CommonTextField(
                  name: 'City',
                  label: 'City',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonTextField(
                  name: 'Zip Code',
                  label: 'Zip Code',
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: Get.height * 0.045,
                    width: Get.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: kRed),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 13),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                supportSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField({Key? key, this.name, this.label}) : super(key: key);
  final name;
  final label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: name,
          labelText: label,
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
    );
  }
}
