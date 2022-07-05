import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/model/responseModek/commission_institution_response_model.dart';
import 'package:msm_unify/viewModel/commission_institution_view_model.dart';

import '../../../../model/responseModek/interest_dialogue_response_model.dart';
import '../../../../viewModel/interest_program_dialogue_view_model.dart';
import '../../../common/AppConfig/support_section.dart';
import '../../../common/color_constant.dart';

class StdInterestTab extends StatefulWidget {
  final int? instituteId;

  const StdInterestTab({Key? key, this.instituteId}) : super(key: key);

  @override
  State<StdInterestTab> createState() => _StdInterestTabState();
}

class _StdInterestTabState extends State<StdInterestTab> {
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

  final List<String> _program = [
    'All',
    'Acting Associate of Arts(AA)',
    'Acting Bachelor of Fine Arts(BFA)',
    'Acting Master of Arts(MA)',
    'Advertising (Certificate)',
  ];

  final ProgramDialogueViewModel programDialogueViewModel =
      Get.put(ProgramDialogueViewModel());

  String? _selectedInstitute;
  String? _selectedProgram;
  List<InstituteDialogueResponseModel> program = [];

  Future<void> getProgram() async {
    await programDialogueViewModel.programDialogueViewModel(
        instituteId: int.parse(_selectedInstitute.toString()));
    List<InstituteDialogueResponseModel> response =
        programDialogueViewModel.apiResponse.data;
    print('RESPONSE----->>>>> $response');
    response.forEach((element) {
      program.add(element);
    });
    setState(() {});
  }

  final CommissionInstitutionViewModel _commissionInstitutionViewModel =
      Get.put(CommissionInstitutionViewModel());
  List<CommissionInstitutionResponseModel> institute = [];

