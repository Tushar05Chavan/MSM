import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/model/responseModek/application_view_response_model.dart';
import 'package:msm_unify/model/responseModek/counsellor_response_model.dart';
import 'package:msm_unify/model/responseModek/msm_marketing_manager_respone_model.dart';
import 'package:msm_unify/viewModel/counsellor_view_model.dart';
import 'package:msm_unify/viewModel/msm_marketing_manager_view_model.dart';

import '../../../common/color_constant.dart';

class ApplicationAdvisorTabScreen extends StatefulWidget {
  final ApplicationViewResponseModel data;

  const ApplicationAdvisorTabScreen({super.key, required this.data});

  @override
  State<ApplicationAdvisorTabScreen> createState() =>
      _ApplicationAdvisorTabScreenState();
}

class _ApplicationAdvisorTabScreenState
    extends State<ApplicationAdvisorTabScreen> {
  String? _selectedEmail;
  final List<String> _email = [
    'Not Assigned',
    'Jay/infoeduglobal.org@gmail.com',
  ];

  String? _selectedType;
  final List<String> _type = [
    'Not Assigned',
    'Abdul Quadir/csr01@msmunify.com',
    'Abhimanyu Singh/abhimanyu.',
    'Abhishek Khandelwal/abhishek',
    'Abhishek Verma/abhishek.'
  ];
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
        agentId: widget.data.genInfo!.agentId);
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
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: Get.width * 0.40,
                        height: Get.height * 0.04,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
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
                const SizedBox(
                  height: 15,
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
