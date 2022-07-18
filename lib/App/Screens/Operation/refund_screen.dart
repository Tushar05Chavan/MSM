import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/refund_document_response_model.dart';
import 'package:msm_unify/model/responseModek/refund_response_model.dart';
import 'package:msm_unify/viewModel/refund_document_view_model.dart';
import 'package:msm_unify/viewModel/refund_view_model.dart';

import '../../../Api/api_response.dart';

class RefundScreen extends StatefulWidget {
  const RefundScreen({Key? key}) : super(key: key);

  @override
  State<RefundScreen> createState() => _RefundScreenState();
}

class _RefundScreenState extends State<RefundScreen> {
  String? _selectedCountry;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];

  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  String? _selectedStudent;
  final List<String> _student = [
    'All',
    'Recently Modified',
    'Last 10 modified'
  ];

  final RefundViewModel _refundViewModel = Get.put(RefundViewModel());

  final GlobalKey<ScaffoldState> _key = GlobalKey();

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
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Refund',
                          style: TextStyle(
                              color: kNavy,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Container(
                      height: Get.height * 0.070,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kGrey4),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            borderRadius: BorderRadius.circular(5),
                            hint: const Text(
                              "All",
                            ),
                            value: _selectedStudent,
                            items: _student.map((student) {
                              return DropdownMenuItem(
                                  value: student,
                                  child: Text(
                                    student,
                                    style: const TextStyle(
                                        color: kGrey4,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedStudent = newValue as String?;
                              });
                            }),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Container(
                        height: Get.height * 0.070,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kGrey4),
                        ),
                        child: TextFormField(
                          validator: (search) {
                            if (search != null) {
                              return "Please Enter Keyword";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "search keyword",
                            suffixIcon: Icon(Icons.search,
                                color: Colors.grey.withOpacity(0.5)),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.2),
                                fontFamily: 'Roboto'),
                          ),
                        )),
                    SizedBox(
                      height: Get.height * 0.025,
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
                        SvgPicture.asset(
                          'assets/icons/XLSX.svg',
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    GetBuilder<RefundViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          List<RefundResponseModel> resp =
                              controller.apiResponse.data;
                          return PaginatedDataTable(
                              onRowsPerPageChanged: (perPage) {},
                              columnSpacing: 0,
                              rowsPerPage: resp.length,
                              availableRowsPerPage: [resp.length],
                              dataRowHeight: Get.height * 0.05,
                              headingRowHeight: Get.height * 0.08,
                              horizontalMargin: 1,
                              columns: [
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
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
                                                        const Duration(
                                                            seconds: 2), () {
                                                      // colorsValue = false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: const Text(
                                                  'Application ID',
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
                                                  )),
                                            )
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
                                                'First Name',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false,
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
                                            'Program',
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
                                            'Status',
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
                                                'Action',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))),
                              ],
                              source:
                                  TableRow(data: resp, BuildContext: context));
                        } else if (controller.apiResponse.status ==
                            Status.ERROR) {
                          const CircularProgressIndicator();
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
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
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;
  final BuildContext;
  final List<RefundResponseModel>? data;
  String? _selectedDocument;
  final List<String> document = ['Refund Wire Date', 'Refusal Letter'];

  TableRow({this.BuildContext, this.data});
  final RefundDocumentViewModel _refundDocumentViewModel =
      Get.put(RefundDocumentViewModel());

  @override
  DataRow? getRow(int index) {
    _refundDocumentViewModel.refundDocumentViewModel(
        applicationId: data![index].applicationId);
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
          child: Text('${data![index].applicationId}'),
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
          child: Text('${data![index].firstName}'),
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
          child: Text('${data![index].programName}'),
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
          child: Text('${data![index].instName}'),
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
          child: Text('${data![index].statusName}'),
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
          child: Center(
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    onTap: () {},
                    child: const ListTile(
                      leading: Icon(Icons.currency_rupee),
                      title: Text('Applied for refund'),
                    )),
                PopupMenuItem(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: BuildContext,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(color: Colors.red)),
                                content: Container(
                                  width: Get.width,
                                  child: SingleChildScrollView(
                                    child: StatefulBuilder(
                                      builder: (context,
                                          void Function(void Function())
                                              setState) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Refund Documents',
                                                  style: TextStyle(
                                                      color: kNavy,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return SimpleDialog(
                                                          shape: ContinuousRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              side:
                                                                  const BorderSide(
                                                                      color:
                                                                          kRed)),
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      const Text(
                                                                        'Upload Documents',
                                                                        style: TextStyle(
                                                                            color:
                                                                                kNavy,
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              Get.height * 0.04,
                                                                          width:
                                                                              Get.width * 0.08,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                kRed,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              const Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Container(
                                                                    height: Get
                                                                            .height *
                                                                        0.070,
                                                                    width: double
                                                                        .infinity,
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border: Border.all(
                                                                          color:
                                                                              kGrey4),
                                                                    ),
                                                                    child:
                                                                        DropdownButtonHideUnderline(
                                                                      child: DropdownButton(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          hint: const Text(
                                                                            "All",
                                                                          ),
                                                                          value: _selectedDocument,
                                                                          items: document.map((document) {
                                                                            return DropdownMenuItem(
                                                                                value: document,
                                                                                child: Text(
                                                                                  document,
                                                                                  style: const TextStyle(color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                                                                                ));
                                                                          }).toList(),
                                                                          onChanged: (newValue) {
                                                                            setState(() {
                                                                              _selectedDocument = newValue as String?;
                                                                            });
                                                                          }),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Row(
                                                                    children: const [
                                                                      Text(
                                                                        'Select File',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                kGrey),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                          'assets/icons/Upload Folder.svg',
                                                                          width:
                                                                              25,
                                                                          height:
                                                                              25),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.09,
                                                                  ),
                                                                  MaterialButton(
                                                                    onPressed:
                                                                        () {},
                                                                    height: Get
                                                                            .height *
                                                                        0.055,
                                                                    minWidth:
                                                                        Get.width *
                                                                            0.25,
                                                                    color: Colors
                                                                        .red,
                                                                    shape: ContinuousRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    child:
                                                                        const Text(
                                                                      'Upload',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
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
                                                  child: Container(
                                                    width: Get.width * 0.30,
                                                    height: Get.height * 0.045,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: kNavy),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                      '+ Add document',
                                                      style: TextStyle(
                                                          color: kNavy,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12),
                                                    )),
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
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                            GetBuilder<RefundDocumentViewModel>(
                                              builder: (controller) {
                                                if (controller
                                                        .apiResponse.status ==
                                                    Status.COMPLETE) {
                                                  List<RefundDocumentResponseModel>
                                                      response = controller
                                                          .apiResponse.data;
                                                  print('RESPONSE>>>$response');
                                                  return PaginatedDataTable(
                                                      onRowsPerPageChanged:
                                                          (perPage) {},
                                                      columnSpacing: 0,
                                                      rowsPerPage:
                                                          response.length,
                                                      availableRowsPerPage: [
                                                        response.length
                                                      ],
                                                      dataRowHeight:
                                                          Get.height * 0.05,
                                                      headingRowHeight:
                                                          Get.height * 0.08,
                                                      horizontalMargin: 1,
                                                      columns: [
                                                        DataColumn(
                                                          label: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                            height: Get.height *
                                                                0.10,
                                                            width: Get.width *
                                                                0.43,
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0xffF5F5F5),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2)),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        // colorsValue = true;
                                                                        Future.delayed(
                                                                            const Duration(seconds: 2),
                                                                            () {
                                                                          // colorsValue = false;
                                                                          setState(
                                                                              () {});
                                                                        });
                                                                      });
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Attachment',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child: InkWell(
                                                                      onTap: () {
                                                                        setState(
                                                                            () {
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
                                                                        Icons
                                                                            .filter_list,
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn(
                                                          label: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                            height: Get.height *
                                                                0.10,
                                                            width: Get.width *
                                                                0.430,
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0xffF5F5F5),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2)),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      // colorsValue = true;
                                                                      Future.delayed(
                                                                          const Duration(
                                                                              seconds: 2),
                                                                          () {
                                                                        // colorsValue = false;
                                                                        setState(
                                                                            () {});
                                                                      });
                                                                    });
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'Upload by',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    softWrap:
                                                                        false,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        // colorsValue = true;
                                                                        Future.delayed(
                                                                            const Duration(seconds: 1),
                                                                            () {
                                                                          // colorsValue = false;
                                                                          setState(
                                                                              () {});
                                                                        });
                                                                      });
                                                                    },
                                                                    // onTap: () {},
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .filter_list,
                                                                      color: Colors
                                                                          .black,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn(
                                                          label: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                            height: Get.height *
                                                                0.10,
                                                            width: Get.width *
                                                                0.33,
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0xffF5F5F5),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2)),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      // colorsValue = true;
                                                                      Future.delayed(
                                                                          const Duration(
                                                                              seconds: 2),
                                                                          () {
                                                                        // colorsValue = false;
                                                                        setState(
                                                                            () {});
                                                                      });
                                                                    });
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'Date Uploaded',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        // colorsValue = true;
                                                                        Future.delayed(
                                                                            const Duration(seconds: 1),
                                                                            () {
                                                                          // colorsValue = false;
                                                                          setState(
                                                                              () {});
                                                                        });
                                                                      });
                                                                    },
                                                                    // onTap: () {},
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .filter_list,
                                                                      color: Colors
                                                                          .black,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn(
                                                          label: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                            height: Get.height *
                                                                0.10,
                                                            width: Get.width *
                                                                0.33,
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0xffF5F5F5),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2)),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      // colorsValue = true;
                                                                      Future.delayed(
                                                                          const Duration(
                                                                              seconds: 2),
                                                                          () {
                                                                        // colorsValue = false;
                                                                        setState(
                                                                            () {});
                                                                      });
                                                                    });
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'Action',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      source: TableRow1(
                                                          data: response));
                                                } else if (controller
                                                        .apiResponse.status ==
                                                    Status.ERROR) {
                                                  return const CircularProgressIndicator();
                                                }
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              child: Container(
                                                height: Get.height * 0.08,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.2)),
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
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                actions: [
                                                                  Stack(
                                                                    children: [
                                                                      SizedBox(
                                                                        height: Get.height *
                                                                            0.80,
                                                                        width: Get
                                                                            .width,
                                                                        child:
                                                                            StatefulBuilder(
                                                                          builder:
                                                                              (context, void Function(void Function()) setState) {
                                                                            return Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                const Text(
                                                                                  'Filter Builder',
                                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 22, color: Colors.black),
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
                                                                                          padding: const EdgeInsets.all(10),
                                                                                          decoration: BoxDecoration(
                                                                                            color: Colors.red.withOpacity(0.2),
                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                          ),
                                                                                          child: Text(add.toString()),
                                                                                        ),
                                                                                        itemBuilder: (context) => [
                                                                                              PopupMenuItem(
                                                                                                onTap: () {
                                                                                                  setState(() {
                                                                                                    add = 'Not And';
                                                                                                  });
                                                                                                },
                                                                                                child: const Text('Not And'),
                                                                                              ),
                                                                                              PopupMenuItem(
                                                                                                onTap: () {
                                                                                                  setState(() {
                                                                                                    add = 'or';
                                                                                                  });
                                                                                                },
                                                                                                child: const Text('or'),
                                                                                              ),
                                                                                              PopupMenuItem(
                                                                                                onTap: () {
                                                                                                  setState(() {
                                                                                                    add = 'Not or';
                                                                                                  });
                                                                                                },
                                                                                                child: const Text('Not or'),
                                                                                              ),
                                                                                              PopupMenuItem(
                                                                                                onTap: () {
                                                                                                  setState(() {
                                                                                                    add = 'And';
                                                                                                  });
                                                                                                },
                                                                                                child: const Text('And'),
                                                                                              ),
                                                                                            ]),
                                                                                    const SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    PopupMenuButton(
                                                                                      child: Container(
                                                                                        padding: const EdgeInsets.all(10),
                                                                                        child: Text(
                                                                                          "+",
                                                                                          style: TextStyle(color: Colors.green.withOpacity(0.5), fontSize: 25),
                                                                                        ),
                                                                                      ),
                                                                                      itemBuilder: (context) => [
                                                                                        PopupMenuItem(
                                                                                          onTap: () {
                                                                                            setState(() {
                                                                                              _addCondition = true;
                                                                                            });
                                                                                          },
                                                                                          child: const Text('Add Condition'),
                                                                                        ),
                                                                                        PopupMenuItem(
                                                                                          onTap: () {
                                                                                            setState(() {
                                                                                              _addGroup = true;
                                                                                            });
                                                                                          },
                                                                                          child: const Text('Add Group'),
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
                                                                                                _addGroup = false;
                                                                                              });
                                                                                            },
                                                                                            child: const Icon(
                                                                                              Icons.close,
                                                                                              color: Colors.red,
                                                                                              size: 25,
                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            width: 10,
                                                                                          ),
                                                                                          PopupMenuButton(
                                                                                              child: Container(
                                                                                                padding: const EdgeInsets.all(10),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Colors.red.withOpacity(0.2),
                                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                                ),
                                                                                                child: Text(add1.toString()),
                                                                                              ),
                                                                                              itemBuilder: (context) => [
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
                                                                                            child: Container(
                                                                                              padding: const EdgeInsets.all(10),
                                                                                              child: Text(
                                                                                                "+",
                                                                                                style: TextStyle(color: Colors.green.withOpacity(0.5), fontSize: 25),
                                                                                              ),
                                                                                            ),
                                                                                            itemBuilder: (context) => [
                                                                                              PopupMenuItem(
                                                                                                onTap: () {
                                                                                                  setState(() {
                                                                                                    _addCondition = true;
                                                                                                  });
                                                                                                },
                                                                                                child: const Text('Add Condition'),
                                                                                              ),
                                                                                              PopupMenuItem(
                                                                                                onTap: () {
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: const Text('Add Group'),
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
                                                                                                _addCondition = false;
                                                                                              });
                                                                                            },
                                                                                            child: const Icon(
                                                                                              Icons.close,
                                                                                              color: Colors.red,
                                                                                              size: 25,
                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            width: 10,
                                                                                          ),
                                                                                          PopupMenuButton(
                                                                                              child: Container(
                                                                                                padding: const EdgeInsets.all(10),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Colors.red.withOpacity(0.2),
                                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                                ),
                                                                                                child: Text(add1.toString()),
                                                                                              ),
                                                                                              itemBuilder: (context) => [
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
                                                                                            padding: const EdgeInsets.all(10),
                                                                                            decoration: BoxDecoration(
                                                                                              color: Colors.green.withOpacity(0.5),
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                            ),
                                                                                            child: const Text('Contains'),
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
                                                                        right:
                                                                            5,
                                                                        bottom:
                                                                            5,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                Get.back();
                                                                              },
                                                                              child: const Text(
                                                                                'OK',
                                                                                style: TextStyle(color: Colors.red, fontSize: 16),
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
                                                                                style: TextStyle(color: Colors.red, fontSize: 16),
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
                                                          color:
                                                              Color(0xffe8252a),
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
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: const ListTile(
                        leading: Icon(Icons.remove_red_eye),
                        title: Text('View refund documents'),
                      ),
                    )),
              ],
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                )),
              ),
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

