import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final _currentPass = TextEditingController();
  final _newPass = TextEditingController();
  final _confirmPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _formKey,
        resizeToAvoidBottomInset: false,
        body: Padding(
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
                  const SizedBox(
                    height: 20,
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
                height: Get.height * 0.05,
              ),
              Container(
                height: Get.height * 0.50,
                width: Get.width * 0.80,
                decoration: BoxDecoration(
                    border: Border.all(color: kColorPrimary, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.060,
                      width: Get.width * 0.80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: kRed),
                      child: Center(
                        child: Text('Change Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Roboto")),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        validator: (value) {
                          bool passValid = RegExp(
                                  "^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*")
                              .hasMatch(value!);

                          if (value.isEmpty || !passValid) {
                            return 'At least Password must be valid';
                          }
                        },
                        controller: _currentPass,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Current Password',
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
                                color: kColorPrimary,
                                width: 1,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'New Password',
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
                                color: kColorPrimary,
                                width: 1,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
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
                                color: kColorPrimary,
                                width: 1,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.07,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: Get.height * 0.05,
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
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              supportSection(),
            ],
          ),
        ),
      ),
    );
  }
}
