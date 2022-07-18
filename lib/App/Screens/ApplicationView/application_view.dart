import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/additional_details_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/application_advisor_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/credit_card_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/education_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/fee_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/institution_document_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/notes_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/program_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/status_log_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/studay_permit_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/student_document_tab.dart';
import 'package:msm_unify/App/Screens/ApplicationView/widget/test_score_tab.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/application_view_response_model.dart';
import 'package:msm_unify/viewModel/application_view_view_model.dart';

class ApplicationViewScreen extends StatefulWidget {
  final int? applicationId;

  const ApplicationViewScreen({super.key, this.applicationId});
  @override
  _ApplicationViewScreenState createState() => _ApplicationViewScreenState();
}

class _ApplicationViewScreenState extends State<ApplicationViewScreen>
    with SingleTickerProviderStateMixin {
  String? _selectedCountry;
  String? _selectedPartner;

  ///
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];

  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];

  bool _checkboxMSMUnify = false;
  bool _checkboxReviewDone = false;
  bool _checkboxSubmittedInstitute = false;

  TabController? _tabController;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final ApplicationViewViewModel _applicationViewViewModel =
      Get.put(ApplicationViewViewModel());
  @override
  void initState() {
    application();
    _tabController = new TabController(length: 11, vsync: this);
    super.initState();
  }

  ApplicationViewResponseModel? response;
  Future<void> application() async {
    await _applicationViewViewModel.applicationViewViewModel(
        applicationId: widget.applicationId);
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 11,
        child: Scaffold(
          key: _key,
          // appBar: buildPreferredSize(context, _key),
          endDrawer: commonDrawer(context),
          body: GetBuilder<ApplicationViewViewModel>(
            builder: (controller) {
              if (controller.apiResponse.status == Status.COMPLETE) {
                ApplicationViewResponseModel response =
                    controller.apiResponse.data;
                print('data res==${response}');
                return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverToBoxAdapter(
                        child: //buildPreferredSize(context, _key),
                            SearchBar(keyGlobal: _key),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25,
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
                              Text(
                                '${response.genInfo!.firstName} ${response.genInfo!.lastName}  ',
                                style: const TextStyle(
                                  color: kNavy,
                                  fontFamily: 'Poppins',
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'MSM App ID:${response.genInfo!.applicationId} |',
                                    style: const TextStyle(
                                      color: kGrey,
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '  ${response.genInfo!.mobileNo}  |',
                                    style: const TextStyle(
                                      color: kGrey,
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${response.genInfo!.email}',
                                    style: const TextStyle(
                                      color: kGrey,
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    height: Get.height * 0.038,
                                    width: Get.width * 0.40,
                                    decoration: BoxDecoration(
                                        color: Color(0xfffebb33),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        'Documenets Pending',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff192a3e),
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: CheckboxListTile(
                                      activeColor: Colors.red,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title:
                                          const Text('Submitted To MSM Unify'),
                                      value: _checkboxMSMUnify,
                                      onChanged: (value) {
                                        setState(() {
                                          _checkboxMSMUnify =
                                              !_checkboxMSMUnify;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: CheckboxListTile(
                                      activeColor: Colors.red,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text('Review Done'),
                                      value: _checkboxReviewDone,
                                      onChanged: (value) {
                                        setState(() {
                                          _checkboxReviewDone =
                                              !_checkboxReviewDone;
                                        });
                                      },
                                    ),
                                  ),
                                  CheckboxListTile(
                                    activeColor: Colors.red,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: const Text('Submitted to Institute'),
                                    value: _checkboxSubmittedInstitute,
                                    onChanged: (value) {
                                      setState(() {
                                        _checkboxSubmittedInstitute =
                                            !_checkboxSubmittedInstitute;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'You are yet to submit this\napplication to MSM Unify',
                                    style: TextStyle(
                                        color: Color(0xffFC4E37),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                        fontSize: 13),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Container(
                                                height: Get.height * 0.50,
                                                width: Get.width,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: Get.height * 0.10,
                                                      width: Get.width * 0.25,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: kRed)),
                                                      child: Center(
                                                          child:
                                                              SvgPicture.asset(
                                                        "assets/icons/close_red.svg",
                                                        height: 30,
                                                        width: 30,
                                                      )),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const Flexible(
                                                      child: Text(
                                                        'Document Missing',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff595959),
                                                            fontSize: 30,
                                                            fontFamily:
                                                                'Roboto'),
                                                      ),
                                                    ),
                                                    const Text(
                                                      'Upload all required documents before submit, Higher school transcript/Diploma certificate (Diploma after 10th), Passport, Secondary School Transcript is pending',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff545454),
                                                          fontSize: 18,
                                                          fontFamily: 'Roboto'),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.07,
                                                        width: Get.width * 0.25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xff3085D6),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'OK',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 17,
                                                                fontFamily:
                                                                    'Roboto'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: Get.height * 0.035,
                                      width: Get.width * 0.25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: kGreen1,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'SUBMIT NOW',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                            ],
                          ),
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
                              child: Text('Program'),
                            ),
                            Tab(
                              child: Text('Education'),
                            ),
                            Tab(
                              child: Text('Test Score'),
                            ),
                            // Tab(
                            //   child: Text('Credit Card'),
                            // ),
                            Tab(
                              child: Text('Additional Details'),
                            ),
                            Tab(
                              child: Text('Studay Permit'),
                            ),
                            Tab(
                              child: Text('Advisor Assigned'),
                            ),
                            Tab(
                              child: Text('Student Document'),
                            ),
                            Tab(
                              child: Text('Institution Document'),
                            ),
                            Tab(
                              child: Text('Fee'),
                            ),
                            Tab(
                              child: Text('Status Log'),
                            ),
                            Tab(
                              child: Text('Notes'),
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ProgramTab(data: response),
                      EducationTab(data: response),
                      TestScoreTab(data: response),
                      //CreditCardTab(),
                      AdditionDetails(),
                      StudayPermitTab(),
                      ApplicationAdvisorTabScreen(data: response),
                      StudentDocumentTab(data: response),
                      InstitutionDocumentTab(),
                      FeeTab(),
                      StatusLogTab(data: response),
                      NotesTab(data: response),
                    ],
                  ),
                );
              } else {
                if (controller.apiResponse.status == Status.ERROR) {
                  return const Center(
                    child: Text('Somthing went wrong'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
