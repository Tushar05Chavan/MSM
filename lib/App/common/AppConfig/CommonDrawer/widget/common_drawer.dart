import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/Authentication/Login/Views/login_screen.dart';
import 'package:msm_unify/App/Screens/ChangePassword/change_password_screen.dart';
import 'package:msm_unify/App/Screens/Commission/commission_screen.dart';
import 'package:msm_unify/App/Screens/Dashboard/dashboard.dart';
import 'package:msm_unify/App/Screens/Institution/new_institute_list_screen.dart';
import 'package:msm_unify/App/Screens/Operation/application_screen.dart';
import 'package:msm_unify/App/Screens/Operation/deferral_request_screen.dart';
import 'package:msm_unify/App/Screens/Operation/refund_screen.dart';
import 'package:msm_unify/App/Screens/Operation/student_screen.dart';
import 'package:msm_unify/App/Screens/Profile/profile_screen.dart';
import 'package:msm_unify/App/Screens/Reports/commission_screen.dart';
import 'package:msm_unify/App/Screens/Reports/conversion_ratio_screen.dart';
import 'package:msm_unify/App/Screens/Reports/growth_analysis_screen.dart';
import 'package:msm_unify/App/Screens/Reports/institution_intake_wise_summary.dart';
import 'package:msm_unify/App/Screens/Reports/pending_offer_letter_screen.dart';
import 'package:msm_unify/App/Screens/Reports/refund_tracker_screen.dart';
import 'package:msm_unify/App/Screens/Reports/student_analysis.dart';
import 'package:msm_unify/App/Screens/Reports/summary_of_refund.dart';
import 'package:msm_unify/App/Screens/Settings/retrieve_application_screen.dart';
import 'package:msm_unify/App/Screens/UserScreen/user_screen.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/controller/drawe_controller.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/App/common/preference_manager.dart';

