import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/Screens/FeeWaierLists/controller/feewaier_controller.dart';
import 'package:msm_unify/App/Screens/FeeWaierLists/fee_waier_program_details_screen.dart';
import 'package:msm_unify/Responsive/responsive.dart';
import 'package:msm_unify/model/responseModek/fee_waier_list_banner_response_model.dart';
import 'package:msm_unify/model/responseModek/get_program_list_filter_response_model.dart';
import 'package:msm_unify/viewModel/fee_waier_list_banner_view_model.dart';
import 'package:msm_unify/viewModel/for_program_page-view_model.dart';
import 'package:msm_unify/viewModel/get_program_list_filter_view_model.dart';
import 'package:msm_unify/viewModel/program_list_with_other_info_view_model.dart';

import '../../../constant/static_data.dart';
import '../../../model/responseModek/program_list_with_other_info_response_model.dart';
import '../../common/AppConfig/support_section.dart';
import '../../common/color_constant.dart';

class FeeWaierList extends StatefulWidget {
  const FeeWaierList({Key? key}) : super(key: key);

  @override
  _FeeWaierListState createState() => _FeeWaierListState();
}

class _FeeWaierListState extends State<FeeWaierList>
    with SingleTickerProviderStateMixin {
  final CarouselController _carouselController = CarouselController();
  final FeeWaierController _feeWaierController = Get.find();
  final List<String> _Institution = ['Institution'];
  final List<String> _Program = ['Program'];
  final List<String> _Country = ['Country'];
  final List<String> _Waiver = ['Waiver%'];
  final List<String> _PartnerTy = ['PartnerTy..'];
  String? _selectedInstitution;
  String? _selectedProgram;
  String? _selectedWaiver;
  String? _selectedPartnerTy;
  String? _selectedCountry;
  bool _checkbox = false;
  bool _checkboxListTile = false;
  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;
  bool _checkboxListTile3 = false;
  bool colorsValue = false;
  bool programColorsValue = false;
  bool countryColorsValue = false;
  bool waiversColorsValue = false;
  bool partnerColorsValue = false;
  String index = "0";
  final List _selecteCategorysID = [];
  bool rememberMe = false;
  List<String> userList = ['Sam', 'John', 'Rohan', 'Peter'];
  void _onCategorySelected(bool selected, categoryId) {
    if (selected == true) {
      setState(() {
        _selecteCategorysID.add(categoryId);
      });
    } else {
      setState(() {
        _selecteCategorysID.remove(categoryId);
      });
    }
  }

  final ForProgramPageViewModel _forProgramPageViewModel =
      Get.put(ForProgramPageViewModel());
  TabController? _tabController;
  var tableRow = TableRow();
  @override
  void initState() {
    // getProgramListWithOtherInfo();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  // List<ProgramListWithOtherInfoResponseModel> listOfData = [];
  // Future<void> getProgramListWithOtherInfo(
  //     {int? partnerTypeId, String? programName}) async {
  //   await _programListWithOtherInfoViewModel.programListWithOtherInfoViewModel(
  //       PartnerTypeId: 0,
  //       ProgramName: '',
  //       CountryId: 0,
  //       WaiverPer: 0,
  //       InstitutionId: 0);
  //   List<ProgramListWithOtherInfoResponseModel> response =
  //       _programListWithOtherInfoViewModel.apiResponse.data;
  //   print('RESPONSE==$response');
  //   setState(() {});
  //   response.forEach((element) {
  //     listOfData.add(element);
  //   });
  // }

  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];
  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  final FeeWaierListBannerViewModel _feeWaierListBannerViewModel =
      Get.put(FeeWaierListBannerViewModel());

  final GetProgramListFilterViewModel _getProgramListFilterViewModel =
      Get.put(GetProgramListFilterViewModel());
  final ProgramListWithOtherInfoViewModel _programListWithOtherInfoViewModel =
      Get.put(ProgramListWithOtherInfoViewModel());

  var InstitutionId;
  var ProgramName;
  var CountryId;
  var WaiverPer;
  var PartnerTypeId;

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kColorPrimary,
                titleSpacing: 10.0,
                title: const Text("Application Fee Waivers"),
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<FeeWaierListBannerViewModel>(
                    builder: (controller) {
                      if (controller.apiResponse.status == Status.COMPLETE) {
                        List<FeeWaierListBannerResponseModel> bannerResponse =
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
                                    _feeWaierController.setSelectedPage(value);
                                  },
                                  viewportFraction: 1.0,
                                  autoPlay: true,
                                  enableInfiniteScroll: false,
                                ),
                                items: List.generate(
                                    bannerResponse.length,
                                    (index) => Container(
                                          width: Get.width,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    '${'https://msmqastorage.blob.core.windows.net/files/files/feewaiver/'}${bannerResponse[index].bannerPath}')),
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
                                        bannerResponse.length - 1
                                        ? Colors.grey
                                        : kRedLight,
                                  ),
                                )
                              ],
                            ),
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

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Application Fee Waiers',
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
                  Container(
                    height: 50,
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.width * 0.025),
                    child: TabBar(
                        controller: _tabController,
                        padding: EdgeInsets.zero,
                        indicatorColor: kRed,
                        tabs: [
                          Tab(
                            child: ListTile(
                              title: const Text('Tile View',
                                  style: TextStyle(
                                      color: kGrey, fontFamily: 'Nunito')),
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
                                      color: kGrey, fontFamily: 'Nunito')),
                              leading: SvgPicture.asset(
                                'assets/icons/List View_Op1.svg',
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                      child: TabBarView(
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
                            GetBuilder<GetProgramListFilterViewModel>(
                              builder: (controller) {
                                if (controller.apiResponse.status ==
                                    Status.COMPLETE) {
                                  GetProgramListFilterResponseModel response =
                                      controller.apiResponse.data;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Wrap(
                                          spacing: 10,
                                          runSpacing: 10.0,
                                          children: [
                                            Container(
                                              width: Get.width * 0.35,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border:
                                                    Border.all(color: kGrey),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    hint: const Text(
                                                        "Institution"),
                                                    value: _selectedInstitution,
                                                    items: response.institution!
                                                        .map((Institution) {
                                                      return DropdownMenuItem(
                                                          value: Institution
                                                              .institutionId
                                                              .toString(),
                                                          child: Text(Institution
                                                              .institutionName
                                                              .toString()));
                                                    }).toList(),
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() {
                                                        _selectedInstitution =
                                                            newValue as String?;
                                                        InstitutionId = int.parse(
                                                            _selectedInstitution!);
                                                        print(
                                                            'idd==${int.parse(_selectedInstitution!)}');
                                                      });

                                                      _programListWithOtherInfoViewModel
                                                          .getProgramListWithOtherInfo(
                                                        countryId:
                                                            CountryId ?? 0,
                                                        partnerTypeId:
                                                            PartnerTypeId ?? 0,
                                                        programName:
                                                            ProgramName ?? '',
                                                        waiverPer:
                                                            WaiverPer ?? 0,
                                                        institutionId:
                                                            InstitutionId,
                                                      );
                                                    }),
                                              ),
                                            ),
                                            Container(
                                              width: Get.width * 0.35,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border:
                                                    Border.all(color: kGrey),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    hint: const Text("Program"),
                                                    value: _selectedProgram,
                                                    items: response.program!
                                                        .map((program) {
                                                      return DropdownMenuItem(
                                                          value: program
                                                              .programName
                                                              .toString(),
                                                          child: Text(program
                                                              .programName
                                                              .toString()));
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedProgram =
                                                            newValue as String?;
                                                        ProgramName =
                                                            _selectedProgram;
                                                      });
                                                      _programListWithOtherInfoViewModel
                                                          .getProgramListWithOtherInfo(
                                                        institutionId:
                                                            InstitutionId ?? 0,
                                                        programName:
                                                            ProgramName,
                                                        partnerTypeId:
                                                            PartnerTypeId ?? 0,
                                                        countryId:
                                                            CountryId ?? 0,
                                                        waiverPer:
                                                            WaiverPer ?? 0,
                                                      );
                                                    }),
                                              ),
                                            ),
                                            Container(
                                              width: Get.width * 0.30,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border:
                                                    Border.all(color: kGrey),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    hint: const Text("Country"),
                                                    value: _selectedCountry,
                                                    items: response.country!
                                                        .map((Country) {
                                                      return DropdownMenuItem(
                                                          value: Country
                                                              .countryId
                                                              .toString(),
                                                          child: Text(Country
                                                              .countryName
                                                              .toString()));
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedCountry =
                                                            newValue as String?;
                                                        CountryId = int.parse(
                                                            _selectedCountry!);
                                                      });
                                                      _programListWithOtherInfoViewModel
                                                          .getProgramListWithOtherInfo(
                                                        countryId: CountryId,
                                                        waiverPer:
                                                            WaiverPer ?? 0,
                                                        partnerTypeId:
                                                            PartnerTypeId ?? 0,
                                                        institutionId:
                                                            InstitutionId ?? 0,
                                                        programName:
                                                            ProgramName ?? '',
                                                      );
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.03),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: Get.width * 0.40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border:
                                                    Border.all(color: kGrey),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    hint:
                                                        const Text("Waiver %"),
                                                    value: _selectedWaiver,
                                                    items: response.waiverPer!
                                                        .map((Waiver) {
                                                      return DropdownMenuItem(
                                                          value: Waiver
                                                              .waiverPer
                                                              .toString(),
                                                          child: Text(Waiver
                                                              .waiverPer
                                                              .toString()));
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedWaiver =
                                                            newValue as String?;
                                                        WaiverPer = int.parse(
                                                            _selectedWaiver!);
                                                      });
                                                      _programListWithOtherInfoViewModel
                                                          .getProgramListWithOtherInfo(
                                                        waiverPer: WaiverPer,
                                                        programName:
                                                            ProgramName ?? '',
                                                        institutionId:
                                                            InstitutionId ?? 0,
                                                        partnerTypeId:
                                                            PartnerTypeId ?? 0,
                                                        countryId:
                                                            CountryId ?? 0,
                                                      );
                                                    }),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: Get.width * 0.40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border:
                                                    Border.all(color: kGrey),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    hint: const Text(
                                                        "Partner Ty.."),
                                                    value: _selectedPartnerTy,
                                                    items: response.partnerType!
                                                        .map((PartnerTy) {
                                                      return DropdownMenuItem(
                                                          value: PartnerTy
                                                              .partnerTypeId
                                                              .toString(),
                                                          child: Text(PartnerTy
                                                              .partnerTypeName
                                                              .toString()));
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedPartnerTy =
                                                            newValue as String?;
                                                        PartnerTypeId = int.parse(
                                                            _selectedPartnerTy!);
                                                      });
                                                      _programListWithOtherInfoViewModel
                                                          .getProgramListWithOtherInfo(
                                                        partnerTypeId:
                                                            PartnerTypeId,
                                                        countryId:
                                                            CountryId ?? 0,
                                                        institutionId:
                                                            InstitutionId ?? 0,
                                                        programName:
                                                            ProgramName ?? '',
                                                        waiverPer:
                                                            WaiverPer ?? 0,
                                                      );
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  if (controller.apiResponse.status ==
                                      Status.ERROR) {
                                    print('ERROR');
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                            GetBuilder<ProgramListWithOtherInfoViewModel>(
                              builder: (controller) {
                                if (controller.apiResponse.status ==
                                    Status.COMPLETE) {
                                  return ListView.builder(
                                    itemCount: controller.listOfData.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: Get.width * 0.03),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border:
                                              Border.all(color: kBorderGrey),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: kGrey.withOpacity(0.3),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.listOfData[index].programs![0].programName}',
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
                                                          'https://appmsmunifyprod.blob.core.windows.net/docs/files/institution/${controller.listOfData[index].instLogoPath}'),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${controller.listOfData[index].instName}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                          color: kGrey,
                                                          fontSize: 18,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                                '${controller.listOfData[index].instCity}',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    const TextStyle(
                                                                  color: kGrey,
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                                '${controller.listOfData[index].instCountry}',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    const TextStyle(
                                                                  color: kGrey,
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
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
                                            const Divider(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const SizedBox(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Duration',
                                                      style: TextStyle(
                                                        color: kGrey3,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    Container(
                                                      width: Get.width * 0.55,
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        'Level of Education',
                                                        style: TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${controller.listOfData[index].programs![0].durationTime}',
                                                      style: const TextStyle(
                                                        color: kGrey3,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.55,
                                                      child: Text(
                                                        '${controller.listOfData[index].programs![0].programLevel}',
                                                        style: const TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Intakes',
                                                      style: TextStyle(
                                                        color: kGrey3,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    Container(
                                                      width: Get.width * 0.55,
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        'Tution Fees',
                                                        style: TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: controller
                                                            .listOfData[index]
                                                            .programs![0]
                                                            .intakes!
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index1) {
                                                          return Text(
                                                            '${controller.listOfData[index].programs![0].intakes![index1].intakeName}',
                                                            style:
                                                                const TextStyle(
                                                              color: kGrey3,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.55,
                                                      child: ListView.builder(
                                                        itemCount: controller
                                                            .listOfData[index]
                                                            .programs![0]
                                                            .feeDetail!
                                                            .length,
                                                        shrinkWrap: true,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index2) {
                                                          return Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${controller.listOfData[index].programs![0].feeDetail![index2].feeType}',
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
                                                              Text(
                                                                  '${controller.listOfData[index].programs![0].feeDetail![index2].feeAmount}'),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  'Application Fee Waivers ',
                                                  style: TextStyle(
                                                    color: kGrey3,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'CAD 150',
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff999999),
                                                          fontFamily: "Nunito"),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text("USD 0",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xff34BF49),
                                                            fontFamily:
                                                                "Nunito")),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Container(
                                                      height: Get.height * 0.03,
                                                      width: Get.width * 0.18,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: kNavy),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          '100% off',
                                                          style: TextStyle(
                                                            color: kNavy,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                    SizedBox(
                                                      width: Get.width * 0.5,
                                                      child: Text(
                                                        '${controller.listOfData[index].programs![0].averageProcessingDay}',
                                                        style: const TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Divider(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.60,
                                                  child: RichText(
                                                    text: const TextSpan(
                                                        text: "1 more courses",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xff34BF49),
                                                            fontFamily:
                                                                "Poppins"),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  '   found for this institution',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff333333),
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400))
                                                        ]),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // _forProgramPageViewModel.forProgramPage(programId:);
                                                    // Get.to(
                                                    //     FeeWaierProgramDetailsScreen(
                                                    //   programId: controller
                                                    //       .listOfData[index]
                                                    //       .programs![0]
                                                    //       .programId,
                                                    // ));
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            content: Container(
                                                              height:
                                                                  Get.height *
                                                                      0.10,
                                                              width: Get.width,
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                    'Not implemented'),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: Container(
                                                    height: Get.height * 0.045,
                                                    width: Get.width * 0.28,
                                                    decoration: BoxDecoration(
                                                      color: kNavy,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
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
                                } else {
                                  // if (controller.apiResponse.status ==
                                  //     Status.ERROR) {
                                  //   return const Center(
                                  //       child: Text('No Data Found'));
                                  // }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),

                            // GetBuilder<ProgramListWithOtherInfoViewModel>(
                            //   builder: (controller) {
                            //     if (controller.apiResponse.status ==
                            //         Status.COMPLETE) {
                            //       List<ProgramListWithOtherInfoResponseModel>
                            //           response = controller.apiResponse.data;
                            //       return
                            //     } else if (controller.apiResponse.status ==
                            //         Status.ERROR) {
                            //       print('ERROR');
                            //       return const Center(
                            //           child: Text('Somthing Went Wrong'));
                            //     } else {
                            //       return const Center(
                            //           child: CircularProgressIndicator());
                            //     }
                            //   },
                            // ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.03),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                'assets/icons/Filter.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                            GetBuilder<ProgramListWithOtherInfoViewModel>(
                              builder: (controller) {
                                if (controller.apiResponse.status ==
                                    Status.COMPLETE) {
                                  List<ProgramListWithOtherInfoResponseModel>
                                      response = controller.apiResponse.data;
                                  return Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: PaginatedDataTable(
                                      onRowsPerPageChanged: (perPage) {},
                                      rowsPerPage: 5,
                                      availableRowsPerPage: const [5],
                                      dataRowHeight: Get.height * 0.17,
                                      headingRowHeight: Get.height * 0.10,
                                      columnSpacing: 0,
                                      horizontalMargin: 1,
                                      dragStartBehavior:
                                          DragStartBehavior.start,
                                      columns: <DataColumn>[
                                        DataColumn(
                                          label: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              height: Get.height * 0.10,
                                              width: Get.width * 0.29,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 2)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          colorsValue = true;
                                                          Future.delayed(
                                                              const Duration(
                                                                  seconds: 2),
                                                              () {
                                                            colorsValue = false;
                                                            setState(() {});
                                                          });
                                                        });
                                                      },
                                                      child: Text(
                                                        'Institution',
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          color: colorsValue ==
                                                                  true
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
                                                                    seconds: 1),
                                                                () {
                                                              colorsValue =
                                                                  false;
                                                              setState(() {});
                                                            });
                                                          });

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  actions: [
                                                                    SizedBox(
                                                                      height: Get
                                                                              .height *
                                                                          0.46,
                                                                      child:
                                                                          StatefulBuilder(
                                                                        builder: (BuildContext
                                                                                context,
                                                                            void Function(void Function())
                                                                                setState) {
                                                                          return Column(
                                                                            children: [
                                                                              Container(
                                                                                  color: Colors.black.withOpacity(0.1),
                                                                                  child: TextFormField(
                                                                                    decoration: const InputDecoration(
                                                                                      hoverColor: Colors.red,
                                                                                      prefixIcon: Icon(Icons.search_outlined),
                                                                                      hintText: 'Search',
                                                                                    ),
                                                                                  )),
                                                                              Row(
                                                                                children: [
                                                                                  Checkbox(
                                                                                    activeColor: Colors.orange,
                                                                                    value: _checkbox,
                                                                                    onChanged: (value) {
                                                                                      setState(() {
                                                                                        _checkbox = !_checkbox;
                                                                                        _checkboxListTile = !_checkboxListTile;
                                                                                        _checkboxListTile1 = !_checkboxListTile1;
                                                                                        _checkboxListTile2 = !_checkboxListTile2;
                                                                                        _checkboxListTile3 = !_checkboxListTile3;
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                  const Text('Select All'),
                                                                                ],
                                                                              ),
                                                                              const Divider(),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('M.A. Human Resources Management (36 Credit)'),
                                                                                value: _checkboxListTile,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile = !_checkboxListTile;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('M.A. Legal Studies (39 Credit)'),
                                                                                value: _checkboxListTile1,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile1 = !_checkboxListTile1;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('Master of Urban Planning and Policy'),
                                                                                value: _checkboxListTile2,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile2 = !_checkboxListTile2;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('MS Information Systems'),
                                                                                value: _checkboxListTile3,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile3 = !_checkboxListTile3;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              const Divider(),
                                                                              const SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      Get.back();
                                                                                    },
                                                                                    child: const Text(
                                                                                      "OK",
                                                                                      style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 20,
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      Get.back();
                                                                                    },
                                                                                    child: const Text(
                                                                                      "CANCEL",
                                                                                      style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              });
                                                        },
                                                        // onTap: () {},
                                                        child: Icon(
                                                          Icons.filter_list,
                                                          color: colorsValue ==
                                                                  true
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
                                                    color: Colors.white,
                                                    width: 2)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        programColorsValue =
                                                            true;
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 2),
                                                            () {
                                                          programColorsValue =
                                                              false;
                                                          setState(() {});
                                                        });
                                                      });
                                                    },
                                                    child: Text(
                                                      'Program',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            programColorsValue ==
                                                                    true
                                                                ? Colors.red
                                                                : Colors.black,
                                                      ),
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        programColorsValue =
                                                            true;
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 1),
                                                            () {
                                                          programColorsValue =
                                                              false;
                                                          setState(() {});
                                                        });
                                                      });

                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              actions: [
                                                                SizedBox(
                                                                  height:
                                                                      Get.height *
                                                                          0.46,
                                                                  child:
                                                                      StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        void Function(void Function())
                                                                            setState) {
                                                                      return Column(
                                                                        children: [
                                                                          Container(
                                                                              color: Colors.black.withOpacity(0.1),
                                                                              child: TextFormField(
                                                                                decoration: const InputDecoration(
                                                                                  hoverColor: Colors.red,
                                                                                  prefixIcon: Icon(Icons.search_outlined),
                                                                                  hintText: 'Search',
                                                                                ),
                                                                              )),
                                                                          Row(
                                                                            children: [
                                                                              Checkbox(
                                                                                activeColor: Colors.orange,
                                                                                value: _checkbox,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkbox = !_checkbox;
                                                                                    _checkboxListTile = !_checkboxListTile;
                                                                                    _checkboxListTile1 = !_checkboxListTile1;
                                                                                    _checkboxListTile2 = !_checkboxListTile2;
                                                                                    _checkboxListTile3 = !_checkboxListTile3;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              const Text('Select All'),
                                                                            ],
                                                                          ),
                                                                          const Divider(),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('M.A. Human Resources Management (36 Credit)'),
                                                                            value:
                                                                                _checkboxListTile,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile = !_checkboxListTile;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('M.A. Legal Studies (39 Credit)'),
                                                                            value:
                                                                                _checkboxListTile1,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile1 = !_checkboxListTile1;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('Master of Urban Planning and Policy'),
                                                                            value:
                                                                                _checkboxListTile2,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile2 = !_checkboxListTile2;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('MS Information Systems'),
                                                                            value:
                                                                                _checkboxListTile3,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile3 = !_checkboxListTile3;
                                                                              });
                                                                            },
                                                                          ),
                                                                          const Divider(),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: const Text(
                                                                                  "OK",
                                                                                  style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 20,
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: const Text(
                                                                                  "CANCEL",
                                                                                  style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          });
                                                    },
                                                    child: Icon(
                                                      Icons.filter_list,
                                                      color:
                                                          programColorsValue ==
                                                                  true
                                                              ? Colors.red
                                                              : Colors.black,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              height: Get.height * 0.10,
                                              width: Get.width * 0.25,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 2)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            countryColorsValue =
                                                                true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              countryColorsValue =
                                                                  false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: Text(
                                                          'Country',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color:
                                                                countryColorsValue ==
                                                                        true
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .black,
                                                          ),
                                                        )),
                                                  ),
                                                  Flexible(
                                                    child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            countryColorsValue =
                                                                true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 1),
                                                                () {
                                                              countryColorsValue =
                                                                  false;
                                                              setState(() {});
                                                            });
                                                          });

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  actions: [
                                                                    SizedBox(
                                                                      height: Get
                                                                              .height *
                                                                          0.46,
                                                                      child:
                                                                          StatefulBuilder(
                                                                        builder: (BuildContext
                                                                                context,
                                                                            void Function(void Function())
                                                                                setState) {
                                                                          return Column(
                                                                            children: [
                                                                              Container(
                                                                                  color: Colors.black.withOpacity(0.1),
                                                                                  child: TextFormField(
                                                                                    decoration: const InputDecoration(
                                                                                      hoverColor: Colors.red,
                                                                                      prefixIcon: Icon(Icons.search_outlined),
                                                                                      hintText: 'Search',
                                                                                    ),
                                                                                  )),
                                                                              Row(
                                                                                children: [
                                                                                  Checkbox(
                                                                                    activeColor: Colors.orange,
                                                                                    value: _checkbox,
                                                                                    onChanged: (value) {
                                                                                      setState(() {
                                                                                        _checkbox = !_checkbox;
                                                                                        _checkboxListTile = !_checkboxListTile;
                                                                                        _checkboxListTile1 = !_checkboxListTile1;
                                                                                        _checkboxListTile2 = !_checkboxListTile2;
                                                                                        _checkboxListTile3 = !_checkboxListTile3;
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                  const Text('Select All'),
                                                                                ],
                                                                              ),
                                                                              const Divider(),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('M.A. Human Resources Management (36 Credit)'),
                                                                                value: _checkboxListTile,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile = !_checkboxListTile;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('M.A. Legal Studies (39 Credit)'),
                                                                                value: _checkboxListTile1,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile1 = !_checkboxListTile1;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('Master of Urban Planning and Policy'),
                                                                                value: _checkboxListTile2,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile2 = !_checkboxListTile2;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('MS Information Systems'),
                                                                                value: _checkboxListTile3,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile3 = !_checkboxListTile3;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              const Divider(),
                                                                              const SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      Get.back();
                                                                                    },
                                                                                    child: const Text(
                                                                                      "OK",
                                                                                      style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 20,
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      Get.back();
                                                                                    },
                                                                                    child: const Text(
                                                                                      "CANCEL",
                                                                                      style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              });
                                                        },
                                                        child: Icon(
                                                            Icons.filter_list,
                                                            color:
                                                                countryColorsValue ==
                                                                        true
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .black)),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        DataColumn(
                                          label: Container(
                                              height: Get.height * 0.10,
                                              width: Get.width * 0.28,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 2)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            waiversColorsValue =
                                                                true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              waiversColorsValue =
                                                                  false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: Text(
                                                          'Application\nFee\nWaivers %',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color:
                                                                waiversColorsValue ==
                                                                        true
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .black,
                                                          ),
                                                        )),
                                                  ),
                                                  Flexible(
                                                    child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            waiversColorsValue =
                                                                true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 1),
                                                                () {
                                                              waiversColorsValue =
                                                                  false;
                                                              setState(() {});
                                                            });
                                                          });

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  actions: [
                                                                    SizedBox(
                                                                      height: Get
                                                                              .height *
                                                                          0.46,
                                                                      child:
                                                                          StatefulBuilder(
                                                                        builder: (BuildContext
                                                                                context,
                                                                            void Function(void Function())
                                                                                setState) {
                                                                          return Column(
                                                                            children: [
                                                                              Container(
                                                                                  color: Colors.black.withOpacity(0.1),
                                                                                  child: TextFormField(
                                                                                    decoration: const InputDecoration(
                                                                                      hoverColor: Colors.red,
                                                                                      prefixIcon: Icon(Icons.search_outlined),
                                                                                      hintText: 'Search',
                                                                                    ),
                                                                                  )),
                                                                              Row(
                                                                                children: [
                                                                                  Checkbox(
                                                                                    activeColor: Colors.orange,
                                                                                    value: _checkbox,
                                                                                    onChanged: (value) {
                                                                                      setState(() {
                                                                                        _checkbox = !_checkbox;
                                                                                        _checkboxListTile = !_checkboxListTile;
                                                                                        _checkboxListTile1 = !_checkboxListTile1;
                                                                                        _checkboxListTile2 = !_checkboxListTile2;
                                                                                        _checkboxListTile3 = !_checkboxListTile3;
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                  const Text('Select All'),
                                                                                ],
                                                                              ),
                                                                              const Divider(),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('M.A. Human Resources Management (36 Credit)'),
                                                                                value: _checkboxListTile,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile = !_checkboxListTile;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('M.A. Legal Studies (39 Credit)'),
                                                                                value: _checkboxListTile1,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile1 = !_checkboxListTile1;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('Master of Urban Planning and Policy'),
                                                                                value: _checkboxListTile2,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile2 = !_checkboxListTile2;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              CheckboxListTile(
                                                                                activeColor: Colors.orange,
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                title: const Text('MS Information Systems'),
                                                                                value: _checkboxListTile3,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkboxListTile3 = !_checkboxListTile3;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              const Divider(),
                                                                              const SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      Get.back();
                                                                                    },
                                                                                    child: const Text(
                                                                                      "OK",
                                                                                      style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 20,
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      Get.back();
                                                                                    },
                                                                                    child: const Text(
                                                                                      "CANCEL",
                                                                                      style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              });
                                                        },
                                                        child: Icon(
                                                          Icons.filter_list,
                                                          color:
                                                              waiversColorsValue ==
                                                                      true
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black,
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
                                                  color:
                                                      const Color(0xffF5F5F5),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 2)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          partnerColorsValue =
                                                              true;
                                                          Future.delayed(
                                                              const Duration(
                                                                  seconds: 2),
                                                              () {
                                                            partnerColorsValue =
                                                                false;
                                                            setState(() {});
                                                          });
                                                        });
                                                      },
                                                      child: Text(
                                                        'Partner\nType',
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              partnerColorsValue ==
                                                                      true
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black,
                                                        ),
                                                      )),
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          partnerColorsValue =
                                                              true;
                                                          Future.delayed(
                                                              const Duration(
                                                                  seconds: 1),
                                                              () {
                                                            partnerColorsValue =
                                                                false;
                                                            setState(() {});
                                                          });
                                                        });

                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                actions: [
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.46,
                                                                    child:
                                                                        StatefulBuilder(
                                                                      builder: (BuildContext
                                                                              context,
                                                                          void Function(void Function())
                                                                              setState) {
                                                                        return Column(
                                                                          children: [
                                                                            Container(
                                                                                color: Colors.black.withOpacity(0.1),
                                                                                child: TextFormField(
                                                                                  decoration: const InputDecoration(
                                                                                    hoverColor: Colors.red,
                                                                                    prefixIcon: Icon(Icons.search_outlined),
                                                                                    hintText: 'Search',
                                                                                  ),
                                                                                )),
                                                                            Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                  activeColor: Colors.orange,
                                                                                  value: _checkbox,
                                                                                  onChanged: (value) {
                                                                                    setState(() {
                                                                                      _checkbox = !_checkbox;
                                                                                      _checkboxListTile = !_checkboxListTile;
                                                                                      _checkboxListTile1 = !_checkboxListTile1;
                                                                                      _checkboxListTile2 = !_checkboxListTile2;
                                                                                      _checkboxListTile3 = !_checkboxListTile3;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                const Text('Select All'),
                                                                              ],
                                                                            ),
                                                                            const Divider(),
                                                                            CheckboxListTile(
                                                                              activeColor: Colors.orange,
                                                                              controlAffinity: ListTileControlAffinity.leading,
                                                                              title: const Text('M.A. Human Resources Management (36 Credit)'),
                                                                              value: _checkboxListTile,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  _checkboxListTile = !_checkboxListTile;
                                                                                });
                                                                              },
                                                                            ),
                                                                            CheckboxListTile(
                                                                              activeColor: Colors.orange,
                                                                              controlAffinity: ListTileControlAffinity.leading,
                                                                              title: const Text('M.A. Legal Studies (39 Credit)'),
                                                                              value: _checkboxListTile1,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  _checkboxListTile1 = !_checkboxListTile1;
                                                                                });
                                                                              },
                                                                            ),
                                                                            CheckboxListTile(
                                                                              activeColor: Colors.orange,
                                                                              controlAffinity: ListTileControlAffinity.leading,
                                                                              title: const Text('Master of Urban Planning and Policy'),
                                                                              value: _checkboxListTile2,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  _checkboxListTile2 = !_checkboxListTile2;
                                                                                });
                                                                              },
                                                                            ),
                                                                            CheckboxListTile(
                                                                              activeColor: Colors.orange,
                                                                              controlAffinity: ListTileControlAffinity.leading,
                                                                              title: const Text('MS Information Systems'),
                                                                              value: _checkboxListTile3,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  _checkboxListTile3 = !_checkboxListTile3;
                                                                                });
                                                                              },
                                                                            ),
                                                                            const Divider(),
                                                                            const SizedBox(
                                                                              height: 5,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    Get.back();
                                                                                  },
                                                                                  child: const Text(
                                                                                    "OK",
                                                                                    style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 20,
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    Get.back();
                                                                                  },
                                                                                  child: const Text(
                                                                                    "CANCEL",
                                                                                    style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: Icon(
                                                          Icons.filter_list,
                                                          color:
                                                              partnerColorsValue ==
                                                                      true
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black)),
                                                ],
                                              )),
                                        ),
                                      ],
                                      source: TableRow(data: response),
                                    ),
                                  );
                                } else {
                                  if (controller.apiResponse.status ==
                                      Status.ERROR) {
                                    return const Center(
                                      child: Text('Somthing went Wrong'),
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Container(
                                height: Get.height * 0.08,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.2)),
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
                  )),

                  // const SizedBox(
                  //   height: 25,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                  //   child: const Text(
                  //       'Disclaimer: Application fee waiver values may differ as per the institution-specific requirement.',
                  //       style: TextStyle(
                  //         color: kGrey,
                  //         fontSize: 14,
                  //         fontFamily: 'Nutino',
                  //       )),
                  // ),
                  // const SizedBox(
                  //   height: 25,
                  // ),
                  // supportSection()
                ],
              ),
            ),
          )
        : DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kColorPrimary,
                titleSpacing: 10.0,
                title: const Text("Application Fee Waiers"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
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
                            Flexible(
                              child: Container(
                                height: Get.height * 0.060,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                          _selectedCountry =
                                              newValue as String?;
                                        });
                                      }),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.060,
                              width: Get.width * 0.30,
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
                            Flexible(
                              child: SizedBox(
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
                            ),
                            Flexible(
                              child: Container(
                                height: Get.height * 0.060,
                                width: Get.width * 0.30,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                          _selectedPartner =
                                              newValue as String?;
                                        });
                                      }),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                height: Get.height * 0.060,
                                width: Get.width * 0.20,
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    // GetBuilder<FeeWaierListBannerViewModel>(
                    //   builder: (controller) {
                    //     if (controller.apiResponse.status == Status.COMPLETE) {
                    //       List<FeeWaierListBannerResponseModel> bannerResponse =
                    //           controller.apiResponse.data;
                    //       return SizedBox(
                    //         height: 180,
                    //         child: CarouselSlider(
                    //           carouselController: _carouselController,
                    //           options: CarouselOptions(
                    //             aspectRatio: 2.1,
                    //             onPageChanged: (int value,
                    //                 CarouselPageChangedReason reason) {
                    //               _feeWaierController.setSelectedPage(value);
                    //             },
                    //             viewportFraction: 1.0,
                    //             autoPlay: true,
                    //             enableInfiniteScroll: false,
                    //           ),
                    //           items: List.generate(
                    //               bannerResponse.length,
                    //               (index) => Container(
                    //                     width: Get.width,
                    //                     margin: const EdgeInsets.symmetric(
                    //                         horizontal: 5.0),
                    //                     decoration: BoxDecoration(
                    //                       color: Colors.amber,
                    //                       image: DecorationImage(
                    //                           fit: BoxFit.cover,
                    //                           image: NetworkImage(
                    //                               '${'https://appmsmunifyprod.blob.core.windows.net/docs/files/feewaiver/'}${bannerResponse[index].bannerPath}')),
                    //                     ),
                    //                   )),
                    //         ),
                    //       );
                    //     } else {
                    //       if (controller.apiResponse.status == Status.ERROR) {
                    //         return const Center(
                    //           child: Text('No Banner Found'),
                    //         );
                    //       }
                    //       return const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    //   },
                    // ),

                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<FeeWaierController>(
                      builder: (controller) => Row(
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
                                      newProgramArrivals.length
                                  ? Colors.grey
                                  : kRedLight,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Application Fee Waiers',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: kGrey3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // const Divider(
                    //     endIndent: 20, indent: 20, color: kGrey, height: 0),
                    const SizedBox(height: 15),
                    Container(
                      height: 50,
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.025),
                      child: TabBar(
                          controller: _tabController,
                          padding: EdgeInsets.zero,
                          indicatorColor: kRed,
                          tabs: [
                            Tab(
                              child: ListTile(
                                title: const Text('Tile View',
                                    style: TextStyle(
                                        color: kGrey, fontFamily: 'Nunito')),
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
                                        color: kGrey, fontFamily: 'Nunito')),
                                leading: SvgPicture.asset(
                                  'assets/icons/List View_Op1.svg',
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                        child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 25),
                              Row(
                                children: [
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      spacing: 10,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(color: kGrey),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                hint: const Text("Institution"),
                                                value: _selectedInstitution,
                                                items: _Institution.map(
                                                    (Institution) {
                                                  return DropdownMenuItem(
                                                      value: Institution,
                                                      child: Text(Institution));
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selectedInstitution =
                                                        newValue as String?;
                                                  });
                                                }),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(color: kGrey),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                hint: const Text("Program"),
                                                value: _selectedProgram,
                                                items: _Program.map((program) {
                                                  return DropdownMenuItem(
                                                      child: Text(program),
                                                      value: program);
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selectedProgram =
                                                        newValue as String?;
                                                  });
                                                }),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(color: kGrey),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                hint: const Text("Country"),
                                                value: _selectedCountry,
                                                items: _Country.map((Country) {
                                                  return DropdownMenuItem(
                                                      child: Text(Country),
                                                      value: Country);
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selectedCountry =
                                                        newValue as String?;
                                                  });
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: kGrey),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          hint: const Text("Waiver %"),
                                          value: _selectedWaiver,
                                          items: _Waiver.map((Waiver) {
                                            return DropdownMenuItem(
                                                child: Text(Waiver),
                                                value: Waiver);
                                          }).toList(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedWaiver =
                                                  newValue as String?;
                                            });
                                          }),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: kGrey),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          hint: const Text("Partner Ty.."),
                                          value: _selectedPartnerTy,
                                          items: _PartnerTy.map((PartnerTy) {
                                            return DropdownMenuItem(
                                                child: Text(PartnerTy),
                                                value: PartnerTy);
                                          }).toList(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedPartnerTy =
                                                  newValue as String?;
                                            });
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                              ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: Get.width * 0.03),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Bachelor of Arts in Arts & Markets-Music Arts',
                                          style: TextStyle(
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
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/EU_Business_School_Munich_1.png'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.6,
                                                  child: const Text(
                                                    'Hawaii Pacific University',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: kGrey,
                                                      fontSize: 18,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.6,
                                                  child: const Text(
                                                      'Honolulu, United States (USA)',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: kGrey,
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const SizedBox(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Duration',
                                                  style: TextStyle(
                                                    color: kGrey3,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                Container(
                                                  width: Get.width * 0.5,
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    'Level of Education',
                                                    style: TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  '4 Years',
                                                  style: TextStyle(
                                                    color: kGrey3,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.5,
                                                  child: const Text(
                                                    'Bachelors Degree (4-Year)',
                                                    style: TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Intakes',
                                                  style: TextStyle(
                                                    color: kGrey3,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                Container(
                                                  width: Get.width * 0.5,
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    'Tution Fees',
                                                    style: TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Sep-2022 : Open',
                                                  style: TextStyle(
                                                    color: kGrey3,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.5,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        'Application Fee : USD 25.00',
                                                        style: TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      Text(
                                                        'Enrollment Deposit : USD 2,500.00',
                                                        style: TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      Text(
                                                        'SEVIS Fees : USD 350.00',
                                                        style: TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      Text(
                                                        'Tuition Fee : USD 31,900.00',
                                                        style: TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      Text(
                                                        'VISA Fees : USD 160.00       ',
                                                        style: TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Application Fee Waivers ',
                                              style: TextStyle(
                                                color: kGrey3,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'CAD 150',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff999999),
                                                      fontFamily: "Nunito"),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text("USD 0",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff34BF49),
                                                        fontFamily: "Nunito")),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Container(
                                                  height: Get.height * 0.03,
                                                  width: Get.width * 0.18,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: kNavy),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      '100% off',
                                                      style: TextStyle(
                                                        color: kNavy,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Processing Time',
                                                  style: TextStyle(
                                                    color: kGrey3,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.5,
                                                  child: const Text(
                                                    '1 Month',
                                                    style: TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              child: RichText(
                                                text: const TextSpan(
                                                    text: "1 more courses",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff34BF49),
                                                        fontFamily: "Poppins"),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '   found for this institution',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff333333),
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))
                                                    ]),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                    FeeWaierProgramDetailsScreen());
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
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.03),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(
                                  'assets/icons/Filter.svg',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: PaginatedDataTable(
                                  onRowsPerPageChanged: (perPage) {},
                                  rowsPerPage: 5,
                                  availableRowsPerPage: const [5],
                                  dataRowHeight: Get.height * 0.17,
                                  headingRowHeight: Get.height * 0.10,
                                  columnSpacing: 0,
                                  horizontalMargin: 1,
                                  dragStartBehavior: DragStartBehavior.start,
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
                                                  color: Colors.white,
                                                  width: 2)),
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
                                                                seconds: 1),
                                                            () {
                                                          colorsValue = false;
                                                          setState(() {});
                                                        });
                                                      });

                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              actions: [
                                                                SizedBox(
                                                                  height:
                                                                      Get.height *
                                                                          0.46,
                                                                  child:
                                                                      StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        void Function(void Function())
                                                                            setState) {
                                                                      return Column(
                                                                        children: [
                                                                          Container(
                                                                              color: Colors.black.withOpacity(0.1),
                                                                              child: TextFormField(
                                                                                decoration: const InputDecoration(
                                                                                  hoverColor: Colors.red,
                                                                                  prefixIcon: Icon(Icons.search_outlined),
                                                                                  hintText: 'Search',
                                                                                ),
                                                                              )),
                                                                          Row(
                                                                            children: [
                                                                              Checkbox(
                                                                                activeColor: Colors.orange,
                                                                                value: _checkbox,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkbox = !_checkbox;
                                                                                    _checkboxListTile = !_checkboxListTile;
                                                                                    _checkboxListTile1 = !_checkboxListTile1;
                                                                                    _checkboxListTile2 = !_checkboxListTile2;
                                                                                    _checkboxListTile3 = !_checkboxListTile3;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              const Text('Select All'),
                                                                            ],
                                                                          ),
                                                                          const Divider(),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('M.A. Human Resources Management (36 Credit)'),
                                                                            value:
                                                                                _checkboxListTile,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile = !_checkboxListTile;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('M.A. Legal Studies (39 Credit)'),
                                                                            value:
                                                                                _checkboxListTile1,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile1 = !_checkboxListTile1;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('Master of Urban Planning and Policy'),
                                                                            value:
                                                                                _checkboxListTile2,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile2 = !_checkboxListTile2;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('MS Information Systems'),
                                                                            value:
                                                                                _checkboxListTile3,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile3 = !_checkboxListTile3;
                                                                              });
                                                                            },
                                                                          ),
                                                                          const Divider(),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: const Text(
                                                                                  "OK",
                                                                                  style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 20,
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: const Text(
                                                                                  "CANCEL",
                                                                                  style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            );
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
                                                        const Duration(
                                                            seconds: 2), () {
                                                      programColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: Text(
                                                  'Program',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: programColorsValue ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                )),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    programColorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
                                                      programColorsValue =
                                                          false;
                                                      setState(() {});
                                                    });
                                                  });

                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          actions: [
                                                            SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.46,
                                                              child:
                                                                  StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    void Function(
                                                                            void
                                                                                Function())
                                                                        setState) {
                                                                  return Column(
                                                                    children: [
                                                                      Container(
                                                                          color: Colors.black.withOpacity(
                                                                              0.1),
                                                                          child:
                                                                              TextFormField(
                                                                            decoration:
                                                                                const InputDecoration(
                                                                              hoverColor: Colors.red,
                                                                              prefixIcon: Icon(Icons.search_outlined),
                                                                              hintText: 'Search',
                                                                            ),
                                                                          )),
                                                                      Row(
                                                                        children: [
                                                                          Checkbox(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            value:
                                                                                _checkbox,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkbox = !_checkbox;
                                                                                _checkboxListTile = !_checkboxListTile;
                                                                                _checkboxListTile1 = !_checkboxListTile1;
                                                                                _checkboxListTile2 = !_checkboxListTile2;
                                                                                _checkboxListTile3 = !_checkboxListTile3;
                                                                              });
                                                                            },
                                                                          ),
                                                                          const Text(
                                                                              'Select All'),
                                                                        ],
                                                                      ),
                                                                      const Divider(),
                                                                      CheckboxListTile(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity.leading,
                                                                        title: const Text(
                                                                            'M.A. Human Resources Management (36 Credit)'),
                                                                        value:
                                                                            _checkboxListTile,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                          });
                                                                        },
                                                                      ),
                                                                      CheckboxListTile(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity.leading,
                                                                        title: const Text(
                                                                            'M.A. Legal Studies (39 Credit)'),
                                                                        value:
                                                                            _checkboxListTile1,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                          });
                                                                        },
                                                                      ),
                                                                      CheckboxListTile(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity.leading,
                                                                        title: const Text(
                                                                            'Master of Urban Planning and Policy'),
                                                                        value:
                                                                            _checkboxListTile2,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                          });
                                                                        },
                                                                      ),
                                                                      CheckboxListTile(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity.leading,
                                                                        title: const Text(
                                                                            'MS Information Systems'),
                                                                        value:
                                                                            _checkboxListTile3,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Divider(),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                const Text(
                                                                              "OK",
                                                                              style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                const Text(
                                                                              "CANCEL",
                                                                              style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                                child: Icon(
                                                  Icons.filter_list,
                                                  color:
                                                      programColorsValue == true
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
                                                  color: Colors.white,
                                                  width: 2)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        countryColorsValue =
                                                            true;
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 2),
                                                            () {
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
                                                        color:
                                                            countryColorsValue ==
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
                                                        countryColorsValue =
                                                            true;
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 1),
                                                            () {
                                                          countryColorsValue =
                                                              false;
                                                          setState(() {});
                                                        });
                                                      });

                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              actions: [
                                                                SizedBox(
                                                                  height:
                                                                      Get.height *
                                                                          0.46,
                                                                  child:
                                                                      StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        void Function(void Function())
                                                                            setState) {
                                                                      return Column(
                                                                        children: [
                                                                          Container(
                                                                              color: Colors.black.withOpacity(0.1),
                                                                              child: TextFormField(
                                                                                decoration: const InputDecoration(
                                                                                  hoverColor: Colors.red,
                                                                                  prefixIcon: Icon(Icons.search_outlined),
                                                                                  hintText: 'Search',
                                                                                ),
                                                                              )),
                                                                          Row(
                                                                            children: [
                                                                              Checkbox(
                                                                                activeColor: Colors.orange,
                                                                                value: _checkbox,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkbox = !_checkbox;
                                                                                    _checkboxListTile = !_checkboxListTile;
                                                                                    _checkboxListTile1 = !_checkboxListTile1;
                                                                                    _checkboxListTile2 = !_checkboxListTile2;
                                                                                    _checkboxListTile3 = !_checkboxListTile3;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              const Text('Select All'),
                                                                            ],
                                                                          ),
                                                                          const Divider(),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('M.A. Human Resources Management (36 Credit)'),
                                                                            value:
                                                                                _checkboxListTile,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile = !_checkboxListTile;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('M.A. Legal Studies (39 Credit)'),
                                                                            value:
                                                                                _checkboxListTile1,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile1 = !_checkboxListTile1;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('Master of Urban Planning and Policy'),
                                                                            value:
                                                                                _checkboxListTile2,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile2 = !_checkboxListTile2;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('MS Information Systems'),
                                                                            value:
                                                                                _checkboxListTile3,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile3 = !_checkboxListTile3;
                                                                              });
                                                                            },
                                                                          ),
                                                                          const Divider(),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: const Text(
                                                                                  "OK",
                                                                                  style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 20,
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: const Text(
                                                                                  "CANCEL",
                                                                                  style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          });
                                                    },
                                                    child: Icon(
                                                        Icons.filter_list,
                                                        color:
                                                            countryColorsValue ==
                                                                    true
                                                                ? Colors.red
                                                                : Colors
                                                                    .black)),
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
                                                  color: Colors.white,
                                                  width: 2)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        waiversColorsValue =
                                                            true;
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 2),
                                                            () {
                                                          waiversColorsValue =
                                                              false;
                                                          setState(() {});
                                                        });
                                                      });
                                                    },
                                                    child: Text(
                                                      'Application\nFee\nWaivers %',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            waiversColorsValue ==
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
                                                        waiversColorsValue =
                                                            true;
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 1),
                                                            () {
                                                          waiversColorsValue =
                                                              false;
                                                          setState(() {});
                                                        });
                                                      });

                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              actions: [
                                                                SizedBox(
                                                                  height:
                                                                      Get.height *
                                                                          0.46,
                                                                  child:
                                                                      StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        void Function(void Function())
                                                                            setState) {
                                                                      return Column(
                                                                        children: [
                                                                          Container(
                                                                              color: Colors.black.withOpacity(0.1),
                                                                              child: TextFormField(
                                                                                decoration: const InputDecoration(
                                                                                  hoverColor: Colors.red,
                                                                                  prefixIcon: Icon(Icons.search_outlined),
                                                                                  hintText: 'Search',
                                                                                ),
                                                                              )),
                                                                          Row(
                                                                            children: [
                                                                              Checkbox(
                                                                                activeColor: Colors.orange,
                                                                                value: _checkbox,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    _checkbox = !_checkbox;
                                                                                    _checkboxListTile = !_checkboxListTile;
                                                                                    _checkboxListTile1 = !_checkboxListTile1;
                                                                                    _checkboxListTile2 = !_checkboxListTile2;
                                                                                    _checkboxListTile3 = !_checkboxListTile3;
                                                                                  });
                                                                                },
                                                                              ),
                                                                              const Text('Select All'),
                                                                            ],
                                                                          ),
                                                                          const Divider(),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('M.A. Human Resources Management (36 Credit)'),
                                                                            value:
                                                                                _checkboxListTile,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile = !_checkboxListTile;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('M.A. Legal Studies (39 Credit)'),
                                                                            value:
                                                                                _checkboxListTile1,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile1 = !_checkboxListTile1;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('Master of Urban Planning and Policy'),
                                                                            value:
                                                                                _checkboxListTile2,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile2 = !_checkboxListTile2;
                                                                              });
                                                                            },
                                                                          ),
                                                                          CheckboxListTile(
                                                                            activeColor:
                                                                                Colors.orange,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            title:
                                                                                const Text('MS Information Systems'),
                                                                            value:
                                                                                _checkboxListTile3,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _checkboxListTile3 = !_checkboxListTile3;
                                                                              });
                                                                            },
                                                                          ),
                                                                          const Divider(),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: const Text(
                                                                                  "OK",
                                                                                  style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 20,
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: const Text(
                                                                                  "CANCEL",
                                                                                  style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          });
                                                    },
                                                    child: Icon(
                                                      Icons.filter_list,
                                                      color:
                                                          waiversColorsValue ==
                                                                  true
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
                                                  color: Colors.white,
                                                  width: 2)),
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
                                                        partnerColorsValue =
                                                            false;
                                                        setState(() {});
                                                      });
                                                    });
                                                  },
                                                  child: Text(
                                                    'Partner\nType',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          partnerColorsValue ==
                                                                  true
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
                                                        partnerColorsValue =
                                                            false;
                                                        setState(() {});
                                                      });
                                                    });

                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            actions: [
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.46,
                                                                child:
                                                                    StatefulBuilder(
                                                                  builder: (BuildContext
                                                                          context,
                                                                      void Function(
                                                                              void Function())
                                                                          setState) {
                                                                    return Column(
                                                                      children: [
                                                                        Container(
                                                                            color:
                                                                                Colors.black.withOpacity(0.1),
                                                                            child: TextFormField(
                                                                              decoration: const InputDecoration(
                                                                                hoverColor: Colors.red,
                                                                                prefixIcon: Icon(Icons.search_outlined),
                                                                                hintText: 'Search',
                                                                              ),
                                                                            )),
                                                                        Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              activeColor: Colors.orange,
                                                                              value: _checkbox,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  _checkbox = !_checkbox;
                                                                                  _checkboxListTile = !_checkboxListTile;
                                                                                  _checkboxListTile1 = !_checkboxListTile1;
                                                                                  _checkboxListTile2 = !_checkboxListTile2;
                                                                                  _checkboxListTile3 = !_checkboxListTile3;
                                                                                });
                                                                              },
                                                                            ),
                                                                            const Text('Select All'),
                                                                          ],
                                                                        ),
                                                                        const Divider(),
                                                                        CheckboxListTile(
                                                                          activeColor:
                                                                              Colors.orange,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                          title:
                                                                              const Text('M.A. Human Resources Management (36 Credit)'),
                                                                          value:
                                                                              _checkboxListTile,
                                                                          onChanged:
                                                                              (value) {
                                                                            setState(() {
                                                                              _checkboxListTile = !_checkboxListTile;
                                                                            });
                                                                          },
                                                                        ),
                                                                        CheckboxListTile(
                                                                          activeColor:
                                                                              Colors.orange,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                          title:
                                                                              const Text('M.A. Legal Studies (39 Credit)'),
                                                                          value:
                                                                              _checkboxListTile1,
                                                                          onChanged:
                                                                              (value) {
                                                                            setState(() {
                                                                              _checkboxListTile1 = !_checkboxListTile1;
                                                                            });
                                                                          },
                                                                        ),
                                                                        CheckboxListTile(
                                                                          activeColor:
                                                                              Colors.orange,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                          title:
                                                                              const Text('Master of Urban Planning and Policy'),
                                                                          value:
                                                                              _checkboxListTile2,
                                                                          onChanged:
                                                                              (value) {
                                                                            setState(() {
                                                                              _checkboxListTile2 = !_checkboxListTile2;
                                                                            });
                                                                          },
                                                                        ),
                                                                        CheckboxListTile(
                                                                          activeColor:
                                                                              Colors.orange,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                          title:
                                                                              const Text('MS Information Systems'),
                                                                          value:
                                                                              _checkboxListTile3,
                                                                          onChanged:
                                                                              (value) {
                                                                            setState(() {
                                                                              _checkboxListTile3 = !_checkboxListTile3;
                                                                            });
                                                                          },
                                                                        ),
                                                                        const Divider(),
                                                                        const SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            InkWell(
                                                                              onTap: () {
                                                                                Get.back();
                                                                              },
                                                                              child: const Text(
                                                                                "OK",
                                                                                style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () {
                                                                                Get.back();
                                                                              },
                                                                              child: const Text(
                                                                                "CANCEL",
                                                                                style: TextStyle(color: Color(0xffFF5722), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 16),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: Icon(Icons.filter_list,
                                                      color:
                                                          partnerColorsValue ==
                                                                  true
                                                              ? Colors.red
                                                              : Colors.black)),
                                            ],
                                          )),
                                    ),
                                  ],
                                  source: TableRow(),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: Container(
                                  height: Get.height * 0.08,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.2)),
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
                    )),

                    // const SizedBox(
                    //   height: 25,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                    //   child: const Text(
                    //       'Disclaimer: Application fee waiver values may differ as per the institution-specific requirement.',
                    //       style: TextStyle(
                    //         color: kGrey,
                    //         fontSize: 14,
                    //         fontFamily: 'Nutino',
                    //       )),
                    // ),
                    // const SizedBox(
                    //   height: 25,
                    // ),
                    // supportSection()
                  ],
                ),
              ),
            ),
          );
  }
}

