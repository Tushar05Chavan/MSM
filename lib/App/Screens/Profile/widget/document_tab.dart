import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common/AppConfig/support_section.dart';
import '../../../common/color_constant.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final _description = TextEditingController();

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

  String? _docType;
  final List<String> _type = [
    'All',
    'Business Certificate',
    'Business Profile',
    'Business Licence'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
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
                                  'Document Name',
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
                                        child: const Icon(
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
                                    'Remark',
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
                                    'Data Uploaded',
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
                                    'Upload by',
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
                  ),
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
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: kRed)),
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
                                        Text(
                                          'Upload Document',
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
                                              child: Icon(
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
                                    Container(
                                      height: Get.height * 0.055,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: kGrey),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            hint: const Text("Province"),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto',
                                                fontSize: 13),
                                            focusColor: kRed,
                                            value: _docType,
                                            items: _type.map((country) {
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
                                                _docType = newValue as String?;
                                              });
                                            }),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            height: Get.height * 0.035,
                                            width: Get.width * 0.30,
                                            decoration: BoxDecoration(
                                                color: Color(0xff34bf49),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Center(
                                                child: Text(
                                              'Select Document',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 13),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Container(
                                      height: Get.height * 0.2,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kGrey4),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: TextFormField(
                                        controller: _description,
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.2)),
                                            hintText: 'Description',
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.07,
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: Get.height * 0.04,
                                        width: Get.width * 0.25,
                                        decoration: BoxDecoration(
                                            color: kRed,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: const Center(
                                            child: Text(
                                          'Upload',
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
                        height: Get.height * 0.050,
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
                              'Add Document',
                              style: TextStyle(
                                color: kNavy,
                                fontFamily: 'Roboto',
                                fontSize: 16,
                              ),
                            )
                          ],
                        )),
                  ),
                ],
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
  final _description = TextEditingController();
  String? _docType;
  final List<String> _type = [
    'All',
    'Business Certificate',
    'Business Profile',
    'Business Licence'
  ];

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: BuildContext,
                        builder: (context) {
                          return SimpleDialog(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Container(
                                              height: Get.height * 0.06,
                                              width: Get.width * 0.09,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/green_eye.svg',
                                              )),
                                          SizedBox(
                                            width: Get.width * 0.06,
                                          ),
                                          const Text("View")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              shape: ContinuousRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  side: const BorderSide(
                                                      color: kRed)),
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            'Upload Document',
                                                            style: TextStyle(
                                                                color: kNavy,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Flexible(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                height:
                                                                    Get.height *
                                                                        0.03,
                                                                width:
                                                                    Get.width *
                                                                        0.08,
                                                                decoration: BoxDecoration(
                                                                    color: kRed,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 25,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.025,
                                                      ),
                                                      Container(
                                                        height:
                                                            Get.height * 0.055,
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                              color: kGrey),
                                                        ),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              hint: const Text(
                                                                  "Document Type"),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontSize: 13),
                                                              focusColor: kRed,
                                                              value: _docType,
                                                              items: _type.map(
                                                                  (country) {
                                                                return DropdownMenuItem(
                                                                    value:
                                                                        country,
                                                                    child: Text(
                                                                      country,
                                                                      style: const TextStyle(
                                                                          color:
                                                                              kGrey4,
                                                                          fontFamily:
                                                                              "Roboto",
                                                                          fontSize:
                                                                              13),
                                                                    ));
                                                              }).toList(),
                                                              onChanged:
                                                                  (newValue) {
                                                                // setState(() {
                                                                //   _docType = newValue
                                                                //       as String?;
                                                                // });
                                                              }),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.025,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            child: Container(
                                                              height:
                                                                  Get.height *
                                                                      0.035,
                                                              width: Get.width *
                                                                  0.30,
                                                              decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xff34bf49),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child:
                                                                  const Center(
                                                                      child:
                                                                          Text(
                                                                'Select Document',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        13),
                                                              )),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.025,
                                                      ),
                                                      Container(
                                                        height:
                                                            Get.height * 0.2,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: kGrey4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: TextFormField(
                                                            controller:
                                                                _description,
                                                            decoration: InputDecoration(
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.2)),
                                                                hintText:
                                                                    'Agent Questionnaire Form',
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.09,
                                                      ),
                                                      InkWell(
                                                        child: Container(
                                                          height:
                                                              Get.height * 0.04,
                                                          width:
                                                              Get.width * 0.25,
                                                          decoration: BoxDecoration(
                                                              color: kRed,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child: const Center(
                                                              child: Text(
                                                            'Upload',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Roboto',
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
                                      child: Row(
                                        children: [
                                          Container(
                                              height: Get.height * 0.035,
                                              width: Get.width * 0.120,
                                              child: SvgPicture.asset(
                                                'assets/icons/upload_Green.svg',
                                              )),
                                          SizedBox(
                                            width: Get.width * 0.04,
                                          ),
                                          const Text("Upload")
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
                  child: Container(
                    height: Get.height * 0.040,
                    width: Get.width * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.white, size: 25),
                  ),
                )
              ],
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
