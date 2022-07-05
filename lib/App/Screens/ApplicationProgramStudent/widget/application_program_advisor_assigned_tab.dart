import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/model/responseModek/msm_marketing_manager_respone_model.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
import 'package:msm_unify/viewModel/msm_marketing_manager_view_model.dart';

import '../../../../model/responseModek/counsellor_response_model.dart';
import '../../../../viewModel/counsellor_view_model.dart';
import '../../../common/color_constant.dart';

class AppAdvisorAssignTab extends StatefulWidget {
  final StudentViewResponseModel? data;
  const AppAdvisorAssignTab({Key? key, this.data}) : super(key: key);

  @override
  State<AppAdvisorAssignTab> createState() => _AppAdvisorAssignTabState();
}

class _AppAdvisorAssignTabState extends State<AppAdvisorAssignTab> {
  String? _selectedEmail;
  String? _selectedType;
  final CounsellorViewModel _counsellorViewModel =
      Get.put(CounsellorViewModel());

  final MsmMarketingManagerViewModel _msmMarketingManagerViewModel =
      Get.put(MsmMarketingManagerViewModel());

  @override
  void initState() {
    getCounsellor();
    getMarketingManager();
    super.initState();
  }

  List<CounsellorResponseModel> counsellorss = [];
  Future<void> getCounsellor() async {
    await _counsellorViewModel.counsellorViewModel(
        agentId: widget.data!.genInfo!.agentId);
    List<CounsellorResponseModel> responsee =
        _counsellorViewModel.apiResponse.data;
    responsee.forEach((element) {
      counsellorss.add(element);
    });
    setState(() {});
  }

  List<MsmMarketingManagerResponseModel> marketingManager = [];
  Future<void> getMarketingManager() async {
    await _msmMarketingManagerViewModel.msmMarketingManagerViewModel();
    List<MsmMarketingManagerResponseModel> response =
        _msmMarketingManagerViewModel.apiResponse.data;
    response.forEach((element) {
      marketingManager.add(element);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Counsellor",
                      style: TextStyle(
                          color: kNavy,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                      isExpanded: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator: (title) {
                        if (title != null) {
                          return "Please Select Email";
                        }
                      },
                      borderRadius: BorderRadius.circular(5),
                      hint: const Text("Counsellor"),
                      value: _selectedEmail,
                      items: counsellorss.map((countryEducation) {
                        return DropdownMenuItem(
                            value: countryEducation.emailId.toString(),
                            child: Text(
                              '${countryEducation.displayName.toString()}/${countryEducation.emailId.toString()}',
                              style: const TextStyle(
                                  color: kGrey4,
                                  fontFamily: "Roboto",
                                  fontSize: 13),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        _selectedEmail = newValue as String?;
                      }),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  children: const [
                    Text(
                      'MSM marketing manager',
                      style: TextStyle(
                          color: kNavy,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                      isExpanded: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator: (title) {
                        if (title != null) {
                          return "Please Select Type";
                        }
                      },
                      borderRadius: BorderRadius.circular(5),
                      hint: const Text("Marketing Manager"),
                      value: _selectedType,
                      items: marketingManager.map((countryEducation) {
                        return DropdownMenuItem(
                            value: countryEducation.emailId.toString(),
                            child: Text(
                              '${countryEducation.displayName.toString()}/${countryEducation.emailId.toString()}',
                              style: const TextStyle(
                                  color: kGrey4,
                                  fontFamily: "Roboto",
                                  fontSize: 13),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        _selectedType = newValue as String?;
                      }),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
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
                    GestureDetector(
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
                    GestureDetector(
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
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.07,
                ),
                supportSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