class TableRow extends DataTableSource {
  final List<ProgramListWithOtherInfoResponseModel>? data;

  TableRow({this.data});
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
        color: MaterialStateProperty.all(
            index.isOdd ? const Color(0xffF5F5F5) : Colors.transparent),
        index: index,
        cells: [
          DataCell(Container(
            height: Get.height * 0.17,
            width: index.isOdd ? Get.width * 0.28 : Get.width * 0.29,
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
              "${data![index].instName}",
              style: const TextStyle(fontFamily: 'Roboto', fontSize: 14),
            )),
          )),
          DataCell(Container(
            height: Get.height * 0.17,
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
                child: Text(
              "${data![index].programs![0].programName}",
              style: const TextStyle(fontFamily: 'Roboto', fontSize: 14),
            )),
          )),
          DataCell(Container(
            height: Get.height * 0.17,
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
                child: Text(
              "${data![index].instCountry}",
              style: const TextStyle(fontFamily: 'Roboto', fontSize: 14),
            )),
          )),
          DataCell(Container(
            height: Get.height * 0.17,
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
              "${data![index].programs![0].waiverPer}",
              style: const TextStyle(fontFamily: 'Roboto', fontSize: 14),
            )),
          )),
          DataCell(Container(
            height: Get.height * 0.17,
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
                child: Text(
              "${data![index].programs![0].partnerTypeName}",
              style: const TextStyle(fontFamily: 'Roboto', fontSize: 14),
            )),
          )),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data!.length;

  @override
  int get selectedRowCount => 0;
}
