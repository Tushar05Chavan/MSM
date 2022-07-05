import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';

import '../../../common/color_constant.dart';

class ProgramInfoTab extends StatefulWidget {
  const ProgramInfoTab({Key? key}) : super(key: key);

  @override
  State<ProgramInfoTab> createState() => _ProgramInfoTabState();
}

class _ProgramInfoTabState extends State<ProgramInfoTab> {
  bool _checkBoxVal = false;

  String? _selectedInstitute;
  List<String> _institute = ['All', 'Acadamey of Art University', 'ACMi'];

  String? _selectedProgram;
  List<String> _program = ['Search', 'All', 'None'];

  String? _selcetedIntake;
  List<String> _intake = ['Search', 'All', 'None'];

  String? _selectedCampus;
  List<String> _campus = ['Search', 'Wolfville', 'None'];

  String? _selectedReside;
  List<String> _reside = ['Search', 'All', 'None'];

  String? _selectedMode;
  List<String> _mode = ['Search', 'All', 'None'];

  String? _selectedPref1;
  List<String> _Presf1 = ['BCA', 'MCA', 'B.Com', 'M.Com'];

  String? _selectedPref2;
  List<String> _Presf2 = ['BCA', 'MCA', 'B.Com', 'M.Com'];

  String? _selectedPref3;
  List<String> _Presf3 = ['BCA', 'MCA', 'B.Com', 'M.Com'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Get.height * 0.060,
                      width: Get.width * 0.44,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kGrey4),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(5),
                            hint: const Text("Institution"),
                            value: _selectedInstitute,
                            items: _institute.map((institute) {
                              return DropdownMenuItem(
                                  value: institute,
                                  child: Text(
                                    institute,
                                    style: const TextStyle(
                                        color: kGrey4,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedInstitute = newValue as String?;
                              });
                            }),
                      ),
                    ),
                    Container(
                      height: Get.height * 0.060,
                      width: Get.width * 0.44,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kGrey4),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            borderRadius: BorderRadius.circular(5),
                            hint: const Text("Program"),
                            value: _selectedProgram,
                            items: _program.map((program) {
                              return DropdownMenuItem(
                                  value: program,
                                  child: Text(
                                    program,
                                    style: const TextStyle(
                                        color: kGrey4,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedProgram = newValue as String?;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.060,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kGrey4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        hint: const Text("Intake"),
                        value: _selcetedIntake,
                        items: _intake.map((institute) {
                          return DropdownMenuItem(
                              value: institute,
                              child: Text(
                                institute,
                                style: const TextStyle(
                                    color: kGrey4,
                                    fontFamily: "Roboto",
                                    fontSize: 13),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selcetedIntake = newValue as String?;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.060,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kGrey4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        hint: const Text("Campus"),
                        value: _selectedCampus,
                        items: _campus.map((campus) {
                          return DropdownMenuItem(
                              value: campus,
                              child: Text(
                                campus,
                                style: const TextStyle(
                                    color: kGrey4,
                                    fontFamily: "Roboto",
                                    fontSize: 13),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCampus = newValue as String?;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.060,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kGrey4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        hint: const Text("Student Residing"),
                        value: _selectedReside,
                        items: _reside.map((reside) {
                          return DropdownMenuItem(
                              value: reside,
                              child: Text(
                                reside,
                                style: const TextStyle(
                                    color: kGrey4,
                                    fontFamily: "Roboto",
                                    fontSize: 13),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedReside = newValue as String?;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.060,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kGrey4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        hint: const Text("Mode"),
                        value: _selectedMode,
                        items: _mode.map((mode) {
                          return DropdownMenuItem(
                              value: mode,
                              child: Text(
                                mode,
                                style: const TextStyle(
                                    color: kGrey4,
                                    fontFamily: "Roboto",
                                    fontSize: 13),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedMode = newValue as String?;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonContainer(
                  title: 'Submission Deadline',
                  subTitle: '',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonContainer(
                  title: 'Duration',
                  subTitle: '4 Years',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonContainer(
                  title: 'Average Processing Time',
                  subTitle: '24 Hours',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonContainer(
                  title: 'Cost of Living',
                  subTitle: 'CAD 40 one-time',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonContainer(
                  title: 'LOA Deposit',
                  subTitle: 'CAD 500 one-time',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonContainer(
                  title: 'Minimum Deposit',
                  subTitle: 'CAD 9486.75 per semester',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CommonContainer(
                  title: 'Tuition Fee',
                  subTitle: 'CAD 18973.5 per year',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.red,
                      value: _checkBoxVal,
                      onChanged: (value) {
                        setState(() {
                          _checkBoxVal = value!;
                        });
                      },
                    ),
                    Text(
                      'Add backup programs',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontFamily: 'Roboto',
                          fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Preference 1',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: 'Roboto',
                          fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.005,
                ),
                Container(
                  height: Get.height * 0.060,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kGrey4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        hint: const Text("Preference"),
                        value: _selectedPref1,
                        items: _Presf1.map((preference) {
                          return DropdownMenuItem(
                              value: preference,
                              child: Text(
                                preference,
                                style: const TextStyle(
                                    color: kGrey4,
                                    fontFamily: "Roboto",
                                    fontSize: 13),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedPref1 = newValue as String?;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      'Sep-2022 -All',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: 'Roboto',
                          fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          color: kRed,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Preference 2',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: 'Roboto',
                          fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.005,
                ),
                Container(
                  height: Get.height * 0.060,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kGrey4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        hint: const Text("Preference"),
                        value: _selectedPref2,
                        items: _Presf2.map((preference) {
                          return DropdownMenuItem(
                              value: preference,
                              child: Text(
                                preference,
                                style: const TextStyle(
                                    color: kGrey4,
                                    fontFamily: "Roboto",
                                    fontSize: 13),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedPref2 = newValue as String?;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      'Sep-2022 -All',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: 'Roboto',
                          fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          color: kRed,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Preference 3',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: 'Roboto',
                          fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.005,
                ),
                Container(
                  height: Get.height * 0.060,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kGrey4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        hint: const Text("Preference"),
                        value: _selectedPref3,
                        items: _Presf3.map((preference) {
                          return DropdownMenuItem(
                              value: preference,
                              child: Text(
                                preference,
                                style: const TextStyle(
                                    color: kGrey4,
                                    fontFamily: "Roboto",
                                    fontSize: 13),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedPref3 = newValue as String?;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RichText(
                    text: TextSpan(
                      text: 'DISCLAIMER:',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      children: [
                        TextSpan(
                            text:
                                'The alternative program choices will be accepted in the order of the preference mentioned. The Admissions Officer will select the program to apply in order of preference if the primary program selected is a) not available; b) student is ineligible; c) other reasons which may not allow submission of application program. The Admissions Officer will take the alternative choices and preference order as final and will submit the application accordingly.',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width * 0.35,
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
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: kRed)),
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
                        width: Get.width * 0.35,
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
                  height: Get.height * 0.05,
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

class CommonContainer extends StatelessWidget {
  const CommonContainer({Key? key, this.title, this.subTitle})
      : super(key: key);

  final title;
  final subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.10,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontFamily: 'Roboto',
                  fontSize: 16),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                  color: Colors.black, fontFamily: 'Roboto', fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
