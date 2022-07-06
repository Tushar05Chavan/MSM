import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/Screens/ApplicationView/application_view.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/model/responseModek/get_notification_response_model.dart'
    as gn;
import 'package:msm_unify/viewModel/get_notification_view_model.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xl;

import '../../common/color_constant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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

  final GetNotificationViewModel _getNotificationViewModel =
      Get.put(GetNotificationViewModel());

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final key = GlobalKey<PaginatedDataTableState>();

  Future<void> createExcel() async {
    final xl.Workbook workbook = xl.Workbook();
    final xl.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Notification Type');
    sheet.getRangeByName('B1').setText('Agent/Student Name');
    sheet.getRangeByName('C1').setText('Query details');
    sheet.getRangeByName('D1').setText('Add Stamp');
    sheet.getRangeByName('E1').setText('Logged by');
    // sheet.getRangeByIndex(rowIndex, columnIndex)

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    // if (kIsWeb) {
    //   AnchorElement(
    //       href:
    //           'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
    //     ..setAttribute('download', 'Output.xlsx')
    //     ..click();
    // } else {
    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName =
        Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: commonDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildPreferredSize(context, _key),
              SizedBox(
                height: Get.height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    Text(
                      'Notifications',
                      style: TextStyle(
                          color: kNavy,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<GetNotificationViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          gn.GetNotificationResponseModel response =
                              controller.apiResponse.data;

                          List data = [response.data!.length];
                          print("data==$data");
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
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
                                    GestureDetector(
                                      onTap: () async {
                                        final xl.Workbook workbook =
                                            xl.Workbook();
                                        final xl.Worksheet sheet =
                                            workbook.worksheets[0];
                                        sheet
                                            .getRangeByName('A1')
                                            .setText('Notification Type');
                                        sheet
                                            .getRangeByName('B1')
                                            .setText('Agent/Student Name');
                                        sheet
                                            .getRangeByName('C1')
                                            .setText('Query details');
                                        sheet
                                            .getRangeByName('D1')
                                            .setText('Add Stamp');
                                        sheet
                                            .getRangeByName('E1')
                                            .setText('Logged by');

                                        // sheet.importList(list, firstRow, firstColumn, isVertical);
                                        sheet.tableCollection.toString();
                                        sheet.getRangeByIndex(2, 2).setValue(
                                            response.data![0].notificationType);

                                        final List<int> bytes =
                                            workbook.saveAsStream();
                                        workbook.dispose();

                                        // if (kIsWeb) {
                                        //   AnchorElement(
                                        //       href:
                                        //           'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
                                        //     ..setAttribute('download', 'Output.xlsx')
                                        //     ..click();
                                        // } else {
                                        final String path =
                                            (await getApplicationSupportDirectory())
                                                .path;
                                        final String fileName =
                                            Platform.isWindows
                                                ? '$path\\Output.xlsx'
                                                : '$path/Output.xlsx';
                                        final File file = File(fileName);
                                        await file.writeAsBytes(bytes,
                                            flush: true);
                                        OpenFile.open(fileName);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/XLSX.svg',
                                        height: 35,
                                        width: 35,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              PaginatedDataTable(
                                  key: key,
                                  onRowsPerPageChanged: (int? val) {
                                    _rowsPerPage = val!;
                                    setState(() {});
                                  },
                                  rowsPerPage: _rowsPerPage,
                                  columnSpacing: 0,
                                  availableRowsPerPage: const [
                                    5,
                                    10,
                                    25,
                                    50,
                                    100
                                  ],
                                  dataRowHeight: Get.height * 0.08,
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
                                                'Notification Type',
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
                                                        Duration(seconds: 1),
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
                                            width: Get.width * 0.43,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF5F5F5),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        // colorsValue = true;
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 2),
                                                            () {
                                                          // colorsValue = false;
                                                          setState(() {});
                                                        });
                                                      });
                                                    },
                                                    child: const Text(
                                                      'Agent/ Student Name',
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
                                                Flexible(
                                                  child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          // colorsValue = true;
                                                          Future.delayed(
                                                              Duration(
                                                                  seconds: 1),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.53,
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
                                                'Query details',
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
                                                        Duration(seconds: 1),
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
                                                      const Duration(
                                                          seconds: 2), () {
                                                    // colorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: const Text(
                                                'Add stamp',
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
                                                        Duration(seconds: 1),
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
                                                      const Duration(
                                                          seconds: 2), () {
                                                    // colorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: const Text(
                                                'Logged by',
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
                                                        Duration(seconds: 1),
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
                                  ],
                                  source: TableRow(context, response)),
                              Container(
                                height: Get.height * 0.08,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.2)),
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
                                                        height:
                                                            Get.height * 0.80,
                                                        width: Get.width,
                                                        child: StatefulBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              void Function(
                                                                      void
                                                                          Function())
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
                                                                      fontSize:
                                                                          22,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      Get.height *
                                                                          0.04,
                                                                ),
                                                                const Divider(),
                                                                SizedBox(
                                                                  height:
                                                                      Get.height *
                                                                          0.04,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    PopupMenuButton(
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              const EdgeInsets.all(10),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.red.withOpacity(0.2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Text(add.toString()),
                                                                        ),
                                                                        itemBuilder:
                                                                            (context) =>
                                                                                [
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
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            const EdgeInsets.all(10),
                                                                        child:
                                                                            Text(
                                                                          "+",
                                                                          style: TextStyle(
                                                                              color: Colors.green.withOpacity(0.5),
                                                                              fontSize: 25),
                                                                        ),
                                                                      ),
                                                                      itemBuilder:
                                                                          (context) =>
                                                                              [
                                                                        PopupMenuItem(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              _addCondition = true;
                                                                            });
                                                                          },
                                                                          child:
                                                                              const Text('Add Condition'),
                                                                        ),
                                                                        PopupMenuItem(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              _addGroup = true;
                                                                            });
                                                                          },
                                                                          child:
                                                                              const Text('Add Group'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                _addGroup ==
                                                                        true
                                                                    ? Row(
                                                                        children: [
                                                                          const SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                _addGroup = false;
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.close,
                                                                              color: Colors.red,
                                                                              size: 25,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
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
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          PopupMenuButton(
                                                                            child:
                                                                                Container(
                                                                              padding: const EdgeInsets.all(10),
                                                                              child: Text(
                                                                                "+",
                                                                                style: TextStyle(color: Colors.green.withOpacity(0.5), fontSize: 25),
                                                                              ),
                                                                            ),
                                                                            itemBuilder: (context) =>
                                                                                [
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
                                                                _addCondition ==
                                                                        true
                                                                    ? Row(
                                                                        children: [
                                                                          const SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                _addCondition = false;
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.close,
                                                                              color: Colors.red,
                                                                              size: 25,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
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
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                                const EdgeInsets.all(10),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.green.withOpacity(0.5),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            child:
                                                                                const Text('Contains'),
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
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        16),
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
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        16),
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
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Number of items:${response.data!.length}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'Poppins'),
                              )
                            ],
                          );
                        } else {
                          if (controller.apiResponse.status == Status.ERROR) {
                            return const Center(
                              child: Text('Somthing went Wrong'),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
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
    );
  }
}

