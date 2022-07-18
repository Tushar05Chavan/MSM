import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class AgentEvalutionFormScreen extends StatefulWidget {
  const AgentEvalutionFormScreen({Key? key}) : super(key: key);

  @override
  _AgentEvalutionFormScreenState createState() =>
      _AgentEvalutionFormScreenState();
}

class _AgentEvalutionFormScreenState extends State<AgentEvalutionFormScreen> {
  String? _selectedCountry;
  String? _selectedPartner;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];
  String? _selectedInstitution;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  final List<String> _institution = [
    'Institution',
    'Abertsityay Univer',
    'Hanover Collage'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/back.svg',
                      height: 22,
                      width: 22,
                    ),
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Profile - Edu Global Overseas',
                style: TextStyle(
                  color: kNavy,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    )),
                child: Column(
                  children: [
                    const Text(
                      'Agent Evalution Form ',
                      style: TextStyle(
                          color: kNavy, fontFamily: 'Poppins', fontSize: 21),
                    ),
                    SizedBox(
                      height: Get.height * 0.08,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: 'Partner Type (Auto fetched)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(5),
                          hint: const Text("Institution *"),
                          value: _selectedInstitution,
                          items: _institution.map((institution) {
                            return DropdownMenuItem(
                                value: institution,
                                child: Text(
                                  institution,
                                  style: const TextStyle(
                                      color: kGrey4,
                                      fontFamily: "Roboto",
                                      fontSize: 13),
                                ));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedInstitution = newValue as String?;
                            });
                          }),
                    ),
                    SizedBox(
                      height: Get.height * 0.08,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.08,
              ),
              supportSection(),
            ],
          ),
        ),
      ),
    );
  }
}
