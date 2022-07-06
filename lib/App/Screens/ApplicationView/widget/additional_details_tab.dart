import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class AdditionDetails extends StatefulWidget {
  @override
  _AdditionDetailsState createState() => _AdditionDetailsState();
}

class _AdditionDetailsState extends State<AdditionDetails> {
  ///Additional Details
  String? _selectedStudentStatus;
  String? _selectedCitizenship;
  bool _checkboxAdditional = false;
  bool _agentRepresentation = false;
  bool _additionalDetails1 = false;
  bool _additionalDetails2 = false;
  bool _additionalDetails3 = false;
  bool _additionalDetails4 = false;
  bool _canTest = false;
  bool _ielts = false;
  bool _melab = false;
  bool _tofel = false;
  bool _other = false;
  bool _additionalDetails45 = false;
  bool _additionalDetails6 = false;
  bool _firstNation = false;
  bool _metis = false;
  bool _inuit = false;
  bool _mobility = false;
  bool _hearing = false;
  bool _vision = false;
  bool _learning = false;
  bool _mentalHealth = false;
  bool _others = false;
  bool _additionalDetails7 = false;
  bool _additionalDetails8 = false;
  bool _additionalDetails9 = false;
  bool _additionalDetails10 = false;
  bool _additionalDetails11 = false;
  bool _additionalDetails12 = false;
  bool _cbu = false;
  bool _sportsandrecreation = false;
  bool _oncampus = false;
  bool _offCampus = false;
  bool _studentClubs = false;
  bool _scholarships = false;
  bool _daycare = false;
  bool _servicesFor = false;
  bool _religious = false;
  bool _healthServices = false;
  bool _collageOfCap = false;
  bool _xaviercollage = false;
  bool _nsEastern = false;
  bool _art = false;
  bool _tutoring = false;
  bool _onCampusEmployment = false;
  bool _volunteerService = false;
  bool _writingCentre = false;
  bool _studentLoan = false;
  bool _other3 = false;
  int yesval = -1;
  int yesval1 = -1;
  int yesval2 = -1;
  int yesval3 = -1;
  int yesval4 = -1;
  int yesval5 = -1;
  int yesval6 = -1;
  int yesval7 = -1;
  final List<String> _studentStatus = [
    'None',
    'First Year Student-Direct ',
    'First Year Student-Previous ',
    'Mature Student-Non-traditional',
  ];
  final List<String> _citizenShip = [
    'Canadian Citizen',
    'Studay permit',
    'Other',
    'Permanent Resident'
  ];
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final TextEditingController _additionalDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'Please Check here if you are applying for Distance Education'),
                  value: _checkboxAdditional,
                  onChanged: (value) {
                    setState(() {
                      _checkboxAdditional = !_checkboxAdditional;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator: (title) {
                        if (title != null) {
                          return "Please Student Status";
                        }
                      },
                      borderRadius: BorderRadius.circular(5),
                      hint: const Text("Student Status"),
                      value: _selectedStudentStatus,
                      items: _studentStatus.map((studentStatus) {
                        return DropdownMenuItem(
                            value: studentStatus,
                            child: Text(
                              studentStatus,
                              style: const TextStyle(
                                  color: kGrey4,
                                  fontFamily: "Roboto",
                                  fontSize: 13),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedStudentStatus = newValue as String?;
                        });
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'Other Student Status (if not in above list)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText:
                          'Former Student ID Number if known (for returning)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'home institution (for exchange student)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    color: kNavy,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'Previos Surname (if applicable)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'Preferred Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Social Insurance Number',
                  style: TextStyle(
                    color: Color(0xff3C4858),
                    fontFamily: 'Poppins',
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'Telephone Home',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'fax',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'CURRENT MAILING ADDRESS',
                  style: TextStyle(
                    color: Color(0xff3C4858),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('SAME AS ABOVE,OR UNTIL'),
                  value: _checkboxAdditional,
                  onChanged: (value) {
                    setState(() {
                      _checkboxAdditional = !_checkboxAdditional;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _additionalDate,
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.today),
                        onPressed: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());

                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now()))!;
                          _additionalDate.text = formatter.format(date);
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'Apt/PO Box Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Citizenship Status',
                  style: TextStyle(
                    color: kNavy,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator: (title) {
                        if (title != null) {
                          return "Please Select Citizenship Status";
                        }
                      },
                      borderRadius: BorderRadius.circular(5),
                      hint: const Text("Citizenship Status"),
                      value: _selectedCitizenship,
                      items: _citizenShip.map((citizenShip) {
                        return DropdownMenuItem(
                            value: citizenShip,
                            child: Text(
                              citizenShip,
                              style: const TextStyle(
                                  color: kGrey4,
                                  fontFamily: "Roboto",
                                  fontSize: 13),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCitizenship = newValue as String?;
                        });
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'Other Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _additionalDate,
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.today),
                        onPressed: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());

                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now()))!;
                          _additionalDate.text = formatter.format(date);
                        },
                      ),
                      hintText: 'date of entry into canada',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Agent Representation (International Students)',
                  style: TextStyle(
                    color: kNavy,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'Please check here if correspondence should be addressed to Agent. All correspondence after an offer of admission has been made will be directed to the student’s mailing address '),
                  value: _agentRepresentation,
                  onChanged: (value) {
                    setState(() {
                      _agentRepresentation = !_agentRepresentation;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Language Skills  Check All that Apply',
                  style: TextStyle(
                    color: kNavy,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'The language of instruction throughout my high school education was English '),
                  value: _additionalDetails1,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails1 = !_additionalDetails1;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'I have completed at least 30 credits of post-secondary study in English  '),
                  value: _additionalDetails2,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails2 = !_additionalDetails2;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'I have taken an English language proficiency test (official marks required from test company) '),
                  value: _additionalDetails3,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails3 = !_additionalDetails3;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('CAEL'),
                  value: _additionalDetails4,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails4 = !_additionalDetails4;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Can Test'),
                  value: _canTest,
                  onChanged: (value) {
                    setState(() {
                      _canTest = !_canTest;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('IELTS'),
                  value: _ielts,
                  onChanged: (value) {
                    setState(() {
                      _ielts = !_ielts;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('MELAB'),
                  value: _melab,
                  onChanged: (value) {
                    setState(() {
                      _melab = !_melab;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('TOFEL'),
                  value: _tofel,
                  onChanged: (value) {
                    setState(() {
                      _tofel = !_tofel;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Other'),
                  value: _other,
                  onChanged: (value) {
                    setState(() {
                      _other = !_other;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'I will be taking an English language proficiency test on '),
                  value: _additionalDetails45,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails45 = !_additionalDetails45;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _additionalDate,
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.today),
                        onPressed: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());

                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now()))!;
                          _additionalDate.text = formatter.format(date);
                        },
                      ),
                      hintText: 'Test Date',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'I will be studying English prior to academic studies at CBU and seek a conditional admission.  '),
                  value: _additionalDetails6,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails6 = !_additionalDetails6;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText:
                          'At what institution will you be studying English?',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Self Identification (Optional)',
                  style: TextStyle(
                    color: kNavy,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Are You an aboriginal Person?',
                  style: TextStyle(
                      color: Color(0xff3C4858),
                      fontSize: 16,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(
                  height: 15,
                ),

                // Row(
                //   children: [
                //     SizedBox(
                //       width: Get.width * 0.30,
                //       child: RadioListTile(
                //           value: 1,
                //           groupValue: yesval,
                //           onChanged: (value) {
                //             setState(() {
                //               yesval = value as int;
                //             });
                //           },
                //           title: Text('yes')),
                //     ),
                //     SizedBox(
                //       width: Get.width * 0.30,
                //       child: RadioListTile(
                //           value: 2,
                //           groupValue: yesval,
                //           onChanged: (index) {
                //             setState(() {
                //               yesval = index as int;
                //             });
                //           },
                //           title: Text('No')),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 1,
                          groupValue: yesval,
                          onChanged: (value) {
                            setState(() {
                              yesval = value as int;
                            });
                          },
                          title: Text('Yes')),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 2,
                          groupValue: yesval,
                          onChanged: (index) {
                            setState(() {
                              yesval = index as int;
                            });
                          },
                          title: Text('No')),
                    ),
                  ],
                ),


                const Text(
                  'Please Specify',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff3C4858),
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('North American Indian/First nation'),
                  value: _firstNation,
                  onChanged: (value) {
                    setState(() {
                      _firstNation = !_firstNation;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('metis'),
                  value: _metis,
                  onChanged: (value) {
                    setState(() {
                      _metis = !_metis;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Inuit'),
                  value: _inuit,
                  onChanged: (value) {
                    setState(() {
                      _inuit = !_inuit;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Are you a member of another visible minority?',
                  style: TextStyle(
                      color: Color(0xff3C4858),
                      fontSize: 16,
                      fontFamily: 'Poppins'),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 1,
                          groupValue: yesval1,
                          onChanged: (value) {
                            setState(() {
                              yesval1 = value as int;
                            });
                          },
                          title: Text('yes')),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 2,
                          groupValue: yesval1,
                          onChanged: (index) {
                            setState(() {
                              yesval1 = index as int;
                            });
                          },
                          title: Text('No')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'Please Specify',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Do you have a permanent disability?',
                  style: TextStyle(
                      color: Color(0xff3C4858),
                      fontSize: 16,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 1,
                          groupValue: yesval2,
                          onChanged: (value) {
                            setState(() {
                              yesval2 = value as int;
                            });
                          },
                          title: Text('yes')),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 2,
                          groupValue: yesval2,
                          onChanged: (index) {
                            setState(() {
                              yesval2 = index as int;
                            });
                          },
                          title: Text('No')),
                    ),
                  ],
                ),
                const Text(
                  'Please Specify',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff3C4858),
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Mobility'),
                  value: _mobility,
                  onChanged: (value) {
                    setState(() {
                      _mobility = !_mobility;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Hearing'),
                  value: _hearing,
                  onChanged: (value) {
                    setState(() {
                      _hearing = !_hearing;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Vision'),
                  value: _vision,
                  onChanged: (value) {
                    setState(() {
                      _vision = !_vision;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Learning'),
                  value: _learning,
                  onChanged: (value) {
                    setState(() {
                      _learning = !_learning;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Mental Health'),
                  value: _mentalHealth,
                  onChanged: (value) {
                    setState(() {
                      _mentalHealth = !_mentalHealth;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('other'),
                  value: _others,
                  onChanged: (value) {
                    setState(() {
                      _others = !_others;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'Nearest relative who attended CBU',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (fName) {
                    if (fName != null) {
                      return "Please Enter First Name";
                    }
                  },
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      hintText: 'Relationship',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _additionalDate,
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.today),
                        onPressed: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());

                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now()))!;
                          _additionalDate.text = formatter.format(date);
                        },
                      ),
                      hintText: 'Approximate year attended',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'EMERGENCY CONTACT',
                  style: TextStyle(
                    color: kNavy,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('same as permanent home address,or: '),
                  value: _mobility,
                  onChanged: (value) {
                    setState(() {
                      _mobility = !_mobility;
                    });
                  },
                ),
                const Text(
                  'ADMISSION APPLICATION CHECKLIST',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff3C4858),
                      fontFamily: 'Roboto'),
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title:
                      const Text('Application form is complete and signed. '),
                  value: _additionalDetails7,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails7 = !_additionalDetails7;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'Non-refundable application fee is required (36 Domestic/103 International Student, 50 for Education programs). '),
                  value: _additionalDetails8,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails8 = !_additionalDetails8;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'Transcript of high school grades which must include courses currently registered  currently completing high school'),
                  value: _additionalDetails9,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails9 = !_additionalDetails9;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'If transferring from another post-secondary institution, official transcripts must be sent from the transfer institution(University or College). If seeking transfer credits please submit a Transfer Credit Assessment application (available awww.cbu.ca/admissions) and assessment fee. '),
                  value: _additionalDetails10,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails10 = !_additionalDetails10;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'Official copy of proof of English language Proficiency Testing Score (if first langauage is not English or previous education was not delivered in english) mus be submitted direct from the testing organization.'),
                  value: _additionalDetails11,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails11 = !_additionalDetails11;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                      'Your application cannot be processed until the application fee and all documentation have been received. '),
                  value: _additionalDetails12,
                  onChanged: (value) {
                    setState(() {
                      _additionalDetails12 = !_additionalDetails12;
                    });
                  },
                ),
                const Text(
                  'INTENDED CONCENTRATION / MAJOR',
                  style: TextStyle(
                    color: kNavy,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                commontextfiled(
                  hintText: 'Please specify  Major/Concentration',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Currently Are You Attending',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff3C4858),
                    fontFamily: 'Poppins',
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.45,
                      child: RadioListTile(
                          value: 1,
                          groupValue: yesval3,
                          onChanged: (value) {
                            setState(() {
                              yesval3 = value as int;
                            });
                          },
                          title: Text('High School')),
                    ),
                    SizedBox(
                      width: Get.width * 0.45,
                      child: RadioListTile(
                          value: 2,
                          groupValue: yesval3,
                          onChanged: (index) {
                            setState(() {
                              yesval3 = index as int;
                            });
                          },
                          title: Text('Collage')),
                    ),
                  ],
                ),
                RadioListTile(
                    value: 3,
                    groupValue: yesval3,
                    onChanged: (index) {
                      setState(() {
                        yesval3 = index as int;
                      });
                    },
                    title: Text('University')),
                RadioListTile(
                    value: 4,
                    groupValue: yesval3,
                    onChanged: (index) {
                      setState(() {
                        yesval3 = index as int;
                      });
                    },
                    title: Text('Other Secondary School')),
                RadioListTile(
                    value: 5,
                    groupValue: yesval3,
                    onChanged: (index) {
                      setState(() {
                        yesval3 = index as int;
                      });
                    },
                    title: Text('No Educational Institution')),
                const Text(
                  'In your school Semestered?',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff3C4858),
                    fontFamily: 'Poppins',
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 1,
                          groupValue: yesval4,
                          onChanged: (value) {
                            setState(() {
                              yesval4 = value as int;
                            });
                          },
                          title: Text('yes ')),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 2,
                          groupValue: yesval4,
                          onChanged: (index) {
                            setState(() {
                              yesval4 = index as int;
                            });
                          },
                          title: Text('No ')),
                    ),
                  ],
                ),
                const Text(
                  'Please indicate if you will write or have written International Baccalaureate or Advanced Placement (College Board) examination for',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff3C4858),
                    fontFamily: 'Poppins',
                  ),
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('CBU or UCCB'),
                  value: _cbu,
                  onChanged: (value) {
                    setState(() {
                      _cbu = !_cbu;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Collage of Cape Breton'),
                  value: _collageOfCap,
                  onChanged: (value) {
                    setState(() {
                      _collageOfCap = !_collageOfCap;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Xavier Junior Collage'),
                  value: _xaviercollage,
                  onChanged: (value) {
                    setState(() {
                      _xaviercollage = !_xaviercollage;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('N.S Eastern Institute of Technology'),
                  value: _nsEastern,
                  onChanged: (value) {
                    setState(() {
                      _nsEastern = !_nsEastern;
                    });
                  },
                ),
                const Text(
                  'Were you accepted ',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff3C4858),
                    fontFamily: 'Poppins',
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 1,
                          groupValue: yesval5,
                          onChanged: (value) {
                            setState(() {
                              yesval5 = value as int;
                            });
                          },
                          title: Text('Yes')),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 2,
                          groupValue: yesval5,
                          onChanged: (index) {
                            setState(() {
                              yesval5 = index as int;
                            });
                          },
                          title: Text('No')),
                    ),
                  ],
                ),
                const Text(
                  'If Yes, did you attend? ',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff3C4858),
                    fontFamily: 'Poppins',
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 1,
                          groupValue: yesval6,
                          onChanged: (value) {
                            setState(() {
                              yesval6 = value as int;
                            });
                          },
                          title: Text('Yes')),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 2,
                          groupValue: yesval6,
                          onChanged: (index) {
                            setState(() {
                              yesval6 = index as int;
                            });
                          },
                          title: Text('No')),
                    ),
                  ],
                ),
                commontextfiled(
                  hintText: 'Years attended',
                ),
                const SizedBox(
                  height: 15,
                ),
                commontextfiled(
                  hintText: 'Former ID No.(if known)',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Have you ever been required to withdraw from any post-secondary institution, including CBU?',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff3C4858),
                    fontFamily: 'Poppins',
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 1,
                          groupValue: yesval7,
                          onChanged: (value) {
                            setState(() {
                              yesval7 = value as int;
                            });
                          },
                          title: Text('Yes')),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: RadioListTile(
                          value: 2,
                          groupValue: yesval7,
                          onChanged: (index) {
                            setState(() {
                              yesval7 = index as int;
                            });
                          },
                          title: Text('No')),
                    ),
                  ],
                ),
                commontextfiled(
                  hintText: 'If yes,state name of institution',
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _additionalDate,
                  cursorColor: kRed,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.today),
                        onPressed: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());

                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now()))!;
                          _additionalDate.text = formatter.format(date);
                        },
                      ),
                      hintText: 'Year required to withdraw',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                commontextfiled(
                  hintText: 'How did you hear about CBU',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'PERSONAL \nINTERESTS/ADDITIONAL INFORMATION (OPTIONAL)',
                  style: TextStyle(
                    color: kNavy,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                commontextfiled(
                  hintText:
                      'Please use this space to include any additional inform.',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Please indicate if you would like more information on CBU regarding the items listed below',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff3C4858),
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Sports and recreation'),
                  value: _sportsandrecreation,
                  onChanged: (value) {
                    setState(() {
                      _sportsandrecreation = !_sportsandrecreation;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('On-campus accommodations'),
                  value: _oncampus,
                  onChanged: (value) {
                    setState(() {
                      _oncampus = !_oncampus;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Off-campus accommodations'),
                  value: _offCampus,
                  onChanged: (value) {
                    setState(() {
                      _offCampus = !_offCampus;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Student clubs and organizations'),
                  value: _studentClubs,
                  onChanged: (value) {
                    setState(() {
                      _studentClubs = !_studentClubs;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Services for students with disabilities '),
                  value: _servicesFor,
                  onChanged: (value) {
                    setState(() {
                      _servicesFor = !_servicesFor;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Religious services  '),
                  value: _religious,
                  onChanged: (value) {
                    setState(() {
                      _religious = !_religious;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Health services'),
                  value: _healthServices,
                  onChanged: (value) {
                    setState(() {
                      _healthServices = !_healthServices;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Art'),
                  value: _art,
                  onChanged: (value) {
                    setState(() {
                      _art = !_art;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Tutoring'),
                  value: _tutoring,
                  onChanged: (value) {
                    setState(() {
                      _tutoring = !_tutoring;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('On-campus employment '),
                  value: _onCampusEmployment,
                  onChanged: (value) {
                    setState(() {
                      _onCampusEmployment = !_onCampusEmployment;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Volunteer service '),
                  value: _volunteerService,
                  onChanged: (value) {
                    setState(() {
                      _volunteerService = !_volunteerService;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Writing Centre '),
                  value: _writingCentre,
                  onChanged: (value) {
                    setState(() {
                      _writingCentre = !_writingCentre;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Student loan '),
                  value: _studentLoan,
                  onChanged: (value) {
                    setState(() {
                      _studentLoan = !_studentLoan;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Scholarships and bursaries '),
                  value: _scholarships,
                  onChanged: (value) {
                    setState(() {
                      _scholarships = !_scholarships;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Daycare '),
                  value: _daycare,
                  onChanged: (value) {
                    setState(() {
                      _daycare = !_daycare;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Other'),
                  value: _other3,
                  onChanged: (value) {
                    setState(() {
                      _other3 = !_other3;
                    });
                  },
                ),
                commontextfiled(
                  hintText: 'Other',
                ),
                const SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: Get.height * 0.045,
                    width: Get.width * 0.20,
                    decoration: BoxDecoration(
                      color: kGreen1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                supportSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
