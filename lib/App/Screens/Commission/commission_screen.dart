import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/AppData/app_data.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/commission_response_model.dart';
import 'package:msm_unify/viewModel/commission_view_model.dart';

import '../../../Api/api_response.dart';

class CommissionTabScreen extends StatefulWidget {
  const CommissionTabScreen({Key? key}) : super(key: key);

  @override
  State<CommissionTabScreen> createState() => _CommissionTabScreenState();
}

class _CommissionTabScreenState extends State<CommissionTabScreen> {
  CommissionViewModel commissionViewModel = Get.put(CommissionViewModel());

  String? _selectedCountry;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];
  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

  @override
  void initState() {
    commissionViewModel.commissionViewModel(
        agentId: int.parse(
            "${Get.find<AppData>().loginResponseModel.rslt!.userId}"));
    print('idd=="${Get.find<AppData>().loginResponseModel.rslt!.userId}"');
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: commonDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPreferredSize(context, _key),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text('Commission',
                            style: TextStyle(
                                color: kNavy,
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      ],
                    ),
                    GetBuilder<CommissionViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          List<CommissionResponseModel> res =
                              controller.apiResponse.data;
                          //print('RESPONSE=======${res}');
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.33,
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
                                                      const Duration(
                                                          seconds: 2), () {
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
                                                        const Duration(
                                                            seconds: 1), () {
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
                                        ))),
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.430,
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
                                                        const Duration(
                                                            seconds: 2), () {
                                                      // colorsValue = false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: const Text(
                                                  'Institution Partner',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    // colorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
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
                                        ))),
                                DataColumn(
                                  label: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    height: Get.height * 0.10,
                                    width: Get.width * 0.33,
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
                                                  const Duration(seconds: 2),
                                                  () {
                                                // colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: const Text(
                                            ' Country',
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
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.33,
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
                                                      const Duration(
                                                          seconds: 2), () {
                                                    // colorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: const Text(
                                                'Programs',
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
                                                        const Duration(
                                                            seconds: 1), () {
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
                                        ))),
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.33,
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
                                                        const Duration(
                                                            seconds: 2), () {
                                                      // colorsValue = false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: const Text(
                                                  'Commission',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    // colorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
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
                                        ))),
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.33,
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
                                                      const Duration(
                                                          seconds: 2), () {
                                                    // colorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: const Text(
                                                'Currency',
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
                                                        const Duration(
                                                            seconds: 1), () {
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
                                        ))),
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.430,
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
                                                        const Duration(
                                                            seconds: 2), () {
                                                      // colorsValue = false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: const Text(
                                                  'Commission Detail',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    // colorsValue = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 1), () {
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
                                        ))),
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.33,
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
                                                      const Duration(
                                                          seconds: 2), () {
                                                    // colorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: const Text(
                                                'View Detail',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))),
                              ],
                              source: TableRow(BuildContext: context, res));
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
                                                  builder: (BuildContext
                                                          context,
                                                      void Function(
                                                              void Function())
                                                          setState) {
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Filter Builder',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 22,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.04,
                                                        ),
                                                        const Divider(),
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.04,
                                                        ),
                                                        Row(
                                                          children: [
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
                                                                  child: Text(add
                                                                      .toString()),
                                                                ),
                                                                itemBuilder:
                                                                    (context) =>
                                                                        [
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add = 'Not And';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('Not And'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add = 'or';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('or'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add = 'Not or';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('Not or'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add = 'And';
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
                                                                        () {
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
                                                                      setState(
                                                                          () {
                                                                        _addGroup =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .close,
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
                                                                            const EdgeInsets.all(10),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Colors
                                                                              .red
                                                                              .withOpacity(0.2),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
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
                                                                          const EdgeInsets.all(
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        "+",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.green.withOpacity(0.5),
                                                                            fontSize: 25),
                                                                      ),
                                                                    ),
                                                                    itemBuilder:
                                                                        (context) =>
                                                                            [
                                                                      PopupMenuItem(
                                                                        onTap:
                                                                            () {
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
                                                                        onTap:
                                                                            () {
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
                                                                      setState(
                                                                          () {
                                                                        _addCondition =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .close,
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
                                                                            const EdgeInsets.all(10),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Colors
                                                                              .red
                                                                              .withOpacity(0.2),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
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
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .green
                                                                          .withOpacity(
                                                                              0.5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final BuildContext;
  final List<CommissionResponseModel>? data;

  TableRow(this.data, {required this.BuildContext});
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].instName}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.430,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].partnerTypeName}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].institutionCountryName}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].programs}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].commissionType}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].currency}'),
        ),
      ),
      DataCell(
        GestureDetector(
          onTap: () {
            showDialog(
              context: BuildContext,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SimpleDialog(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: kRed, width: 1)),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Commission Details',
                                  style: TextStyle(
                                      color: kNavy,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.08,
                                    decoration: BoxDecoration(
                                        color: kRed,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Icon(Icons.close,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: kGrey)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'DISCLAIMER :',
                                    style: TextStyle(
                                        color: kGrey,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    children: [
                                      TextSpan(
                                          text:
                                              ' The commission rates indicated here are simply estimates based on the gross tuition fees provided by the Institution or posted on their websites. The exact commission rates applicable will be determined based on the actual amount received by MSM Unify pursuant to its agreement with the Institution, after deduction of applicable fees, taxes and other charges, and subject further to the Terms and Conditions of the MSM Unify Agent Agreement, specifically, section 4, subsections (a) through (f), inclusive. For more specific details regarding the commission rate, email info@abcodo.com',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w100,
                                              fontSize: 17)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
            child: SvgPicture.asset(
              'assets/icons/carban.svg',
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              // Get.to(const CommissionDetailScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: (BuildContext),
                      builder: (BuildContext) {
                        return AlertDialog(
                          actions: [
                            GetBuilder<CommissionViewModel>(
                              builder: (controller) {
                                if (controller.apiResponse.status ==
                                    Status.COMPLETE) {
                                  print('STATUS COMPLETED');
                                  List<CommissionResponseModel> response =
                                      controller.apiResponse.data;
                                  return SizedBox(
                                    height: Get.height * 0.70,
                                    width: Get.width,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Flexible(
                                                child: Text(
                                                  'Commission Details',
                                                  style: TextStyle(
                                                    color: kNavy,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    height: Get.height * 0.035,
                                                    width: Get.width * 0.08,
                                                    decoration: BoxDecoration(
                                                      color: kRed,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Institution",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].instName}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Institute Partner Type",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].partnerTypeName}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Country",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].institutionCountryName}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "ESL",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].esl}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Level of Education",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].levelOfEducation}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Programs",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].programs}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Intake",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].intakeName}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Commission",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].commissionType}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Number of semester / course / credit / year",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].noOfSemester}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Maximum amount of commission",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].maximumAmount}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Currency",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].currency}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Container(
                                            height: Get.height * 0.130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Impact base",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff79747E),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${response[0].impactBase}',
                                                    style: const TextStyle(
                                                        color: kRed,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  if (controller.apiResponse.status ==
                                      Status.ERROR) {
                                    return const Center(
                                      child: Text('NO DATA FOUND'),
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: Get.height * 0.028,
                    width: Get.width * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.remove_red_eye_outlined,
                        color: Colors.white, size: 17),
                  ),
                ),
              ],
            ),
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