Drawer commonDrawer(BuildContext context) {
  CommonDrawerController commonDrawerController =
      Get.put(CommonDrawerController());
  return Drawer(
    child: Padding(
      padding: const EdgeInsets.all(13),
      child: SingleChildScrollView(
        child: GetBuilder<CommonDrawerController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/close_red.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Get.to(const ProfileScreen());
                  },
                  leading: SvgPicture.asset('assets/icons/agent.svg'),
                  title: const Text(
                    'Profile',
                    style: TextStyle(
                        color: kGrey, fontSize: 16, fontFamily: 'Roboto'),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(const DashboardPage());
                  },
                  leading: SvgPicture.asset('assets/icons/dashboard.svg'),
                  title: const Text(
                    'Dashboard',
                    style: TextStyle(
                        color: kGrey, fontSize: 16, fontFamily: 'Roboto'),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(NewInstituteListScreen());
                  },
                  leading:
                      SvgPicture.asset('assets/icons/Institution - Gray.svg'),
                  title: const Text(
                    'Institution',
                    style: TextStyle(
                        color: kGrey, fontSize: 16, fontFamily: 'Roboto'),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(const CommissionTabScreen());
                  },
                  leading: SvgPicture.asset('assets/icons/commission.svg'),
                  title: const Text(
                    'Commission',
                    style: TextStyle(
                        color: kGrey, fontSize: 16, fontFamily: 'Roboto'),
                  ),
                ),
                ExpansionPanelList(
                  elevation: 1.0,
                  expansionCallback: (int index, bool isExpanded) {
                    controller.getIsEx();
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: controller.isEx,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          leading:
                              SvgPicture.asset('assets/icons/operation.svg'),
                          title: const Text(
                            'Operation',
                            style: TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontFamily: 'Roboto'),
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(const StudentListScreen());
                              },
                              child: const Text(
                                'Students',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(ApplicationScreen());
                              },
                              child: const Text(
                                'Application',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const DeferralRequestScreen());
                              },
                              child: const Text(
                                'Deferral Request',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const RefundScreen());
                              },
                              child: const Text(
                                'Refund',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ExpansionPanelList(
                  elevation: 1.0,
                  dividerColor: Colors.red,
                  expansionCallback: (int index, bool isExpanded) {
                    controller.getIsEx1();
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: controller.isEx1,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          leading: SvgPicture.asset('assets/icons/reports.svg'),
                          title: const Text(
                            'Reports',
                            style: TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontFamily: 'Roboto'),
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(const GrowthAnalysisScreen());
                              },
                              child: const Text(
                                'Growth Analysis',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const StudentAnalysisScreen());
                              },
                              child: const Text(
                                'Student Analysis',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const ConversionRatioScreen());
                              },
                              child: const Text(
                                'Conversion Ratio',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const ReportCommission());
                              },
                              child: const Text(
                                'Commission',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                    const InstitutionIntakeWiseSummaryScreen());
                              },
                              child: const Text(
                                'Institution Intake Wise Summary',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  const PendingOfferScreen(),
                                );
                              },
                              child: const Text(
                                'Pending Offer Letter',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(RefundTrackerScreen());
                              },
                              child: const Text(
                                'Refund Tracker',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const SummaryScreen());
                              },
                              child: const Text(
                                'Summary Of refund',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ExpansionPanelList(
                  elevation: 1.0,
                  dividerColor: Colors.red,
                  expansionCallback: (int index, bool isExpanded) {
                    controller.getIsEx2();
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: controller.isEx2,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return const ListTile(
                          leading: Icon(Icons.settings_applications_sharp),
                          title: Text(
                            'Setting',
                            style: TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontFamily: 'Roboto'),
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(const RetrieveAppScreen());
                              },
                              child: const Text(
                                'Retrieve Application',
                                style: TextStyle(
                                    color: Color(0xff3C4858),
                                    fontFamily: 'Roboto',
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Get.to(const ChangePassScreen());
                  },
                  leading: const Icon(Icons.vpn_key),
                  title: const Text(
                    'Change Password',
                    style: TextStyle(
                        color: kGrey, fontSize: 16, fontFamily: 'Roboto'),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(const UserScreen());
                  },
                  leading: const Icon(Icons.group),
                  title: const Text(
                    'Users',
                    style: TextStyle(
                        color: kGrey, fontSize: 16, fontFamily: 'Roboto'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.18,
                                      ),
                                      Container(
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.25,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/logout.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.13,
                                      ),
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
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text(
                                    'Are you sure, you want to logout?',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 22,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.8)),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.07,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      PreferenceManager.setEmailId('');
                                      Get.to(LoginScreen());
                                    },
                                    child: Container(
                                      height: Get.height * 0.065,
                                      width: Get.width * 0.60,
                                      decoration: BoxDecoration(
                                          color: kRed,
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: const Center(
                                        child: Text('Yes, I am sure!',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      height: Get.height * 0.065,
                                      width: Get.width * 0.38,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kRed),
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: const Center(
                                        child: Text('No',
                                            style: TextStyle(
                                                color: kRed,
                                                fontSize: 16,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
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
                    height: Get.height * 0.05,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: kRed,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(color: kColorPrimary)),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              'Account Manager Details',
                                              style: TextStyle(
                                                  color: kNavy,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Container(
                                                height: Get.height * 0.03,
                                                width: Get.width * 0.08,
                                                decoration: BoxDecoration(
                                                    color: kRed,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      Row(children: const [
                                        Flexible(
                                          child: Text(
                                            'Account Manager for GMO',
                                            style: TextStyle(
                                                color: Color(0xff159600),
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Account Manager for MSM Unify',
                                            style: TextStyle(
                                                color: Color(0xff159600),
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ]),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      Row(children: [
                                        Container(
                                          height: Get.height * 0.15,
                                          width: Get.width * 0.30,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    spreadRadius: 0.7,
                                                    blurRadius: 0.7,
                                                    offset:
                                                        const Offset(0.5, 0.5))
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: SvgPicture.asset(
                                            'assets/icons/agent.svg',
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.07,
                                        ),
                                        Flexible(
                                          child: Container(
                                            height: Get.height * 0.15,
                                            width: Get.width * 0.35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                  'assets/images/avatar12.jpg',
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      Row(children: [
                                        Flexible(
                                          child: Text(
                                            'Account Manager Not Assigned',
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/ProfilrRed.svg',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'Dweeti Anadkat',
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          fontFamily: 'Roboto',
                                                          fontSize: 15),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/phone.svg',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      '7573000363',
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          fontFamily: 'Roboto',
                                                          fontSize: 16),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/email.svg',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'dweeti.anadkat@msquaremedia.com',
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          fontFamily: 'Roboto',
                                                          fontSize: 16),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                      SizedBox(
                                        height: Get.height * 0.20,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              'For any queries, e-mail us at ',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                              fontFamily: 'Roboto',
                                              fontSize: 18),
                                          children: [
                                            TextSpan(
                                                text: 'support@msmunify.com',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        height: Get.height * 0.06,
                        width: Get.width * 0.25,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: const Image(
                          image: AssetImage('assets/icons/manager_avatar.png'),
                        ),
                      ),
                    ),
                    const Text(
                      'Account Manager',
                      style: TextStyle(
                          color: Color(0xff3C4858),
                          fontFamily: 'Roboto',
                          fontSize: 17),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
