import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/profile_branch_response_model.dart';
import 'package:msm_unify/viewModel/profile_branch_view_model.dart';

import '../../../common/AppConfig/support_section.dart';
import '../../../common/color_constant.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

  String? _selectedProvince;
  final List<String> _province = [
    'paktila',
    'Simada',
    'Varachha',
    'Motavarachha'
  ];

  String? _selectedCountry;
  final List<String> _country = [
    'India',
    'America',
    'Australia',
  ];

  final ProfileBranchViewModel _profileBranchViewModel =
      Get.put(ProfileBranchViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
              GetBuilder<ProfileBranchViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.COMPLETE) {
                    List<BranchResponseModel> response =
                        controller.apiResponse.data;
                    print('RESPONSE>>>$response');
                    return PaginatedDataTable(
                      onRowsPerPageChanged: (perPage) {},
                      columnSpacing: 0,
                      rowsPerPage: 5,
                      availableRowsPerPage: const [5],
                      dataRowHeight: Get.height * 0.05,
                      headingRowHeight: Get.height * 0.08,
                      horizontalMargin: 1,
                      columns: [
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
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
                                  child: const Text(
                                    'Branch Name',
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
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.53,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
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
                                      'City',
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
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.53,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
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
                                      'Country',
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
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
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
                                      'Email ID',
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
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
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
                                      'Phone Number',
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
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
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
                                      'Contact Person',
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
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
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
                                      'Contact Number',
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
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
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
                                      'Contact Email ID',
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
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
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
                                      'Address',
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
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
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
                      source: TableRow(data: response, BuildContext: context),
                    );
                  } else if (controller.apiResponse.status == Status.ERROR) {
                    return const CircularProgressIndicator();
                  }
                  return const Center(child: CircularProgressIndicator());
                },
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
                      InkWell(
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
                                                              color: Colors.red
                                                                  .withOpacity(
                                                                      0.2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Text(
                                                                add.toString()),
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
                                                              child: const Icon(
                                                                Icons.close,
                                                                color:
                                                                    Colors.red,
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
                                                                      const EdgeInsets
                                                                          .all(10),
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
                                                                  child: Text(add1
                                                                      .toString()),
                                                                ),
                                                                itemBuilder:
                                                                    (context) =>
                                                                        [
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add1 = 'Not And';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('Not And'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add1 = 'or';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('or'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add1 = 'Not or';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('Not or'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add1 = 'And';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('And'),
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
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              itemBuilder:
                                                                  (context) => [
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
                                                              child: const Icon(
                                                                Icons.close,
                                                                color:
                                                                    Colors.red,
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
                                                                      const EdgeInsets
                                                                          .all(10),
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
                                                                  child: Text(add1
                                                                      .toString()),
                                                                ),
                                                                itemBuilder:
                                                                    (context) =>
                                                                        [
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add1 = 'Not And';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('Not And'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add1 = 'or';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('or'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add1 = 'Not or';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('Not or'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add1 = 'And';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('And'),
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
                                              InkWell(
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
                                              InkWell(
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
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(color: kRed)),
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Branch',
                                          style: TextStyle(
                                              color: kNavy,
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
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
                                                      BorderRadius.circular(5)),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'New Branch Details',
                                          style: TextStyle(
                                              color: kNavy,
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const CommonTextField(
                                        name: 'Branch Name',
                                        label: 'Branch Name'),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const CommonTextField(
                                        name: 'Phone Number',
                                        label: 'Phone Number'),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const CommonTextField(
                                        name: 'Email ID', label: 'Email ID'),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const CommonTextField(
                                        name: 'Address', label: 'Address'),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        height: Get.height * 0.068,
                                        width: double.infinity,
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
                                                  BorderRadius.circular(15),
                                              hint: const Text("Country"),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 13),
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
                                      height: Get.height * 0.02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        height: Get.height * 0.068,
                                        width: double.infinity,
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
                                                  BorderRadius.circular(15),
                                              hint: const Text("Province"),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 13),
                                              value: _selectedProvince,
                                              items: _province.map((country) {
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
                                                  _selectedProvince =
                                                      newValue as String?;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const CommonTextField(
                                        name: 'City', label: 'City'),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Contact Information',
                                          style: TextStyle(
                                              color: kNavy,
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const CommonTextField(
                                        name: 'Name', label: 'Name'),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const CommonTextField(
                                        name: 'Contact No',
                                        label: 'Contact No'),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const CommonTextField(
                                        name: 'Email ID', label: 'Email ID'),
                                    SizedBox(
                                      height: Get.height * 0.07,
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: Get.height * 0.04,
                                        width: Get.width * 0.33,
                                        decoration: BoxDecoration(
                                            color: kRed,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: const Center(
                                            child: Text(
                                          'Add Branch',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto',
                                              fontSize: 13),
                                        )),
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
                        height: Get.height * 0.045,
                        // width: Get.width * 0.30,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                              color: kNavy, style: BorderStyle.solid, width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.add,
                              size: 20,
                              color: kNavy,
                            ),
                            Text(
                              'New Branch Record',
                              style: TextStyle(
                                color: kNavy,
                                fontFamily: 'Roboto',
                                fontSize: 13,
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              supportSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final BuildContext;
  final List<BranchResponseModel>? data;

  TableRow({this.data, this.BuildContext});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].branchName}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].city}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.53,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].countryName}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.53,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].branchEmail}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].branchPhone}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].contactPersonName}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].contactPersonEmailId}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].contactPersonPhone}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].branchAddress}'),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  showDialog(
                      context: BuildContext,
                      builder: (context) {
                        return SimpleDialog(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xffe8252a)),
                              borderRadius: BorderRadius.circular(10)),
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              height: Get.height * 0.20,
                              width: Get.width,
                              child: Column(
                                children: [
                                  const Text(
                                    'Are you sure,Want to delete this record? ',
                                    style: TextStyle(
                                        color: Color(0xff565656),
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          height: Get.height * 0.04,
                                          width: Get.width * 0.20,
                                          decoration: BoxDecoration(
                                            color: kGreen1,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: Get.height * 0.04,
                                        width: Get.width * 0.20,
                                        decoration: BoxDecoration(
                                          color: kRed,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: SvgPicture.asset('assets/icons/close_red.svg')),
          ),
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

class CommonTextField extends StatelessWidget {
  const CommonTextField({Key? key, this.name, this.label}) : super(key: key);
  final name;
  final label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: name,
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontFamily: 'Roboto',
              fontSize: 13),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: kGrey,
                width: 1,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: kGrey,
                width: 1,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: kGrey,
                width: 2,
              )),
        ),
      ),
    );
  }
}