class TableRow1 extends DataTableSource {
  final List<RefundDocumentResponseModel>? data;
  String? _selectedDocument;
  final List<String> document = ['Refund form'];

  TableRow1({this.data});

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
          child: Text('${data![index].documentName}'),
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
          child: Text('${data![index].uploadBy}'),
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
          child: Text('${data![index].addStamp}'),
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
          child: Center(
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    onTap: () {},
                    child: ListTile(
                      leading: SvgPicture.asset('assets/icons/green_eye.svg'),
                      title: const Text('View document'),
                    )),
                PopupMenuItem(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: kRed)),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Upload Documents',
                                            style: TextStyle(
                                                color: kNavy,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600),
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
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: Get.height * 0.070,
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(color: kGrey4),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              hint: const Text(
                                                "Refund form",
                                              ),
                                              value: _selectedDocument,
                                              items: document.map((document) {
                                                return DropdownMenuItem(
                                                    value: document,
                                                    child: Text(
                                                      document,
                                                      style: const TextStyle(
                                                          color: kGrey4,
                                                          fontFamily: "Roboto",
                                                          fontSize: 13),
                                                    ));
                                              }).toList(),
                                              onChanged: (newValue) {
                                                _selectedDocument =
                                                    newValue as String?;
                                              }),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Select File',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                color: kGrey),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/Upload Folder.svg',
                                              width: 25,
                                              height: 25),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.09,
                                      ),
                                      MaterialButton(
                                        onPressed: () {},
                                        height: Get.height * 0.055,
                                        minWidth: Get.width * 0.25,
                                        color: Colors.red,
                                        shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Text(
                                          'Update',
                                          style: TextStyle(color: Colors.white),
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
                      child: ListTile(
                        leading: SvgPicture.asset('assets/icons/Upload.svg'),
                        title: const Text('Upload document'),
                      ),
                    )),
                PopupMenuItem(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: kRed)),
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                        ' Are you sure, want to delete this record?',
                                        style: TextStyle(
                                            color: kGrey,
                                            fontFamily: 'Poppins',
                                            fontSize: 12)),
                                    SizedBox(
                                      height: Get.height * 0.09,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          height: Get.height * 0.06,
                                          minWidth: Get.width * 0.20,
                                          color: Colors.green,
                                          shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Text(
                                            'No',
                                            style:
                                                TextStyle(color: Colors.white),
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
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Text(
                                            'Yes',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: ListTile(
                        leading: SvgPicture.asset('assets/icons/close_red.svg'),
                        title: const Text('Delete document'),
                      ),
                    )),
              ],
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ),
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
