import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/profile_reference_response_model.dart';
import 'package:msm_unify/viewModel/profile_refernce_view_model.dart';
import 'package:msm_unify/viewModel/reference_onclick_view_model.dart';

import '../../../../model/responseModek/reference_onclick_response_model.dart';

class ReferenceTabScreen extends StatefulWidget {
  const ReferenceTabScreen({Key? key}) : super(key: key);

  @override
  _ReferenceTabScreenState createState() => _ReferenceTabScreenState();
}

class _ReferenceTabScreenState extends State<ReferenceTabScreen> {
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;
  String? selectedResponse;
  final List<String> _response = ['positive', 'Negative'];

  final ProfileReferenceViewModel _profileReferenceViewModel =
      Get.put(ProfileReferenceViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.030,
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
            GetBuilder<ProfileReferenceViewModel>(
              builder: (controller) {
                if (controller.apiResponse.status == Status.COMPLETE) {
                  List<ReferenceResponseModel> response =
                      controller.apiResponse.data;
                  print('RESPONSE>>>>>$response');
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
                            width: Get.width * 0.33,
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
                                    'Name',
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
                            width: Get.width * 0.430,
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
                                    'Position',
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
                            width: Get.width * 0.40,
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
                                      'institution',
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
                                        'Email ID',
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
                                ))),
                        DataColumn(
                            label: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                              const Duration(seconds: 2), () {
                                            // colorsValue = false;
                                            setState(() {});
                                          });
                                        });
                                      },
                                      child: const Text(
                                        'Response',
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
                                ))),
                        DataColumn(
                            label: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                ))),
                        DataColumn(
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: Get.height * 0.10,
                            width: Get.width * 0.80,
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
                                    'Remarks',
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
                                width: Get.width * 0.20,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF5F5F5),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        'Verified',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                        DataColumn(
                            label: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                height: Get.height * 0.10,
                                width: Get.width * 0.33,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF5F5F5),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        'Action',
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
                                ))),
                      ],
                      source: TableRow(BuildContext: context, data: response));
                } else if (controller.apiResponse.status == Status.ERROR) {
                  return const CircularProgressIndicator();
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
                                                                    onTap: () {
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
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        add =
                                                                            'or';
                                                                      });
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            'or'),
                                                                  ),
                                                                  PopupMenuItem(
                                                                    onTap: () {
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
                                                                    onTap: () {
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
                                                      itemBuilder: (context) =>
                                                          [
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
                                                              _addGroup = true;
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
                                                              color: Colors.red,
                                                              size: 25,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
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
                                                                child: Text(add1
                                                                    .toString()),
                                                              ),
                                                              itemBuilder:
                                                                  (context) => [
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
                                                              color: Colors.red,
                                                              size: 25,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
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
                                                                child: Text(add1
                                                                    .toString()),
                                                              ),
                                                              itemBuilder:
                                                                  (context) => [
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
              height: Get.height * 0.025,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xffe8252a)),
                              borderRadius: BorderRadius.circular(10)),
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: Get.height * 0.60,
                              width: Get.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Reference',
                                          style: TextStyle(
                                              color: kNavy,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: Get.height * 0.035,
                                            width: Get.width * 0.08,
                                            decoration: BoxDecoration(
                                                color: kRed,
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      ' Please submit the reference of "Educational Institution" where you have worked previously. ',
                                      style: TextStyle(
                                        color: Color(0xff858796),
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    commontextfiled(
                                      hintText: 'Name *',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    commontextfiled(
                                      hintText: 'Position *',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    commontextfiled(
                                      hintText: 'Institution *',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    commontextfiled(
                                      hintText: 'Phone number *',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    commontextfiled(
                                      hintText: 'Email ID *',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            labelText:
                                                'Partner Type (Auto fetched)',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          hint: const Text("GMO and MSM Unify"),
                                          value: selectedResponse,
                                          items: _response.map((response) {
                                            return DropdownMenuItem(
                                                value: response,
                                                child: Text(
                                                  response,
                                                  style: const TextStyle(
                                                      color: kGrey4,
                                                      fontFamily: "Roboto",
                                                      fontSize: 13),
                                                ));
                                          }).toList(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedResponse =
                                                  newValue as String?;
                                            });
                                          }),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                          hintText: 'Address',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                          hintText: 'Remarks',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: Get.height * 0.04,
                                      width: Get.width * 0.25,
                                      decoration: BoxDecoration(
                                        color: kRed,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Add Reference',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: Get.height * 0.04,
                  width: Get.width * 0.35,
                  decoration: BoxDecoration(
                      border: Border.all(color: kNavy),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.add,
                        color: kNavy,
                      ),
                      Text(
                        'Add Reference',
                        style: TextStyle(
                            fontSize: 11, fontFamily: 'Poppins', color: kNavy),
                      )
                    ],
                  ),
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
    );
  }
}

class TableRow extends DataTableSource {
  final BuildContext;
  final List<ReferenceResponseModel>? data;
  final ReferOnclickResponseModel? onclickData;
  String? selectedResponse;
  final List<String> _response = ['positive', 'Negative'];
  final TextEditingController _name = TextEditingController();
  final TextEditingController _position = TextEditingController();
  final TextEditingController _institution = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _emailId = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _remark = TextEditingController();

  final ReferenceOnclickViewModel _referenceOnclickViewModel =
      Get.put(ReferenceOnclickViewModel());

  TableRow({
    required this.data,
    this.BuildContext,
    this.onclickData,
  });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        onTap: () {
          showDialog(
              context: BuildContext,
              builder: (context) {
                return SimpleDialog(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xffe8252a)),
                      borderRadius: BorderRadius.circular(10)),
                  children: [
                    GetBuilder<ReferenceOnclickViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          ReferOnclickResponseModel resp =
                              controller.apiResponse.data;
                          print('REFERENCE ONCLICK---$resp');
                          _name.text = resp.name.toString();
                          return Container(
                            padding: const EdgeInsets.all(10),
                            height: Get.height * 0.60,
                            width: Get.width,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Reference',
                                        style: TextStyle(
                                            color: kNavy,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          height: Get.height * 0.035,
                                          width: Get.width * 0.08,
                                          decoration: BoxDecoration(
                                              color: kRed,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    ' Please submit the reference of "Educational Institution" where you have worked previously. ',
                                    style: TextStyle(
                                      color: Color(0xff858796),
                                      fontFamily: 'Nunito',
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  commontextfiled(
                                    controller: _name,
                                    hintText: 'Name *',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  commontextfiled(
                                    controller: _position,
                                    hintText: 'Position *',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  commontextfiled(
                                    controller: _institution,
                                    hintText: 'Institution *',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  commontextfiled(
                                    controller: _phoneNo,
                                    hintText: 'Phone number *',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  commontextfiled(
                                      controller: _emailId,
                                      labelText: const Text('Email ID *')),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Response',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                        hint: Text("${resp.refResponse}"),
                                        value: selectedResponse,
                                        items: _response.map((response) {
                                          return DropdownMenuItem(
                                              value: response,
                                              child: Text(
                                                response,
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          selectedResponse =
                                              newValue as String?;
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                        hintText: 'Address',
                                        labelText: 'Address',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                        hintText: 'Remarks',
                                        labelText: 'Remarks',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: Get.height * 0.04,
                                      width: Get.width * 0.25,
                                      decoration: BoxDecoration(
                                        color: kRed,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Update Reference',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                  ],
                );
              });
        },
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].name}'),
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
          child: Text('${data![index].designation}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.40,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].institution}'),
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
          child: Text('${data![index].email}'),
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
          child: Text('${data![index].refResponse}'),
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
          child: Text('${data![index].phoneNo}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.80,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].remark}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.20,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].isVerified}'),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  showDialog(
                      context: BuildContext,
                      builder: (BuildContext) {
                        return SimpleDialog(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xffe8252a)),
                              borderRadius: BorderRadius.circular(10)),
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
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
