import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/Screens/AddStudent/add_student_screen.dart';
import 'package:msm_unify/App/Screens/ApplicationLists/application_list_screen.dart';
import 'package:msm_unify/App/Screens/ApplicationView/application_view.dart';
import 'package:msm_unify/App/Screens/Dashboard/controller/dashboard_controller.dart';
import 'package:msm_unify/App/Screens/ProgramDetail/program_details_screen.dart';
import 'package:msm_unify/ScholarshipView/scholarship_view_screen.dart';
import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/model/responseModek/for_dashboard_response_model.dart';
import 'package:msm_unify/model/responseModek/get_tiles_response_model.dart';
import 'package:msm_unify/model/responseModek/new_program_arrivals_enhance_response_model.dart';
import 'package:msm_unify/model/responseModek/news_response_model.dart' as ns;
import 'package:msm_unify/model/responseModek/recent_applications_new_enhance_response_model.dart';
import 'package:msm_unify/model/responseModek/scholarship_response_model.dart';
import 'package:msm_unify/viewModel/country_view_model.dart';
import 'package:msm_unify/viewModel/for_dashboard_view_model.dart';
import 'package:msm_unify/viewModel/get_tiles_view_model.dart';
import 'package:msm_unify/viewModel/new_program_arrivals_enhance_view_model.dart';
import 'package:msm_unify/viewModel/news_view_model.dart';
import 'package:msm_unify/viewModel/recent_application_new_enhance_view_model.dart';
import 'package:msm_unify/viewModel/scholarship_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constant/static_data.dart';
import '../../../common/AppConfig/separator.dart';
import '../../../common/AppConfig/support_section.dart';
import '../../../common/color_constant.dart';
import '../../FeeWaierLists/fee_waier_list.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardBodyState createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  final PageController _pageController = PageController(initialPage: 0);

  final NewProgramArrivalsEnhanceViewModel _newProgramArrivalsEnhanceViewModel =
      Get.put(NewProgramArrivalsEnhanceViewModel());
  final GetTilesViewModel _getTilesViewModel = Get.put(GetTilesViewModel());
  final NewsViewModel _newsViewModel = Get.put(NewsViewModel());
  final RecentApplicationsNewEnhanceViewModel
      _recentApplicationsNewEnhanceViewModel =
      Get.put(RecentApplicationsNewEnhanceViewModel());
  final ForDashboardViewModel _forDashboardViewModel =
      Get.put(ForDashboardViewModel());

  final ScholarshipViewModel _scholarshipViewModel =
      Get.put(ScholarshipViewModel());

  String? _selectedCountry;
  String? _selectedPartner;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];

  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  final CountryViewModel _countryViewModel = Get.put(CountryViewModel());

  List<CountryResponseModel> countryS = [];
  Future<void> getCountry() async {
    await _countryViewModel.countryViewModel();
    List<CountryResponseModel> response = _countryViewModel.apiResponse.data;
    response.forEach((element) {
      countryS.add(element);
    });
    setState(() {});
  }

  var SelectedIndex = 0;
  @override
  void initState() {
    getCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(15),
          ),

          ///banners
          /*Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.1,
                viewportFraction: 1.0,
              ),
              items: List.generate(
                  banners.length,
                  (index) => Container(
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(banners[index])),
                            borderRadius: BorderRadius.circular(20)),
                      )),
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Scholarships',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kGrey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const ScholarshipViewScreen());
                  },
                  child: const Text(
                    'View More',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kRed,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<ScholarshipViewModel>(
            builder: (controller) {
              if (controller.apiResponse.status == Status.COMPLETE) {
                List<ScholarshipResponseModel> response =
                    controller.apiResponse.data;
                print('SCHOLARSHIP RESPONSE === ${response}');
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: response.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const ScholarshipViewScreen());
                      },
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.all(Get.width * 0.03),
                        margin:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 10,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          '${'https://msmqastorage.blob.core.windows.net/files/files/institution/'}${response[index].instLogoPath}'))),
                            ),
                            Text(
                              '${response[index].institutionName} | ${response[index].instCountry}',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: kGrey,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const ScholarshipViewScreen());
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width * 0.40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1.5,
                                      color: const Color(0xff203c92)),
                                ),
                                child: Center(
                                    child: Text(
                                  '${response[index].currency}${response[index].minAmount} to ${response[index].currency}${response[index].maxAmount}',
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff203c92),
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                if (controller.apiResponse.status == Status.ERROR) {
                  return const CircularProgressIndicator();
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(Get.width * 0.03),
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 10,
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Application Fee Waivers',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kGrey,
                  ),
                ),
                GetBuilder<ForDashboardViewModel>(
                  builder: (controller) {
                    if (controller.apiResponse.status == Status.COMPLETE) {
                      List<ForDashboardResponseModel> forDashboardData =
                          controller.apiResponse.data;
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: forDashboardData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          width: Get.width,
                          height: 60,
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.03),
                          decoration: BoxDecoration(
                            color: kPinkLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            '${"https://msmqastorage.blob.core.windows.net/files/files/institution/"}${forDashboardData[index].instLogoPath}'))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  '${forDashboardData[index].institutionName}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${forDashboardData[index].waiverPer}${'%'}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  
                                  color: kRed,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      if (controller.apiResponse.status == Status.ERROR) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const FeeWaierList());
                  },
                  child: const Text(
                    'View More',
                    style: TextStyle(
                      // fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kRed,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                margin: const EdgeInsets.all(10),
                width: Get.width,
                child: Row(
                  children: [
                    const Text(
                      'Filter Data',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: kRed,
                      size: 30,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              SelectedIndex = index;
                              await _getTilesViewModel.getTilesViewModel(
                                  duration: SelectedIndex == 0
                                      ? 1
                                      : SelectedIndex == 1
                                          ? 2
                                          : SelectedIndex == 2
                                              ? 3
                                              : SelectedIndex == 3
                                                  ? 4
                                                  : 1);
                              setState(() {});
                            },
                            child: Container(
                              width: Get.width * 0.13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: SelectedIndex == index
                                      ? Color(0xff6A707E)
                                      : Colors.white),
                              child: Center(
                                child: Text(
                                  '${filterData[index]['name']}',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: SelectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const VerticalDivider(color: Colors.black);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<GetTilesViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.LOADING) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<TilesResponseModel> response =
                      controller.apiResponse.data;
                  if (controller.apiResponse.status == Status.COMPLETE) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            height: Get.height * 0.19,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: data[index]['color'],
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Text(
                                  '${response[index].name}',
                                  style: const TextStyle(
                                      color: Color(0xff565656),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins'),
                                ),
                                SizedBox(
                                  height: Get.height * 0.04,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${response[index].noOfItem}',
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff192A3E)),
                                      ),
                                      SelectedIndex == 0
                                          ? Container(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${response[index].growth}',
                                                    style: const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            )
                                          : SelectedIndex == 1
                                              ? Container(
                                                  child: Column(
                                                    children: [
                                                      index == 3
                                                          ? SizedBox()
                                                          : const CircleAvatar(
                                                              radius: 15,
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      'assets/images/arrowdownred.png'),
                                                            ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '${response[index].growth}',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: index == 3
                                                                ? Colors.black
                                                                : kRed),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SelectedIndex == 2
                                                  ? Container(
                                                      child: Column(
                                                        children: [
                                                          index == 3
                                                              ? const CircleAvatar(
                                                                  radius: 15,
                                                                  backgroundImage:
                                                                      AssetImage(
                                                                          'assets/images/arrowdownred.png'),
                                                                )
                                                              : index == 4
                                                                  ? const CircleAvatar(
                                                                      radius:
                                                                          15,
                                                                      backgroundImage:
                                                                          AssetImage(
                                                                              'assets/images/arrowdownred.png'),
                                                                    )
                                                                  : const CircleAvatar(
                                                                      radius:
                                                                          15,
                                                                      backgroundImage:
                                                                          AssetImage(
                                                                              'assets/images/arrowupgreen.png'),
                                                                    ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            '${response[index].growth}',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: index ==
                                                                        0
                                                                    ? kGreen1
                                                                    : index == 1
                                                                        ? kGreen1
                                                                        : index ==
                                                                                2
                                                                            ? kGreen1
                                                                            : kRed),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : SelectedIndex == 3
                                                      ? Container(
                                                          child: Column(
                                                            children: [
                                                              const CircleAvatar(
                                                                radius: 15,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        'assets/images/arrowupgreen.png'),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                '${response[index].growth}',
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color:
                                                                        kGreen1),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      : SizedBox(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    // if (controller.apiResponse.status == Status.ERROR) {
                    //   return const Center(
                    //     child: Text('No Data Found'),
                    //   );
                    // }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.all(Get.width * 0.03),
            child: const MySeparator(),
          ),

          ///Application
          Container(
            width: Get.width,
            padding: EdgeInsets.all(Get.width * 0.03),
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0.0, 20.0))
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Application',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kDarkBlue,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(AddStudentScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kGreen),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/plus-black.svg',
                              height: 12,
                              width: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('New Application'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                GetBuilder<RecentApplicationsNewEnhanceViewModel>(
                  builder: (controller) {
                    if (controller.apiResponse.status == Status.COMPLETE) {
                      List<RecentApplicationsNewEnhanceResponseModel>
                          recentData = controller.apiResponse.data;
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        itemBuilder: (context, index1) => Container(
                          width: Get.width,
                          padding: EdgeInsets.all(Get.width * 0.03),
                          decoration: BoxDecoration(
                            color: kGrey1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${recentData[index1].firstName} ${recentData[index1].middleName} ${recentData[index1].lastName}",
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: kDarkGrey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.to(ApplicationViewScreen(
                                          applicationId:
                                              recentData[index1].applicationId,
                                        ));
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/Moredetils.svg'))
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${recentData[index1].instName}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGrey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${recentData[index1].programName}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGrey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 26,
                                width: Get.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: kOrange),
                                child: Center(
                                  child: Text(
                                    '${recentData[index1].applicationStatusName}',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(ApplicationListScreen(
                                    recentData: recentData,
                                  ));
                                },
                                child: const Text(
                                  'View More',
                                  style: TextStyle(
                                    // fontFamily: 'Roboto',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kRed,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      if (controller.apiResponse.status == Status.ERROR) {
                        return const Text("No Data Found");
                      }
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'News & Announcement',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kGrey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ListView.separated(
          //   padding: EdgeInsets.zero,
          //   separatorBuilder: (context, index) => const SizedBox(
          //     height: 10,
          //   ),
          //   itemCount: 5,
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index) => Container(
          //     margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
          //     padding: EdgeInsets.all(Get.width * 0.03),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.3),
          //           blurRadius: 10,
          //         ),
          //       ],
          //     ),
          //     child: Column(
          //       children: [
          //         Html(
          //             data:
          //                 'Top Scholarships for International Students Studying in Canada'),
          //         // Text(
          //         //   '${parse(newsData[index].newsDescription).outerHtml}',
          //         //   style: const TextStyle(
          //         //     fontFamily: 'Poppins',
          //         //     fontSize: 12,
          //         //     fontWeight: FontWeight.w600,
          //         //     color: kDarkGrey,
          //         //   ),
          //         // ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: const [
          //             Text(
          //               '06 Jun 2022 07:01 pm',
          //               style: TextStyle(
          //                 fontFamily: 'Poppins',
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.w600,
          //                 color: kRedLight,
          //               ),
          //             ),
          //             Icon(
          //               Icons.keyboard_double_arrow_right,
          //               color: kRedLight,
          //               size: 18,
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          GetBuilder<NewsViewModel>(
            builder: (controller) {
              if (controller.apiResponse.status == Status.COMPLETE) {
                print('news data');

                List<ns.NewsResponseModel> newsData =
                    controller.apiResponse.data;
                if (newsData.isEmpty) {
                  print('no dattatata');
                  return const Center(child: Text('No Mews Data Found'));
                }

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: newsData.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                    padding: EdgeInsets.all(Get.width * 0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Html(data: '${newsData[index].title}'),
                        Text(
                          newsData[index].title!.rendered.toString(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: kDarkGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${newsData[index].modified}',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: kRedLight,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                String url = 'newsData[index].link';
                                print('url==${newsData[index].link}');
                                if (!await launchUrl(
                                    Uri.parse(newsData[index].link.toString())))
                                  throw 'Could not launch $url';
                              },
                              child: const Icon(
                                Icons.keyboard_double_arrow_right,
                                color: kRedLight,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                if (controller.apiResponse.status == Status.ERROR) {
                  print('No Data Found');
                  return const Text('No Data Found');
                }
                return const Text('No data');
              }
            },
          ),

          const SizedBox(height: 30),
          GetBuilder<NewProgramArrivalsEnhanceViewModel>(
            builder: (controller) {
              if (controller.apiResponse.status == Status.COMPLETE) {
                List<NewProgramArrivalsEnhanceResponseModel> data =
                    controller.apiResponse.data;
                return Container(
                  height: 500,
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 10),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GetBuilder<DashboardController>(
                    builder: (controller) => Column(
                      children: [
                        const SizedBox(height: 15),
                        const Text(
                          'New Program Arrivals',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kGrey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 385,
                          width: Get.width * 0.9,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (int value) {
                              controller.setSelectedPage(value);
                            },
                            children: List.generate(
                              data.length,
                              (index) => Container(
                                height: 385,
                                width: Get.width * 0.9,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: kBorderGrey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    data[index].instImagePath == null ||
                                            data[index].instImagePath == ''
                                        ? Container(
                                            height: 110,
                                            width: Get.width * 0.9,
                                            decoration: const BoxDecoration(
                                                color: Colors.redAccent,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        'https://cdn.britannica.com/85/13085-050-C2E88389/Corpus-Christi-College-University-of-Cambridge-England.jpg'))),
                                          )
                                        : Container(
                                            width: Get.width * 0.9,
                                            height: 110,
                                            decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        '${'https://appmsmunifyprod.blob.core.windows.net/docs/files/institution/'}${data[index].instImagePath}'))),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '${data[index].programName}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          height: 3,
                                          fontWeight: FontWeight.w600,
                                          color: kDarkBlue,
                                        ),
                                      ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '${data[index].intakeName}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: kGrey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '${data[index].durationTime}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: kGrey,
                                        ),
                                      ),
                                    ),
                                    const Divider(),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/Institution - Gray.svg'),
                                          const SizedBox(width: 10),
                                          SizedBox(
                                            width: Get.width * 0.65,
                                            child: Text(
                                              '${data[index].institutionName}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: kGrey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/Location - Gray.svg'),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${data[index].countryName}',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: kGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (context) {
                                        //       return AlertDialog(
                                        //         content: Container(
                                        //           height: Get.height * 0.10,
                                        //           width: Get.width,
                                        //           child: const Center(
                                        //             child:
                                        //                 Text('Not implemented'),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     });
                                        Get.to(ProgramDetailScreen(
                                          programId: data[index].programId,
                                        ));
                                      },
                                      child: Container(
                                        height: 35,
                                        width: Get.width,
                                        decoration: const BoxDecoration(
                                            color: kRedLight,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            )),
                                        child: const Center(
                                          child: Text(
                                            'Explore More',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _pageController.previousPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.ease,
                                );
                              },
                              child: Image.asset(
                                'assets/icons/backward_button.png',
                                height: 25,
                                width: 25,
                                color: controller.selectedPage == 0
                                    ? Colors.grey
                                    : kRedLight,
                              ),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                log('${_pageController.page}');
                                _pageController.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.ease,
                                );
                                setState(() {});
                              },
                              child: Image.asset(
                                'assets/icons/forward_button.png',
                                height: 25,
                                width: 25,
                                color: controller.selectedPage ==
                                        newProgramArrivals.length
                                    ? Colors.grey
                                    : kRedLight,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                if (controller.apiResponse.status == Status.ERROR) {
                  return const Text("No Data Found");
                }
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),

          const SizedBox(
            height: 25,
          ),
          supportSection()
        ],
      ),
    );
  }
}
