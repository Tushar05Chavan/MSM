import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class MasterDegreeScreen extends StatefulWidget {
  @override
  _MasterDegreeScreenState createState() => _MasterDegreeScreenState();
}

class _MasterDegreeScreenState extends State<MasterDegreeScreen> {
  String? _selectedCountry;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];
  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Alderson Broaddus University',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 20, color: Colors.black),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'MSM Unify managed institution',
                  style: TextStyle(
                      color: kDarkGrey, fontSize: 14, fontFamily: 'Poppins'),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Mster's Degree",
                  style: TextStyle(
                    color: kDarkGrey,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: Get.height * 0.58,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    children: [
                      const Text(
                        'Executive Master of Science in Information Technology Administration',
                        style: TextStyle(
                            color: kRed, fontSize: 17, fontFamily: 'Poppins'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Duration',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontFamily: 'Poppins',
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '1 year year',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontFamily: 'Poppins',
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Application Fee',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontFamily: 'Poppins',
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'USD 30.00',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontFamily: 'Poppins',
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Trustion Fee',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontFamily: 'Poppins',
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'USD 16000.00',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontFamily: 'Poppins',
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Intakes',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontFamily: 'Poppins',
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'jan-2022,Aug-2022,Oct-2023,Mar-2023,May-2023,\nJun-2023,Oct-2023',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontFamily: 'Poppins',
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Status',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontFamily: 'Poppins',
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Open,Open,open,Open,Open,Open,Open,Open,\nOpen',
                              style: TextStyle(
                                  color: kGreen,
                                  fontFamily: 'Poppins',
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: Get.height * 0.04,
                            width: Get.width * 0.30,
                            decoration: BoxDecoration(
                              border: Border.all(color: kRed),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Center(
                              child: Text(
                                'Read More',
                                style: TextStyle(
                                  color: kRed,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: Get.height * 0.04,
                            width: Get.width * 0.30,
                            decoration: BoxDecoration(
                              color: kRed,
                              border: Border.all(color: kRed),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply Now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
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
