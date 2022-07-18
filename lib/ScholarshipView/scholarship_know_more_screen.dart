import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/ScholarshipView/widget/common.dart';
import 'package:msm_unify/model/responseModek/scholarship_know_more_response_model.dart';
import 'package:msm_unify/model/responseModek/scholarship_more_detail_response_model.dart';
import 'package:msm_unify/viewModel/scholarship_know_more_view_model.dart';

import '../Api/api_response.dart';
import '../viewModel/scholarship_more_detail_view_model.dart';

class ScholarshipKnowMoreScreen extends StatefulWidget {
  final int? programId;
  final int? instituteId;

  const ScholarshipKnowMoreScreen({Key? key, this.programId, this.instituteId})
      : super(key: key);

  @override
  State<ScholarshipKnowMoreScreen> createState() =>
      _ScholarshipKnowMoreScreenState();
}

class _ScholarshipKnowMoreScreenState extends State<ScholarshipKnowMoreScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final ScholarshipKnowMoreViewModel _scholarshipKnowMoreViewModel =
      Get.put(ScholarshipKnowMoreViewModel());
  final ScholarshipMoreDetailViewModel _scholarshipMoreDetailViewModel =
      Get.put(ScholarshipMoreDetailViewModel());

  @override
  void initState() {
    _scholarshipMoreDetailViewModel.scholarshipMoreDetailViewModel(
        instituteId: widget.instituteId);
    _scholarshipKnowMoreViewModel.scholarshipKnowMoreViewModel(
        programId: widget.programId);
    //getMoreDetailss();
    super.initState();
    print('program Id==${widget.programId}');
    print('Institute Id====${widget.instituteId}');
  }

  List<ScholarshipMoreDetailResponseModel> data = [];
  Future<void> getMoreDetailss() async {
    await _scholarshipMoreDetailViewModel.scholarshipMoreDetailViewModel(
        instituteId: widget.instituteId);
    List<ScholarshipMoreDetailResponseModel> response =
        _scholarshipMoreDetailViewModel.apiResponse.data;
    response.forEach((element) {
      data.add(element);
    });
    setState(() {});
    print('dataa====${data[0].programs!.length}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: commonDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //buildPreferredSize(context, _key),
              SearchBar(keyGlobal: _key),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
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
              GetBuilder<ScholarshipKnowMoreViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.COMPLETE) {
                    ScholarshipKnowMoreResponseModel resp =
                        controller.apiResponse.data;
                    print('RESPONSE--------${resp}');
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${resp.programName}',
                              style: const TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 15,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          const Divider(
                            height: 2,
                            color: kGrey,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text('About the Program', style: textStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          Html(
                            data: '${resp.description}',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Subject Requirements', style: textStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: resp.subjectRequirement!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text("•", style: textStyle1),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                      '${resp.subjectRequirement![index].reqName} ${resp.subjectRequirement![index].score}',
                                      style: textStyle1),
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Academic Requirements', style: textStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: resp.accadmicRequirement!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text("•", style: textStyle1),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: Text(
                                        '${resp.accadmicRequirement![index].reqName} ${resp.subjectRequirement![index].score}',
                                        style: textStyle1),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('English Language Requirements',
                              style: textStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: resp.englishRequirement!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text('${resp.englishRequirement![index]}',
                                  style: textStyle1);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: Get.height * 0.040,
                              width: Get.width * 0.28,
                              decoration: BoxDecoration(
                                color: kRed,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: const Center(
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Documents Required', style: textStyle),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: resp.documentRequirement!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text("•", style: textStyle1),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: Text(
                                        '${resp.documentRequirement![index].documentName}',
                                        style: textStyle1),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
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
                                Center(
                                  child: Container(
                                    height: 80,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${'https://msmqastorage.blob.core.windows.net/files/files/institution/'}${resp.instLogoPath}"),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(height: 2, color: kGrey),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        resp.feeDetail!.isEmpty ||
                                                resp.feeDetail == []
                                            ? SizedBox()
                                            : SvgPicture.asset(
                                                'assets/icons/Application fee.svg',
                                                height: 20,
                                                width: 20,
                                              ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            width: Get.width * 0.35,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              resp.feeDetail!.isEmpty ||
                                                      resp.feeDetail == []
                                                  ? ''
                                                  : '${resp.feeDetail!.first.feeType}',
                                              style: textStyle2,
                                            )),
                                        Container(
                                          width: Get.width * 0.17,
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                              resp.feeDetail!.isEmpty ||
                                                      resp.feeDetail == []
                                                  ? ''
                                                  : '${resp.programCurrency} ${resp.feeDetail!.first.feeAmount}',
                                              style: const TextStyle(
                                                  // decoration: resp
                                                  //             .feeDetail!
                                                  //             .first
                                                  //             .actualFee ==
                                                  //         "N/A"
                                                  //     ? TextDecoration.none
                                                  //     : TextDecoration
                                                  //         .lineThrough,
                                                  color: kGrey,
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins')),
                                        ),
                                        Container(
                                            width: Get.width * 0.23,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              resp.feeDetail!.isEmpty ||
                                                      resp.feeDetail == [] ||
                                                      resp.feeDetail!.first
                                                              .actualFee ==
                                                          "N/A"
                                                  ? ''
                                                  : '${resp.programCurrency}${resp.feeDetail!.first.actualFee}',
                                              style: textStyle2,
                                            ))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        resp.feeDetail!.isEmpty ||
                                                resp.feeDetail == []
                                            ? SizedBox()
                                            : SvgPicture.asset(
                                                resp.feeDetail!.isEmpty ||
                                                        resp.feeDetail == []
                                                    ? ''
                                                    : 'assets/icons/TuitionFee.svg',
                                                height: 20,
                                                width: 20,
                                              ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            width: Get.width * 0.35,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              resp.feeDetail!.isEmpty ||
                                                      resp.feeDetail == []
                                                  ? ''
                                                  : '${resp.feeDetail!.last.feeType} (${resp.feeDetail!.last.feeBasis})',
                                              style: textStyle2,
                                            )),
                                        Container(
                                            width: Get.width * 0.35,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              resp.feeDetail!.isEmpty ||
                                                      resp.feeDetail == []
                                                  ? ''
                                                  : '${resp.programCurrency} ${resp.feeDetail!.last.feeAmount}',
                                              style: textStyle2,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/cost of living.svg',
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            width: Get.width * 0.35,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Cost of living per year',
                                              style: textStyle2,
                                            )),
                                        Container(
                                            width: Get.width * 0.35,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '${resp.programCurrency} ${resp.instCostofLivingYear}',
                                              style: textStyle2,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        resp.durationTime!.isEmpty ||
                                                resp.durationTime == ""
                                            ? SizedBox()
                                            : SvgPicture.asset(
                                                'assets/icons/duration.svg',
                                                height: 20,
                                                width: 20,
                                              ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            width: Get.width * 0.35,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              resp.durationTime!.isEmpty ||
                                                      resp.durationTime == ""
                                                  ? ''
                                                  : 'Duration',
                                              style: textStyle2,
                                            )),
                                        Container(
                                            width: Get.width * 0.35,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              resp.durationTime!.isEmpty ||
                                                      resp.durationTime == ""
                                                  ? ''
                                                  : '${resp.durationTime}',
                                              style: textStyle2,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/levelofEducation.svg',
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            width: Get.width * 0.35,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Level of Education',
                                              style: textStyle2,
                                            )),
                                        Container(
                                            width: Get.width * 0.35,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '${resp.levelOfEducation}',
                                              style: textStyle2,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Divider(height: 2, color: kGrey),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        width: Get.width * 0.30,
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Starting Date',
                                          style: textStyle2,
                                        )),
                                    Container(
                                        width: Get.width * 0.50,
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Submission Deadlines',
                                          style: textStyle2,
                                        )),
                                  ],
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: Get.width * 0.30,
                                          alignment: Alignment.topLeft,
                                          child: RichText(
                                            text: TextSpan(
                                              text: resp.inteks!.isEmpty ||
                                                      resp.inteks! == []
                                                  ? ''
                                                  : '${resp.inteks![0].intakeName} ',
                                              style: const TextStyle(
                                                  color: kRed,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                              children: [
                                                TextSpan(
                                                  text: resp.inteks!.isEmpty ||
                                                          resp.inteks! == []
                                                      ? ''
                                                      : '${resp.inteks![0].intekStatus}',
                                                  style: const TextStyle(
                                                      color: kGrey,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: Get.width * 0.30,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              resp.inteks!.isEmpty ||
                                                      resp.inteks! == []
                                                  ? 'N/A'
                                                  : '${resp.inteks![0].intekDate}',
                                              style: const TextStyle(
                                                  color: kRed,
                                                  fontSize: 12,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (controller.apiResponse.status == Status.ERROR) {
                    return const CircularProgressIndicator();
                  }
                  return const Center(
                    child: SingleChildScrollView(),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('Program Offering', style: textStyle),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<ScholarshipMoreDetailViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.COMPLETE) {
                    List<ScholarshipMoreDetailResponseModel> response =
                        controller.apiResponse.data;
                    print('RESPONSEEE>>>> ${response}');
                    return ListView.builder(
                      itemCount: response[0].programs!.length,
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
                                '${response[0].programs![index].programName}',
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
                                            "${'https://msmqastorage.blob.core.windows.net/files/files/institution/'}${response[0].instLogoPath}"),
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
                                          '${response[0].instName}',
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
                                                  '${response[0].instCountry}',
                                                  // overflow:
                                                  //     TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: kGrey,
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      response[0]
                                                  .programs![index]
                                                  .durationTime ==
                                              ""
                                          ? SizedBox()
                                          : Row(children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                  Text(
                                                    "${response[0].programs![index].durationTime} Years",
                                                    style: const TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins',
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
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            Text(
                                              "${response[0].programs![index].programLevel}",
                                              style: const TextStyle(
                                                color: kGrey3,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      response[0].programs![index].intakes ==
                                                  [] ||
                                              response[0]
                                                  .programs![index]
                                                  .intakes!
                                                  .isEmpty
                                          ? const SizedBox()
                                          : Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                      width: 100,
                                                      child: Text(
                                                        response[0]
                                                                        .programs![
                                                                            index]
                                                                        .intakes ==
                                                                    [] ||
                                                                response[0]
                                                                    .programs![
                                                                        index]
                                                                    .intakes!
                                                                    .isEmpty
                                                            ? ''
                                                            : "${response[0].programs![index].intakes![0].intakeName} ${response[0].programs![index].intakes![0].statusName}",
                                                        style: const TextStyle(
                                                          color: kGrey3,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 10,
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
                                              const Text(
                                                'Tuition Fees',
                                                style: TextStyle(
                                                  color: kGrey3,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              SizedBox(
                                                height: 100,
                                                width: 180,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: response[0]
                                                      .programs![index]
                                                      .feeDetail!
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index1) {
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${response[0].programs![index].feeDetail![index1].feeType}: ${response[0].programs![index].programCurrency} ${response[0].programs![index].feeDetail![index1].feeAmount}",
                                                          style:
                                                              const TextStyle(
                                                            color: kGrey3,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                fontWeight: FontWeight.w400,
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
                                                  border:
                                                      Border.all(color: kNavy),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${response[0].programs![index].scholarShipMinAmt}${response[0].programs![index].scholarShipAmtTypeName} to ${response[0].programs![index].scholarShipMaxAmt}${response[0].programs![index].scholarShipAmtTypeName} off',
                                                    style: const TextStyle(
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
                                      response[0].programs![index].waiverPer ==
                                              null
                                          ? Row(
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
                                                const SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  '${response[0].programs![index].averageProcessingDay}',
                                                  style: const TextStyle(
                                                    color: kGrey3,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Application Fee Waivers',
                                                  style: TextStyle(
                                                    color: kGrey3,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${response[0].programs![index].programCurrency} ${response[0].programs![index].applicationFee}',
                                                      style: const TextStyle(
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
                                                    Text(
                                                      "${response[0].programs![index].programCurrency} ${response[0].programs![index].applicationFeeAfterWaiver}",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff34BF49),
                                                          fontFamily: "Nunito"),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
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
                                                          '${response[0].programs![index].waiverPer}${response[0].programs![index].scholarShipAmtTypeName} off',
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: Get.height * 0.045,
                                      width: Get.width * 0.25,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: kNavy),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Read More",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: kNavy,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: Get.height * 0.045,
                                      width: Get.width * 0.23,
                                      decoration: BoxDecoration(
                                        color: kNavy,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Apply",
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
                  } else if (controller.apiResponse.status == Status.ERROR) {
                    return const CircularProgressIndicator();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
