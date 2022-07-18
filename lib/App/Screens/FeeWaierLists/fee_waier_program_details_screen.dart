import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/for_program_page_response_model.dart';
import 'package:msm_unify/viewModel/for_program_page-view_model.dart';

class FeeWaierProgramDetailsScreen extends StatefulWidget {
  final int? programId;

  const FeeWaierProgramDetailsScreen({super.key, this.programId});
  @override
  _FeeWaierProgramDetailsScreenState createState() =>
      _FeeWaierProgramDetailsScreenState();
}

class _FeeWaierProgramDetailsScreenState
    extends State<FeeWaierProgramDetailsScreen> {
  String? _selectedCountry;
  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];
  final ForProgramPageViewModel _forProgramPageViewModel =
      Get.put(ForProgramPageViewModel());

  @override
  void initState() {
    _forProgramPageViewModel.forProgramPageViewModel(
        programId: widget.programId!);
    super.initState();
    print('program Id==${widget.programId}');
  }

  // Future<void> forProgramPage() async {
  //   await
  //   ForProgramPageResponseModel response =
  //       _forProgramPageViewModel.apiResponse.data;
  //
  // }

  @override
  Widget build(BuildContext context) {
    // print('data===${data}');data
    return SafeArea(child: GetBuilder<ForProgramPageViewModel>(
      builder: (controller) {
        if (controller.apiResponse.status == Status.COMPLETE) {
          ForProgramPageResponseModel response = controller.apiResponse.data;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                Container(
                                  height: Get.height * 0.060,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                Flexible(
                                  child: SizedBox(
                                    height: Get.height * 0.060,
                                    width: Get.width * 0.55,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.2)),
                                          hintText:
                                              'What do you Want to study?',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.060,
                                  width: Get.width * 0.30,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.2)),
                                        hintText: 'Destination',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                                Container(
                                  height: Get.height * 0.060,
                                  width: Get.width * 0.35,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                Container(
                                  height: Get.height * 0.060,
                                  width: Get.width * 0.25,
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
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 20,
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
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.49,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${response.programName}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: Get.width * 0.47,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'By ${response.instName}',
                                  style: const TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
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
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'About the Program',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Html(
                      data: '${response.description}',
                    ),
                    // Text(
                    //   '${response.description}',
                    //   style: const TextStyle(
                    //       color: Color(0xff333333),
                    //       fontFamily: 'Poppins',
                    //       fontSize: 14),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Subject Requirements',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      'N/A',
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontFamily: 'Poppins',
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Academic requirements',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: response.subjectRequirement!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "•",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              '${response.subjectRequirement}',
                              style: const TextStyle(
                                  color: Color(0xff333333),
                                  fontFamily: 'Poppins',
                                  fontSize: 14),
                            )
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'English Language Requirements',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: response.englishRequirement!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: const [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "•",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'N/A',
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontFamily: 'Poppins',
                                  fontSize: 14),
                            )
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Documents Required',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: response.documentRequirement!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: const [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "•",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'N/A',
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontFamily: 'Poppins',
                                  fontSize: 14),
                            )
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: Get.height * 0.75,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  height: Get.height * 0.135,
                                  width: Get.width * 0.70,
                                  child: Image(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://appmsmunifyprod.blob.core.windows.net/docs/files/institution/${response.instTile}'))),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/Applicationfee.svg',
                                          height: 15,
                                          width: 15,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${response.feeDetail![0].feeType}',
                                          style: const TextStyle(
                                            color: kGrey,
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: Get.width * 0.30,
                                      child: Row(
                                        children: [
                                          Text(
                                            'CAD ${response.feeDetail![0].feeAmount}',
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Color(0xff999999),
                                                fontSize: 10,
                                                fontFamily: 'Poppins'),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${response.feeDetail![0].actualFee}',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              color: Color(0xff565656),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/TuitionFee.svg',
                                          height: 15,
                                          width: 15,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${response.feeDetail![2].feeType} ${response.feeDetail![2].feeBasis}',
                                          style: const TextStyle(
                                            color: kGrey,
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: Get.width * 0.34,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 5),
                                          Text(
                                            'CAD ${response.feeDetail![2].feeAmount}',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              color: Color(0xff565656),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/costofliving.svg',
                                          height: 15,
                                          width: 15,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'Cost of living per year',
                                          style: TextStyle(
                                            color: kGrey,
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: Get.width * 0.34,
                                      child: Row(
                                        children: const [
                                          SizedBox(width: 5),
                                          Text(
                                            'CAD 10000',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              color: Color(0xff565656),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: Get.width * 0.50,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/duration.svg',
                                            height: 15,
                                            width: 15,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            'Duration',
                                            style: TextStyle(
                                              color: kGrey,
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: Get.width * 0.34,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 5),
                                          Text(
                                            '${response.durationTime}',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              color: Color(0xff565656),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: Get.width * 0.50,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/levelofEducation.svg',
                                            height: 15,
                                            width: 15,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            'Level of Education',
                                            style: TextStyle(
                                              color: kGrey,
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: Get.width * 0.34,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 5),
                                          Text(
                                            '${response.levelOfEducation}',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              color: Color(0xff565656),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Starting Date',
                                      style: TextStyle(
                                          color: kGrey,
                                          fontFamily: 'Poppins',
                                          fontSize: 14),
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                          text: 'Sep-2022 -',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                              fontFamily: 'Poppins'),
                                          children: [
                                            TextSpan(
                                                text: 'Open',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12))
                                          ]),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      'Submission Deadlines',
                                      style: TextStyle(
                                          color: kGrey,
                                          fontFamily: 'Poppins',
                                          fontSize: 14),
                                    ),
                                    Text('05 Sep 2022',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Poppins',
                                            fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: Get.height * 0.05,
                              width: Get.width,
                              color: Color(0xffE6EBF3),
                              child: const Center(
                                child: Text(
                                  'Contact Details',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  '1. Kavita Wilson - (India)',
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/email.svg'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'global@etoncollege.ca',
                                      style: TextStyle(
                                        color:
                                            Color(0xff333333).withOpacity(0.8),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  '2. Ritu',
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/email.svg',
                                      height: 14,
                                      width: 14,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ' etonadmissions@etoncollege.ca ',
                                      style: TextStyle(
                                        color:
                                            Color(0xff333333).withOpacity(0.8),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Program Offerings',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        itemCount: 2,
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
                                    const Text(
                                      'Business Administration Major i..',
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
                                          width: 90,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/clg.png'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Get.width * 0.6,
                                                child: const Text(
                                                  'Eton College',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: kGrey,
                                                    fontSize: 18,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.6,
                                                child: const Text(
                                                    ' Vancouver, Canada',
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
                                              MainAxisAlignment.spaceBetween,
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
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              '16 Months',
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
                                                'Diploma (2-Year UG)',
                                                style: TextStyle(
                                                  color: kGrey3,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
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
                                              MainAxisAlignment.spaceBetween,
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
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Sep-2022 : Open',
                                              style: TextStyle(
                                                color: kGrey3,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.5,
                                              child: Column(
                                                children: const [
                                                  Text(
                                                    'Application Fee : CAD         ',
                                                    style: TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                  Text(
                                                    'Minimum Deposit : CAD 6,000.00',
                                                    style: TextStyle(
                                                      color: kGrey3,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                  Text(
                                                    'Tustion Fee : CAD 8,450.00     ',
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
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff999999),
                                                  fontFamily: "Nunito"),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("CAD 0",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff34BF49),
                                                    fontFamily: "Nunito")),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              height: Get.height * 0.03,
                                              width: Get.width * 0.18,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: kNavy),
                                                borderRadius:
                                                    BorderRadius.circular(5),
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
                                              MainAxisAlignment.spaceBetween,
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
                                                  fontWeight: FontWeight.w600,
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
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: Get.height * 0.045,
                                            width: Get.width * 0.25,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: kNavy),
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: Get.height * 0.045,
                                            width: Get.width * 0.25,
                                            decoration: BoxDecoration(
                                              color: kNavy,
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                          width: 8,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                    const SizedBox(
                      height: 25,
                    ),
                    supportSection()
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
