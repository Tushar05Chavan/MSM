import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/AddStudent/add_student_screen.dart';
import 'package:msm_unify/App/Screens/ApplicationProgramStudent/widget/contact_info_tab_screen.dart';
import 'package:msm_unify/App/Screens/ApplicationProgramStudent/widget/test_scores_tab_screen.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';

import 'widget/application_program_advisor_assigned_tab.dart';
import 'widget/application_program_education_info_tab.dart';
import 'widget/application_program_info_tab_screen.dart';
import 'widget/application_program_personal_info_tab.dart';

class ApplicationProgramStudentScreen extends StatefulWidget {
  final StudentViewResponseModel? data;

  const ApplicationProgramStudentScreen({super.key, this.data});

  @override
  _ApplicationProgramStudentScreenState createState() =>
      _ApplicationProgramStudentScreenState();
}

class _ApplicationProgramStudentScreenState
    extends State<ApplicationProgramStudentScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          key: _key,
          endDrawer: commonDrawer(context),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // buildPreferredSize(context, _key),
                      SearchBar(keyGlobal: _key),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
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
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Application for \n ${widget.data!.genInfo!.firstName}',
                                  style: const TextStyle(
                                      color: kNavy,
                                      fontSize: 20,
                                      fontFamily: 'Poppins'),
                                ),
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(AddStudentScreen());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      height: Get.height * 0.05,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xff565656)),
                                      child: const Center(
                                        child: Text(
                                          'Apply With Another Student',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Review of existing student data',
                                  style: TextStyle(
                                      color: Color(0xff565656), fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.red,
                    labelColor: Colors.red,
                    tabs: const [
                      Tab(
                        child: Text("Program Info"),
                      ),
                      Tab(
                        child: Text("Personal Info"),
                      ),
                      Tab(
                        child: Text("Contact Info"),
                      ),
                      Tab(
                        child: Text("Advisor Assigned"),
                      ),
                      Tab(
                        child: Text("Education Info"),
                      ),
                      Tab(
                        child: Text("Test Scorees"),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                const ProgramInfoTab(),
                PersonalInfoTab(data: widget.data),
                ContactInfoTabScreen(data: widget.data),
                AppAdvisorAssignTab(data: widget.data),
                AppEducationTab(data: widget.data),
                const TestScoresTabScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