  Future<void> getInstitution() async {
    await _commissionInstitutionViewModel.commissionInstitutionViewModel();
    List<CommissionInstitutionResponseModel> response =
        _commissionInstitutionViewModel.apiResponse.data;
    response.forEach((element) {
      institute.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    getInstitution();
    getProgram();
    super.initState();
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return SimpleDialog(
                                  shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: const BorderSide(color: kRed)),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Interest',
                                                style: TextStyle(
                                                    color: kNavy,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.08,
                                                  decoration: BoxDecoration(
                                                    color: kRed,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButtonFormField(
                                                  isExpanded: true,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  hint: const Text("All"),
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: kGrey4,
                                                                width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    label:
                                                        const Text('Institute'),
                                                    labelStyle: const TextStyle(
                                                      fontFamily: 'Roboto',
                                                      color: kGrey4,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color:
                                                                        kGrey,
                                                                    width: 2)),
                                                  ),
                                                  value: _selectedInstitute,
                                                  items: institute
                                                      .map((institute) {
                                                    return DropdownMenuItem(
                                                        value: institute
                                                            .institutionId
                                                            .toString(),
                                                        child: Text(
                                                          institute.instName
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: kGrey4,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontSize: 13),
                                                        ));
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    program.clear();
                                                    _selectedInstitute =
                                                        newValue as String?;
                                                    getProgram().then((value) =>
                                                        setState(() {}));
                                                  }),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButtonFormField(
                                                  isExpanded: true,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  hint: const Text("All"),
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: kGrey4,
                                                                width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    label:
                                                        const Text('Program'),
                                                    labelStyle: const TextStyle(
                                                      fontFamily: 'Roboto',
                                                      color: kGrey4,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color:
                                                                        kGrey,
                                                                    width: 2)),
                                                  ),
                                                  value: _selectedProgram,
                                                  items: program.map((program) {
                                                    return DropdownMenuItem(
                                                        value: program
                                                            .programName
                                                            .toString(),
                                                        child: Text(
                                                          program.programName
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: kGrey4,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontSize: 13),
                                                        ));
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _selectedProgram =
                                                          newValue as String?;
                                                    });
                                                  }),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.09,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: Get.height * 0.04,
                                              width: Get.width * 0.25,
                                              decoration: BoxDecoration(
                                                  color: kRed,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Center(
                                                  child: Text(
                                                'Add',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily: 'Roboto',
                                                ),
                                              )),
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
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: Get.height * 0.05,
                        width: Get.width * 0.30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: kNavy, style: BorderStyle.solid)),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add,
                              color: kNavy,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                'Add More',
                                style: TextStyle(
                                  color: kNavy,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/Filter.svg',
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/XLSX.svg',
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Column(
                  children: [
                    PaginatedDataTable(
                        onRowsPerPageChanged: (perPage) {},
                        columnSpacing: 0,
                        rowsPerPage: 10,
                        dataRowHeight: Get.height * 0.05,
                        headingRowHeight: Get.height * 0.08,
                        horizontalMargin: 1,
                        columns: [
                          DataColumn(
                            label: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              height: Get.height * 0.10,
                              width: Get.width * 0.43,
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
                                        // colorsValue = true;
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          // colorsValue = false;
                                          setState(() {});
                                        });
                                      });
                                    },
                                    child: const Text(
                                      'Institution',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          // colorsValue = true;
                                          Future.delayed(
                                              const Duration(seconds: 1), () {
                                            // colorsValue = false;
                                            setState(() {});
                                          });
                                        });
                                      },
                                      // onTap: () {},
                                      child: const Icon(
                                        Icons.filter_list,
                                        color: Colors.black,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.43,
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
                                              // colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                // colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: const Text(
                                            'Program',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                // colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  // colorsValue = false;
                                                  setState(() {});
                                                });
                                              });
                                            },
                                            // onTap: () {},
                                            child: const Icon(
                                              Icons.filter_list,
                                              color: Colors.black,
                                            )),
                                      )
                                    ],
                                  ))),
                          DataColumn(
                            label: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              height: Get.height * 0.10,
                              width: Get.width * 0.43,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF5F5F5),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    // colorsValue = true;
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      // colorsValue = false;
                                      setState(() {});
                                    });
                                  });
                                },
                                child: const Center(
                                  child: Text(
                                    'Action',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        source: TableRow(context)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    height: Get.height * 0.08,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
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
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    actions: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: Get.height * 0.80,
                                            width: Get.width,
                                            child: StatefulBuilder(
                                              builder: (BuildContext context,
                                                  void Function(void Function())
                                                      setState) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Filter Builder',
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 22,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.04,
                                                    ),
                                                    const Divider(),
                                                    SizedBox(
                                                      height: Get.height * 0.04,
                                                    ),
                                                    Row(
                                                      children: [
                                                        PopupMenuButton(
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .red
                                                                    .withOpacity(
                                                                        0.2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Text(add
                                                                  .toString()),
                                                            ),
                                                            itemBuilder:
                                                                (context) => [
                                                                      PopupMenuItem(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            add =
                                                                                'Not And';
                                                                          });
                                                                        },
                                                                        child: const Text(
                                                                            'Not And'),
                                                                      ),
                                                                      PopupMenuItem(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            add =
                                                                                'or';
                                                                          });
                                                                        },
                                                                        child: const Text(
                                                                            'or'),
                                                                      ),
                                                                      PopupMenuItem(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            add =
                                                                                'Not or';
                                                                          });
                                                                        },
                                                                        child: const Text(
                                                                            'Not or'),
                                                                      ),
                                                                      PopupMenuItem(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            add =
                                                                                'And';
                                                                          });
                                                                        },
                                                                        child: const Text(
                                                                            'And'),
                                                                      ),
                                                                    ]),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        PopupMenuButton(
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: Text(
                                                              "+",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green
                                                                      .withOpacity(
                                                                          0.5),
                                                                  fontSize: 25),
                                                            ),
                                                          ),
                                                          itemBuilder:
                                                              (context) => [
                                                            PopupMenuItem(
                                                              onTap: () {
                                                                setState(() {
                                                                  _addCondition =
                                                                      true;
                                                                });
                                                              },
                                                              child: const Text(
                                                                  'Add Condition'),
                                                            ),
                                                            PopupMenuItem(
                                                              onTap: () {
                                                                setState(() {
                                                                  _addGroup =
                                                                      true;
                                                                });
                                                              },
                                                              child: const Text(
                                                                  'Add Group'),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    _addGroup == true
                                                        ? Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    _addGroup =
                                                                        false;
                                                                  });
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 25,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              PopupMenuButton(
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .red
                                                                          .withOpacity(
                                                                              0.2),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child: Text(
                                                                        add1.toString()),
                                                                  ),
                                                                  itemBuilder:
                                                                      (context) =>
                                                                          [
                                                                            PopupMenuItem(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  add1 = 'Not And';
                                                                                });
                                                                              },
                                                                              child: const Text('Not And'),
                                                                            ),
                                                                            PopupMenuItem(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  add1 = 'or';
                                                                                });
                                                                              },
                                                                              child: const Text('or'),
                                                                            ),
                                                                            PopupMenuItem(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  add1 = 'Not or';
                                                                                });
                                                                              },
                                                                              child: const Text('Not or'),
                                                                            ),
                                                                            PopupMenuItem(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  add1 = 'And';
                                                                                });
                                                                              },
                                                                              child: const Text('And'),
                                                                            ),
                                                                          ]),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              PopupMenuButton(
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(10),
                                                                  child: Text(
                                                                    "+",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .green
                                                                            .withOpacity(
                                                                                0.5),
                                                                        fontSize:
                                                                            25),
                                                                  ),
                                                                ),
                                                                itemBuilder:
                                                                    (context) =>
                                                                        [
                                                                  PopupMenuItem(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        _addCondition =
                                                                            true;
                                                                      });
                                                                    },
                                                                    child: const Text(
                                                                        'Add Condition'),
                                                                  ),
                                                                  PopupMenuItem(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: const Text(
                                                                        'Add Group'),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        : const SizedBox(),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    _addCondition == true
                                                        ? Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    _addCondition =
                                                                        false;
                                                                  });
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 25,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              PopupMenuButton(
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .red
                                                                          .withOpacity(
                                                                              0.2),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child: Text(
                                                                        add1.toString()),
                                                                  ),
                                                                  itemBuilder:
                                                                      (context) =>
                                                                          [
                                                                            PopupMenuItem(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  add1 = 'Not And';
                                                                                });
                                                                              },
                                                                              child: const Text('Not And'),
                                                                            ),
                                                                            PopupMenuItem(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  add1 = 'or';
                                                                                });
                                                                              },
                                                                              child: const Text('or'),
                                                                            ),
                                                                            PopupMenuItem(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  add1 = 'Not or';
                                                                                });
                                                                              },
                                                                              child: const Text('Not or'),
                                                                            ),
                                                                            PopupMenuItem(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  add1 = 'And';
                                                                                });
                                                                              },
                                                                              child: const Text('And'),
                                                                            ),
                                                                          ]),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .green
                                                                      .withOpacity(
                                                                          0.5),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: const Text(
                                                                    'Contains'),
                                                              ),
                                                            ],
                                                          )
                                                        : const SizedBox(),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            right: 5,
                                            bottom: 5,
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: const Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: const Text(
                                                    'CANCEL',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: const Text(
                            "Create Filter",
                            style: TextStyle(
                              color: Color(0xffe8252a),
                              fontFamily: 'Roboto',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
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

class TableRow extends DataTableSource {
  final BuildContext;

  TableRow(this.BuildContext);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            showDialog(
              context: BuildContext,
              builder: (context) {
                return SimpleDialog(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: kRed)),
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Text(
                          ' Are you sure, want to delete this record?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Get.height * 0.08,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Get.back();
                              },
                              height: Get.height * 0.06,
                              minWidth: Get.width * 0.20,
                              color: Colors.green,
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                'No',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.03,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              height: Get.height * 0.06,
                              minWidth: Get.width * 0.20,
                              color: Colors.red,
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                'Yes',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: const Icon(Icons.close, color: kRed, size: 25),
          ),
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 3;

  @override
  int get selectedRowCount => 0;
}