class TableRow extends DataTableSource {
  final BuildContext;
  final gn.GetNotificationResponseModel data;

  TableRow(this.BuildContext, this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        InkWell(
          onTap: () {
            // Get.to(() => ApplicationViewScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '${data.data![index].notificationType}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
                //textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            // Get.to(() => const ApplicationViewScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '${data.data![index].agentStudentName}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
                //textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      DataCell(
        onTap: () {},
        InkWell(
          onTap: () {
            showDialog(
              context: BuildContext,
              builder: (context) {
                return SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.red)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Row(children: [
                            const Text(
                              'Query Detail',
                              style: TextStyle(
                                  color: kNavy,
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: Get.height * 0.03,
                                width: Get.width * 0.06,
                                decoration: BoxDecoration(
                                    color: kRed,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: kGrey4)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Html(
                                    data: '${data.data![index].queryDetails}',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
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
            height: Get.height * 0.17,
            width: Get.width * 0.53,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Html(
                data: '${data.data![index].queryDetails}',),
                //textAlign: TextAlign.center,
                // style:  const TextStyle(
                //   fontFamily: 'Roboto',
                //   color: Colors.grey,
                // ),
                // overflow: TextOverflow.ellipsis,
                // maxLines: 1,
              ),
            ),
          ),
        ),
      
      DataCell(
        InkWell(
          onTap: () {
            // Get.to(() => ApplicationViewScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '${data.data![index].addStamp}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
                //textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            // Get.to(() => ApplicationViewScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Akansha',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
                //textAlign: TextAlign.center,
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
  int get rowCount => data.data!.length;

  @override
  int get selectedRowCount => 0;
  
}
