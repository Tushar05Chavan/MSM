import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common/AppConfig/support_section.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({Key? key}) : super(key: key);

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

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
                                      Future.delayed(const Duration(seconds: 1),
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
                                              const Duration(seconds: 2), () {
                                            // colorsValue = false;
                                            setState(() {});
                                          });
                                        });
                                      },
                                      child: const Text(
                                        'Status',
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
                                            Future.delayed(Duration(seconds: 1),
                                                () {
                                              // colorsValue = false;
                                              setState(() {});
                                            });
                                          });
                                        },
                                        // onTap: () {},
                                        child: Icon(
                                          Icons.filter_list,
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              ))),
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
                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        // colorsValue = false;
                                        setState(() {});
                                      });
                                    });
                                  },
                                  child: const Text(
                                    'Start date',
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
                                        Future.delayed(Duration(seconds: 1),
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
                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        // colorsValue = false;
                                        setState(() {});
                                      });
                                    });
                                  },
                                  child: const Text(
                                    'End date',
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
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          // colorsValue = false;
                                          setState(() {});
                                        });
                                      });
                                    },
                                    // onTap: () {},
                                    child: Icon(
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
                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        // colorsValue = false;
                                        setState(() {});
                                      });
                                    });
                                  },
                                  child: const Text(
                                    'Description',
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
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          // colorsValue = false;
                                          setState(() {});
                                        });
                                      });
                                    },
                                    // onTap: () {},
                                    child: Icon(
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
                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        // colorsValue = false;
                                        setState(() {});
                                      });
                                    });
                                  },
                                  child: const Text(
                                    'Activity',
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
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          // colorsValue = false;
                                          setState(() {});
                                        });
                                      });
                                    },
                                    // onTap: () {},
                                    child: Icon(
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
                                Future.delayed(const Duration(seconds: 2), () {
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
                    source: TableRow(context),
                  )
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
                                                  Divider(),
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
                                                  SizedBox(
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
                                                  SizedBox(
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
                                                              child: Text(
                                                                  'Contains'),
                                                            ),
                                                          ],
                                                        )
                                                      : SizedBox(),
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
                height: Get.height * 0.10,
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
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.53,
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
          width: Get.width * 0.53,
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
            child: MaterialButton(
              onPressed: () {
                showDialog(
                    context: BuildContext,
                    builder: (context) {
                      return SimpleDialog(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Container(
                                          height: Get.height * 0.05,
                                          width: Get.width * 0.09,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.black,
                                            size: 25,
                                          )),
                                      SizedBox(
                                        width: Get.width * 0.06,
                                      ),
                                      const Text(
                                        "View",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    });
              },
              color: Colors.grey,
              child: const Icon(Icons.keyboard_arrow_down_sharp,
                  color: Colors.white, size: 20),
            )),
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
