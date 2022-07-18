import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/primery_button.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/for_program_page_response_model.dart';
import 'package:msm_unify/viewModel/for_program_page-view_model.dart';

class ProgramDetailScreen extends StatefulWidget {
  final int programId;

  const ProgramDetailScreen({super.key, required this.programId});
  @override
  _ProgramDetailScreenState createState() => _ProgramDetailScreenState();
}

class _ProgramDetailScreenState extends State<ProgramDetailScreen> {
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
    super.initState();
    print('program Id==${widget.programId}');
    _forProgramPageViewModel.forProgramPageViewModel(
        programId: widget.programId);
  }

  @override
  Widget build(BuildContext context) {
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
                                        value: _selectedCountry ?? "India",
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
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: response.englishRequirement!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: const [
                            SizedBox(width: 15),
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
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: response.documentRequirement!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: const [
                            SizedBox(width: 15),
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
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            if (response.instLogoPath != null)
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: Get.height * 0.135,
                                  width: Get.width * 0.70,
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        //'https://appmsmunifyprod.blob.core.windows.net/docs/files/institution/${response.instLogoPath}'
                                        'https://msmqastorage.blob.core.windows.net/files/files/institution/${response.instLogoPath}'),
                                  ),
                                ),
                              ),
                            if (response.instLogoPath != null)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: const Divider(thickness: 1),
                              ),
                            Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(
                                            response.feeDetail!.length,
                                            (index) {
                                          return Row(
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
                                                '${response.feeDetail![index].feeType}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                ),
                                              )
                                            ],
                                          );
                                        })),
                                  ),
                                  SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: Get.width * 0.30,
                                    child: Row(
                                        children: List.generate(
                                            response.feeDetail!.length,
                                            (index) {
                                      return Row(
                                        children: [
                                          Text(
                                            'CAD ${response.feeDetail![index].feeAmount}',
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Color(0xff999999),
                                                fontSize: 10,
                                                fontFamily: 'Poppins'),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${response.feeDetail![index].actualFee}',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              color: Color(0xff565656),
                                            ),
                                          ),
                                        ],
                                      );
                                    })),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                      children: List.generate(
                                          response.feeDetail!.length, (index) {
                                    return Row(
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
                                          '${response.feeDetail![index].feeType} ${response.feeDetail![index].feeBasis}',
                                          style: const TextStyle(
                                            color: kGrey,
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    );
                                  })),
                                  const SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: Get.width * 0.34,
                                    child: Row(
                                        children: List.generate(
                                            response.feeDetail!.length,
                                            (index) {
                                      return Row(
                                        children: [
                                          const SizedBox(width: 5),
                                          Text(
                                            'CAD ${response.feeDetail![index].feeAmount}',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              color: Color(0xff565656),
                                            ),
                                          )
                                        ],
                                      );
                                    })),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
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
                              const SizedBox(height: 8),
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
                              const SizedBox(height: 8),
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
                            ]),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: const Divider(thickness: 1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
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
                                ]),
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
                            Container(
                              margin: EdgeInsets.only(top: 8),
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: const Text(
                                      '1. Kavita Wilson - (India)',
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                  Row(children: [
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
                                  ]),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: const Text(
                                      '2. Ritu',
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                  Row(children: [
                                    SvgPicture.asset(
                                      'assets/icons/email.svg',
                                      height: 14,
                                      width: 14,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Text(
                                        ' etonadmissions@etoncollege.ca ',
                                        style: TextStyle(
                                          color: Color(0xff333333)
                                              .withOpacity(0.8),
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ),
                                  ]),
                                ]),
                          ]),
                    ),
                    PrimeryButton(
                        callBack: () {
                          //TODO overrite this with proper defination
                        },
                        title: 'apply'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: const Text(
                        'Program Offerings',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    supportSection()
                  ],
                ),
              ),
            ),
          );
        } else {
          if (controller.apiResponse.status == Status.ERROR) {
            return const Center(
              child: Scaffold(
                body: Center(
                  child: Text('Somthing went wrong'),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
