import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/Institution/master_degree_screen.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:readmore/readmore.dart';

class InstituteProfileScreen extends StatefulWidget {
  const InstituteProfileScreen({Key? key}) : super(key: key);

  @override
  _InstituteProfileScreenState createState() => _InstituteProfileScreenState();
}

class _InstituteProfileScreenState extends State<InstituteProfileScreen> {
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
                  'About the institution',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ReadMoreText(
                  'University HUB connects international students and recruitment partners to educational opportunities at universities around the world. University HUB is a one of the pioneers in guiding and assisting students who are interested in pursuing their education abroad. Since 2010, the group has enrolled over 75,000 students at various US Universities. Been through the entire process of studying abroad, namely in USA, Australia and UK, the founders are well versed with all the challenges that the international students go through while applying to foreign universities. University HUB’s prime aim to Make Study Abroad Easy for the international students.',
                  trimLines: 3,
                  style: TextStyle(
                      color: kDarkGrey, fontSize: 14, fontFamily: 'Poppins'),
                  trimMode: TrimMode.Line,
                  colorClickableText: Colors.red,
                  trimCollapsedText: 'show more',
                  trimExpandedText: 'show less',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Program offerings',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(MasterDegreeScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: Get.height * 0.055,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.3),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Mster's Degree",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: kRed,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: Get.height * 0.75,
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: kDarkGrey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('assets/images/6.png'),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/Institution - Gray.svg',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Public University',
                                  style: TextStyle(
                                    color: kGrey,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/FoundationDate.svg',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '1871',
                                  style: TextStyle(
                                    color: kGrey,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/Location.svg',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: Get.width * 0.30,
                                  child: const Text(
                                    '101 College Hill Rd, Philippi',
                                    style: TextStyle(
                                      color: kGrey,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: Get.height * 0.12,
                                  width: Get.width * 0.45,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/TotalPrograms.svg',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Total program -1',
                                  style: TextStyle(
                                    color: kGrey,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/OpenPrograms.svg',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'open program -1',
                                  style: TextStyle(
                                    color: kGrey,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: Get.height * 0.05,
                        width: Get.width,
                        color: Color(0xffE6EBF3),
                        child: const Center(
                          child: Text(
                            'Contact Details',
                            style: TextStyle(
                              color: kDarkGrey,
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '1.USA Admissions ID',
                          style: TextStyle(
                              color: kDarkGrey,
                              fontFamily: 'Roboto',
                              fontSize: 12),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset('assets/icons/email.svg'),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: Get.width * 0.45,
                            child: const Text(
                              ' usa.admissions@msmunify.io ',
                              style: TextStyle(
                                  color: kDarkGrey,
                                  fontSize: 12,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset('assets/icons/Contact.svg'),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('7486558858'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
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
