import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/ScholarshipView/scholarship_know_more_screen.dart';
import 'package:msm_unify/model/responseModek/scholarship_banner_response_model.dart';
import 'package:msm_unify/model/responseModek/scholarship_detail_response_model.dart'
    as sc;
import 'package:msm_unify/model/responseModek/scholarship_dropdown_response_model.dart';
import 'package:msm_unify/viewModel/scholarship_banner_view_model.dart';
import 'package:msm_unify/viewModel/scholarship_detail_view_model.dart';
import 'package:msm_unify/viewModel/scholarship_drop_view_model.dart';
import 'package:msm_unify/viewModel/scholarship_more_detail_view_model.dart';

class ScholarshipViewScreen extends StatefulWidget {
  const ScholarshipViewScreen({Key? key}) : super(key: key);

  @override
  State<ScholarshipViewScreen> createState() => _ScholarshipViewScreenState();
}

class _ScholarshipViewScreenState extends State<ScholarshipViewScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final ScholarshipMoreDetailViewModel _scholarshipMoreDetailViewModel =
      Get.put(ScholarshipMoreDetailViewModel());

  TabController? _tabController;

  String? _selectedInstitution;
  String? _selectedProgram;
  String? _selectedRegion;
  String? _selectedType;
  String? _selectedMinimum;
  String? _selectedMaximum;
  String? _selectedPartnerType;

  List<String> institutions = ['Arogya', 'University', 'Advance Certificate'];

  bool colorsValue = false;
  bool programColorsValue = false;
  bool countryColorsValue = false;
  bool waiversColorsValue = false;
  bool partnerColorsValue = false;

  var instituteId;
  var program;
  var countryId;
  var amtType;
  var type;
  var minAmt;
  var maxAmt;

  final ScholarshipDropViewModel _scholarshipDropViewModel =
      Get.put(ScholarshipDropViewModel());

  final ScholarshipDetailViewModel _scholarshipDetailViewModel =
      Get.put(ScholarshipDetailViewModel());

  final ScholarshipBannerViewModel _scholarshipBannerViewModel =
      Get.put(ScholarshipBannerViewModel());

  final ScholarshipDetailViewModel scholarshipDetailViewModel = Get.find();
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: commonDrawer(context),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    //buildPreferredSize(context, _key),
                    SearchBar(keyGlobal: _key),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
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
                    ),
                    Column(children: [
                      const SizedBox(height: 20),
                      GetBuilder<ScholarshipBannerViewModel>(
                        builder: (controller) {
                          if (controller.apiResponse.status ==
                              Status.COMPLETE) {
                            List<ScholarshipBannerResponseModel> response =
                                controller.apiResponse.data;
                            return Column(
                              children: [
                                SizedBox(
                                  height: 180,
                                  child: CarouselSlider(
                                    carouselController: _carouselController,
                                    options: CarouselOptions(
                                      aspectRatio: 2.1,
                                      onPageChanged: (int value,
                                          CarouselPageChangedReason reason) {
                                        _scholarshipBannerViewModel
                                            .setSelectedPage(value);
                                      },
                                      viewportFraction: 1.0,
                                      autoPlay: true,
                                      enableInfiniteScroll: false,
                                    ),
                                    items: List.generate(
                                        response.length,
                                        (index) => Container(
                                              width: Get.width,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                color: kRed,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        '${'https://msmqastorage.blob.core.windows.net/files/files/scholarship/'}${response[index].bannerPath}')),
                                              ),
                                            )),
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
                                        _carouselController.previousPage(
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
                                        log('${controller.selectedPage}');
                                        _carouselController.nextPage(
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
                                                response.length - 1
                                            ? Colors.grey
                                            : kRedLight,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          } else {
                            if (controller.apiResponse.status == Status.ERROR) {
                              return const Center(
                                child: Text('No Banner Found'),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Scholarship Offers',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: kGrey3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                        endIndent: 20, indent: 20, color: kGrey, height: 0),
                    const SizedBox(height: 15),

                    // Expanded(
                    //     child: ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.025),
                  child: TabBar(
                      controller: _tabController,
                      indicatorPadding: EdgeInsets.symmetric(vertical: 10),
                      indicatorColor: kRed,
                      tabs: [
                        Tab(
                          child: ListTile(
                            title: const Text('Tile View',
                                style: TextStyle(
                                    color: kBlue,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold)),
                            leading: SvgPicture.asset(
                              'assets/icons/black_tile.svg',
                              height: 35,
                              width: 35,
                            ),
                          ),
                        ),
                        Tab(
                          child: ListTile(
                            title: const Text('Grid View',
                                style: TextStyle(
                                    color: kBlue,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold)),
                            leading: SvgPicture.asset(
                              'assets/icons/List View_Op1.svg',
                              height: 35,
                              width: 35,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Filter by:',
                        style: TextStyle(
                          color: Color(0xff5B5656),
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GetBuilder<ScholarshipDropViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          ScholarshipDropResponseModel resp =
                              controller.apiResponse.data;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  spacing: 5,
                                  runSpacing: 10.0,
                                  children: [
                                    Container(
                                      width: Get.width * 0.31,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: kGrey),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Institution"),
                                            value: _selectedInstitution,
                                            items: resp.institution!
                                                .map((Institution) {
                                              return DropdownMenuItem(
                                                  value: Institution
                                                      .institutionId
                                                      .toString(),
                                                  child: Text(
                                                    Institution.institutionName
                                                        .toString(),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) async {
                                              setState(() {
                                                _selectedInstitution =
                                                    newValue as String?;
                                                instituteId = int.parse(
                                                    _selectedInstitution!);

                                                print(
                                                    'institute idd== ${int.parse(_selectedInstitution!)}');
                                              });

                                              _scholarshipDetailViewModel
                                                  .scholarshipProgramInfo(
                                                      instituteId: instituteId,
                                                      program: program ?? "",
                                                      countryId: countryId ?? 0,
                                                      type: type ?? 0,
                                                      minAmt: minAmt ?? 0,
                                                      maxAmt: maxAmt ?? 0);
                                            }),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.31,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: kGrey),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Programs"),
                                            value: _selectedProgram,
                                            items:
                                                resp.programs!.map((Programs) {
                                              return DropdownMenuItem(
                                                  value: Programs.programName
                                                      .toString(),
                                                  child: Text(
                                                    Programs.programName
                                                        .toString(),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedProgram =
                                                    newValue as String?;
                                                program = _selectedProgram;
                                                print(
                                                    'Program == $_selectedProgram');
                                              });
                                              _scholarshipDetailViewModel
                                                  .scholarshipProgramInfo(
                                                      instituteId:
                                                          instituteId ?? 0,
                                                      program: program,
                                                      countryId: countryId ?? 0,
                                                      type: type ?? 0,
                                                      minAmt: minAmt ?? 0,
                                                      maxAmt: maxAmt ?? 0);
                                            }),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.31,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: kGrey),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Region"),
                                            value: _selectedRegion,
                                            items: resp.country!.map((Region) {
                                              return DropdownMenuItem(
                                                  value: Region.countryId
                                                      .toString(),
                                                  child: Text(
                                                    Region.countryName
                                                        .toString(),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) async {
                                              setState(() {
                                                _selectedRegion =
                                                    newValue as String?;
                                                countryId =
                                                    int.parse(_selectedRegion!);
                                              });
                                              _scholarshipDetailViewModel
                                                  .scholarshipProgramInfo(
                                                      instituteId:
                                                          instituteId ?? 0,
                                                      program: program ?? "",
                                                      countryId: countryId,
                                                      type: type ?? 0,
                                                      minAmt: minAmt ?? 0,
                                                      maxAmt: maxAmt ?? 0);
                                            }),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.31,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: kGrey),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Type"),
                                            value: _selectedType,
                                            items: resp.amtType!.map((Type) {
                                              return DropdownMenuItem(
                                                  value: Type.amtTypeName
                                                      .toString(),
                                                  child: Text(
                                                    Type.amtTypeName.toString(),
                                                  ));
                                            }).toList(),
                                            onChanged: (newValue) async {
                                              setState(() {
                                                _selectedType =
                                                    newValue as String?;
                                                amtType = _selectedType;
                                              });
                                              _scholarshipDetailViewModel
                                                  .scholarshipProgramInfo(
                                                      instituteId:
                                                          instituteId ?? 0,
                                                      program: program ?? "",
                                                      countryId: countryId ?? 0,
                                                      type: type ?? 0,
                                                      minAmt: minAmt ?? 0,
                                                      maxAmt: maxAmt ?? 0);
                                            }),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.31,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: kGrey),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Minimum"),
                                            value: _selectedMinimum,
                                            items:
                                                resp.minAmt!.map((MinAmount) {
                                              return DropdownMenuItem(
                                                  value: MinAmount.minAmt
                                                      .toString(),
                                                  child: Text(MinAmount.minAmt
                                                      .toString()));
                                            }).toList(),
                                            onChanged: (newValue) async {
                                              setState(() {
                                                _selectedMinimum =
                                                    newValue as String?;
                                                minAmt = double.parse(
                                                    _selectedMinimum!
                                                        .toString());
                                              });
                                              _scholarshipDetailViewModel
                                                  .scholarshipProgramInfo(
                                                      instituteId:
                                                          instituteId ?? 0,
                                                      program: program ?? "",
                                                      countryId: countryId ?? 0,
                                                      type: type ?? 0,
                                                      minAmt: minAmt,
                                                      maxAmt: maxAmt ?? 0);
                                            }),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.31,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: kGrey),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Maximum"),
                                            value: _selectedMaximum,
                                            items:
                                                resp.maxAmt!.map((MaxAmount) {
                                              return DropdownMenuItem(
                                                  value: MaxAmount.maxAmt
                                                      .toString(),
                                                  child: Text(MaxAmount.maxAmt
                                                      .toString()));
                                            }).toList(),
                                            onChanged: (newValue) async {
                                              setState(() {
                                                _selectedMaximum =
                                                    newValue as String?;
                                                maxAmt = double.parse(
                                                    _selectedMaximum!);
                                              });
                                              _scholarshipDetailViewModel
                                                  .scholarshipProgramInfo(
                                                      instituteId:
                                                          instituteId ?? 0,
                                                      program: program ?? "",
                                                      countryId: countryId ?? 0,
                                                      type: type ?? 0,
                                                      minAmt: minAmt ?? 0,
                                                      maxAmt: maxAmt);
                                            }),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.40,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: kGrey),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            hint: const Text("Partner Type"),
                                            value: _selectedPartnerType,
                                            items: resp.partnerType!
                                                .map((PartnerType) {
                                              return DropdownMenuItem(
                                                  value: PartnerType
                                                      .partnerTypeId
                                                      .toString(),
                                                  child: Text(PartnerType
                                                      .partnerTypeName
                                                      .toString()));
                                            }).toList(),
                                            onChanged: (newValue) async {
                                              setState(() {
                                                _selectedPartnerType =
                                                    newValue as String?;
                                                type = int.parse(
                                                    _selectedPartnerType!);
                                              });
                                              _scholarshipDetailViewModel
                                                  .scholarshipProgramInfo(
                                                      instituteId:
                                                          instituteId ?? 0,
                                                      program: program ?? "",
                                                      countryId: countryId ?? 0,
                                                      type: type,
                                                      minAmt: minAmt ?? 0,
                                                      maxAmt: maxAmt ?? 0);
                                            }),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _scholarshipDetailViewModel
                                            .scholarshipProgramInfo()
                                            .then((value) => {
                                                  print(
                                                      'institute id : ${instituteId}')
                                                });
                                      },
                                      child: Container(
                                        width: Get.width * 0.40,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Image.asset(
                                          'assets/icons/Clear Filter Icon.png',
                                          width: 35,
                                          height: 35,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (controller.apiResponse.status ==
                            Status.ERROR) {
                          return const CircularProgressIndicator();
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    GetBuilder<ScholarshipDetailViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          List<sc.ScholarshipdetailResponseModel> response =
                              controller.apiResponse.data;
                          print('RESPONSEEE>>>> ${response}');
                          return ListView.builder(
                            itemCount: response.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: Get.width * 0.03),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: kBorderGrey),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kGrey.withOpacity(0.3),
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${response[index].programs![0].programName}',
                                      style: const TextStyle(
                                        color: kNavy,
                                        fontSize: 17,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "${'https://msmqastorage.blob.core.windows.net/files/files/institution/'}${response[index].instLogoPath}"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${response[index].instName}',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 18,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        '${response[index].instCountry}',
                                                        // overflow:
                                                        //     TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                          color: kGrey,
                                                          fontSize: 12,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(height: 2, color: kGrey),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            response[index]
                                                        .programs![0]
                                                        .durationTime ==
                                                    ""
                                                ? SizedBox()
                                                : Row(children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Duration',
                                                          style: TextStyle(
                                                            color: kGrey3,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'Poppins',
                                                          ),
                                                        ),
                                                        Text(
                                                          "${response[index].programs![0].durationTime} Years",
                                                          style:
                                                              const TextStyle(
                                                            color: kGrey3,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                'Poppins',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 30,
                                                    )
                                                  ]),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Level of Education',
                                                    style: TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                  Text(
                                                    "${response[index].programs![0].programLevel}",
                                                    style: const TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            response[index]
                                                            .programs![0]
                                                            .intakes ==
                                                        [] ||
                                                    response[index]
                                                        .programs![0]
                                                        .intakes!
                                                        .isEmpty
                                                ? const SizedBox()
                                                : Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            'Intakes',
                                                            style: TextStyle(
                                                              color: kGrey3,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 100,
                                                            child: Text(
                                                              response[index].programs![0].intakes ==
                                                                          [] ||
                                                                      response[
                                                                              index]
                                                                          .programs![
                                                                              0]
                                                                          .intakes!
                                                                          .isEmpty
                                                                  ? ''
                                                                  : "${response[index].programs![0].intakes![0].intakeName} ${response[index].programs![0].intakes![0].statusName}",
                                                              style:
                                                                  const TextStyle(
                                                                color: kGrey3,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'Poppins',
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      response[index]
                                                                  .programs![0]
                                                                  .feeDetail!
                                                                  .isEmpty ||
                                                              response[index]
                                                                      .programs![
                                                                          0]
                                                                      .feeDetail ==
                                                                  []
                                                          ? ''
                                                          : 'Tuition Fees',
                                                      style: const TextStyle(
                                                        color: kGrey3,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 80,
                                                      width: 180,
                                                      child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount:
                                                            response[index]
                                                                .programs![0]
                                                                .feeDetail!
                                                                .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index1) {
                                                          return Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${response[index].programs![0].feeDetail![index1].feeType}: ${response[index].programs![0].programCurrency} ${response[index].programs![0].feeDetail![index1].feeAmount}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: kGrey3,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: Get.width * 0.55,
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    'Scholarship',
                                                    style: TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: Get.height * 0.03,
                                                      width: Get.width * 0.30,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: kNavy),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${response[index].programs![0].scholarShipMinAmt}${response[index].programs![0].scholarShipAmtTypeName} to ${response[index].programs![0].scholarShipMaxAmt}${response[index].programs![0].scholarShipAmtTypeName} off',
                                                          style:
                                                              const TextStyle(
                                                            color: kNavy,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            response[index]
                                                        .programs![0]
                                                        .waiverPer ==
                                                    null
                                                ? Row(
                                                    children: [
                                                      const Text(
                                                        'Processing Time',
                                                        style: TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        '${response[index].programs![0].averageProcessingDay}',
                                                        style: const TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Application Fee Waivers',
                                                        style: TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${response[index].programs![0].programCurrency} ${response[index].programs![0].applicationFee}',
                                                            style: const TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xff999999),
                                                                fontFamily:
                                                                    "Nunito"),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "${response[index].programs![0].programCurrency} ${response[index].programs![0].applicationFeeAfterWaiver}",
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xff34BF49),
                                                                fontFamily:
                                                                    "Nunito"),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            height: Get.height *
                                                                0.03,
                                                            width: Get.width *
                                                                0.30,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: kNavy),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                '${response[index].programs![0].waiverPer}${response[index].programs![0].scholarShipAmtTypeName} off',
                                                                style:
                                                                    const TextStyle(
                                                                  color: kNavy,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(height: 2, color: kGrey),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.60,
                                          child: RichText(
                                            text: TextSpan(
                                                text:
                                                    "${response[index].programs!.length - 1} more courses",
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff34BF49),
                                                    fontFamily: "Poppins"),
                                                children: const <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          '  found for this institution',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff333333),
                                                          fontSize: 13,
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print(
                                                'programId = ${response[index].programs![0].programId}');
                                            print(
                                                'institute --- id: ${response[index].institutionId}');
                                            Get.to(
                                                () => ScholarshipKnowMoreScreen(
                                                      programId: response[index]
                                                          .programs![0]
                                                          .programId,
                                                      instituteId:
                                                          response[index]
                                                              .institutionId,
                                                    ));
                                            _scholarshipDetailViewModel
                                                .scholarshipProgramInfo(
                                                    instituteId: response[index]
                                                        .institutionId);

                                            print(
                                                'institute id: ${response[index].institutionId}');
                                          },
                                          child: Container(
                                            height: Get.height * 0.045,
                                            width: Get.width * 0.28,
                                            decoration: BoxDecoration(
                                              color: kNavy,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Know More",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (controller.apiResponse.status ==
                            Status.ERROR) {
                          return const CircularProgressIndicator();
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                      child: const Text(
                          'Disclaimer: Application fee waiver values may differ as per the institution-specific requirement.',
                          style: TextStyle(
                            color: kGrey,
                            fontSize: 14,
                            fontFamily: 'Nutino',
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    supportSection()
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        'assets/icons/Filter.svg',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: GetBuilder<ScholarshipDetailViewModel>(
                        builder: (controller) {
                          if (controller.apiResponse.status ==
                              Status.COMPLETE) {
                            List<sc.ScholarshipdetailResponseModel> resp =
                                controller.apiResponse.data;
                            print('RESPONSE ==== ${resp}');
                            return PaginatedDataTable(
                              onRowsPerPageChanged: (perPage) {},
                              rowsPerPage: 5,
                              availableRowsPerPage: [5],
                              dataRowHeight: Get.height * 0.17,
                              headingRowHeight: Get.height * 0.10,
                              columnSpacing: 0,
                              horizontalMargin: 1,
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      height: Get.height * 0.10,
                                      width: Get.width * 0.29,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF5F5F5),
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  colorsValue = true;
                                                  Future.delayed(
                                                      const Duration(
                                                          seconds: 2), () {
                                                    colorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: Text(
                                                'Institution',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: colorsValue == true
                                                      ? Colors.red
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    colorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
                                                      colorsValue = false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                // onTap: () {},
                                                child: Icon(
                                                  Icons.filter_list,
                                                  color: colorsValue == true
                                                      ? Colors.red
                                                      : Colors.black,
                                                )),
                                          ),
                                        ],
                                      )),
                                ),
                                DataColumn(
                                  label: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    height: Get.height * 0.10,
                                    width: Get.width * 0.30,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF5F5F5),
                                        border: Border.all(
                                            color: Colors.white, width: 2)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                programColorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 2),
                                                    () {
                                                  programColorsValue = false;
                                                  setState(() {});
                                                });
                                              });
                                            },
                                            child: Text(
                                              'Program',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color:
                                                    programColorsValue == true
                                                        ? Colors.red
                                                        : Colors.black,
                                              ),
                                            )),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                programColorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  programColorsValue = false;
                                                  setState(() {});
                                                });
                                              });
                                            },
                                            child: Icon(
                                              Icons.filter_list,
                                              color: programColorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      height: Get.height * 0.10,
                                      width: Get.width * 0.25,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF5F5F5),
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    countryColorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 2), () {
                                                      countryColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: Text(
                                                  'Country',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: countryColorsValue ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                )),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    countryColorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
                                                      countryColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: Icon(Icons.filter_list,
                                                    color: countryColorsValue ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.black)),
                                          ),
                                        ],
                                      )),
                                ),
                                DataColumn(
                                  label: Container(
                                      height: Get.height * 0.10,
                                      width: Get.width * 0.28,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF5F5F5),
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    waiversColorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 2), () {
                                                      waiversColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: Text(
                                                  'Scholarship\nType',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: waiversColorsValue ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                )),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    waiversColorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
                                                      waiversColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.filter_list,
                                                  color:
                                                      waiversColorsValue == true
                                                          ? Colors.red
                                                          : Colors.black,
                                                )),
                                          ),
                                        ],
                                      )),
                                ),
                                DataColumn(
                                  label: Container(
                                      height: Get.height * 0.10,
                                      width: Get.width * 0.28,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF5F5F5),
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    waiversColorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 2), () {
                                                      waiversColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: Text(
                                                  'Min',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: waiversColorsValue ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                )),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    waiversColorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
                                                      waiversColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.filter_list,
                                                  color:
                                                      waiversColorsValue == true
                                                          ? Colors.red
                                                          : Colors.black,
                                                )),
                                          ),
                                        ],
                                      )),
                                ),
                                DataColumn(
                                  label: Container(
                                      height: Get.height * 0.10,
                                      width: Get.width * 0.28,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF5F5F5),
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    waiversColorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 2), () {
                                                      waiversColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: Text(
                                                  'Max',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: waiversColorsValue ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                )),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    waiversColorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
                                                      waiversColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.filter_list,
                                                  color:
                                                      waiversColorsValue == true
                                                          ? Colors.red
                                                          : Colors.black,
                                                )),
                                          ),
                                        ],
                                      )),
                                ),
                                DataColumn(
                                  label: Container(
                                      height: Get.height * 0.10,
                                      width: Get.width * 0.25,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF5F5F5),
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  partnerColorsValue = true;
                                                  Future.delayed(
                                                      const Duration(
                                                          seconds: 2), () {
                                                    partnerColorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: Text(
                                                'Partner\nType',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color:
                                                      partnerColorsValue == true
                                                          ? Colors.red
                                                          : Colors.black,
                                                ),
                                              )),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  partnerColorsValue = true;
                                                  Future.delayed(
                                                      const Duration(
                                                          seconds: 1), () {
                                                    partnerColorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: Icon(Icons.filter_list,
                                                  color:
                                                      partnerColorsValue == true
                                                          ? Colors.red
                                                          : Colors.black)),
                                        ],
                                      )),
                                ),
                              ],
                              source: TableRow(data: resp),
                            );
                          } else if (controller.apiResponse.status ==
                              Status.ERROR) {
                            return const CircularProgressIndicator();
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Container(
                        height: Get.height * 0.08,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/Filter.svg',
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Create Filter",
                              style: TextStyle(
                                color: Color(0xffe8252a),
                                fontFamily: 'Roboto',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    supportSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final List<sc.ScholarshipdetailResponseModel>? data;

  TableRow({this.data});

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
        color: MaterialStateProperty.all(
            index.isOdd ? const Color(0xffF5F5F5) : Colors.transparent),
        index: index,
        cells: [
          DataCell(
            Container(
              height: Get.height * 0.13,
              width: index.isOdd ? Get.width * 0.28 : Get.width * 0.29,
              decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(
                        width: 2,
                        color: index.isOdd
                            ? Colors.transparent
                            : const Color(0xffF5F5F5))),
              ),
              child: Center(child: Text('${data![index].instName}')),
            ),
          ),
          DataCell(
            Container(
              height: Get.height * 0.13,
              width: index.isOdd ? Get.width * 0.29 : Get.width * 0.30,
              decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(
                        width: 2,
                        color: index.isOdd
                            ? Colors.transparent
                            : const Color(0xffF5F5F5))),
              ),
              child: Center(
                  child: Text('${data![index].programs![0].programName}')),
            ),
          ),
          DataCell(
            Container(
              height: Get.height * 0.13,
              width: index.isOdd ? Get.width * 0.24 : Get.width * 0.25,
              decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(
                        width: 2,
                        color: index.isOdd
                            ? Colors.transparent
                            : const Color(0xffF5F5F5))),
              ),
              child: Center(child: Text('${data![index].instCountry}')),
            ),
          ),
          DataCell(
            Container(
              height: Get.height * 0.13,
              width: index.isOdd ? Get.width * 0.27 : Get.width * 0.28,
              decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(
                        width: 2,
                        color: index.isOdd
                            ? Colors.transparent
                            : const Color(0xffF5F5F5))),
              ),
              child: Center(
                  child: Text(
                      '${data![index].programs![0].scholarShipAmtTypeName}')),
            ),
          ),
          DataCell(
            Container(
              height: Get.height * 0.13,
              width: index.isOdd ? Get.width * 0.27 : Get.width * 0.28,
              decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(
                        width: 2,
                        color: index.isOdd
                            ? Colors.transparent
                            : const Color(0xffF5F5F5))),
              ),
              child: Center(
                  child:
                      Text('${data![index].programs![0].scholarShipMinAmt}')),
            ),
          ),
          DataCell(
            Container(
              height: Get.height * 0.13,
              width: index.isOdd ? Get.width * 0.27 : Get.width * 0.28,
              decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(
                        width: 2,
                        color: index.isOdd
                            ? Colors.transparent
                            : const Color(0xffF5F5F5))),
              ),
              child: Center(
                  child:
                      Text('${data![index].programs![0].scholarShipMinAmt}')),
            ),
          ),
          DataCell(
            Container(
              height: Get.height * 0.13,
              width: index.isOdd ? Get.width * 0.24 : Get.width * 0.25,
              decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(
                        width: 2,
                        color: index.isOdd
                            ? Colors.transparent
                            : const Color(0xffF5F5F5))),
              ),
              child: Center(
                  child: Text('${data![index].programs![0].partnerTypeName}')),
            ),
          ),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data!.length;

  @override
  int get selectedRowCount => 0;
}
