import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/document_dropdown_response_model.dart';
import 'package:msm_unify/model/responseModek/student_document_table_response_model.dart';
import 'package:msm_unify/viewModel/document_dropdown_view_model.dart';
import 'package:msm_unify/viewModel/student_document_table_view_model.dart';

import '../../../../model/responseModek/student_view_response_model.dart';
import '../../../common/AppConfig/support_section.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xl;
import 'package:syncfusion_flutter_datagrid_export/export.dart';

class StudentEditDocumentTabScreen extends StatefulWidget {
  final StudentViewResponseModel? data;
  const StudentEditDocumentTabScreen({Key? key, this.data}) : super(key: key);

  @override
  _StudentEditDocumentTabScreenState createState() =>
      _StudentEditDocumentTabScreenState();
}

class _StudentEditDocumentTabScreenState
    extends State<StudentEditDocumentTabScreen> {
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

  final DocumentDropViewModel _documentDropViewModel =
      Get.put(DocumentDropViewModel());

  String? _selectedDocument;
  List<DocumentDropResponseModel> document = [];
  Future<void> getDocument() async {
    await _documentDropViewModel.documentDropViewModel();
    List<DocumentDropResponseModel> response =
        _documentDropViewModel.apiResponse.data;
    response.forEach((element) {
      document.add(element);
    });
  }

  final StudentDocViewModel studentDocViewModel =
      Get.put(StudentDocViewModel());

  Future<void> createExcel() async {
    final xl.Workbook workbook = xl.Workbook();
    final xl.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Attachment');
    sheet.getRangeByName('B1').setText('Remarks');
    sheet.getRangeByName('C1').setText('Date Uploaded');
    sheet.getRangeByName('D1').setText('Upload by');
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
        //Platform.isWindows ? '$path\\Output.xlsx' :
        '$path/Output.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }

  @override
  void initState() {
    studentDocViewModel.studentDocumentViewModel(
        parentId: widget.data!.genInfo!.studentId);
    getDocument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<StudentDocViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.COMPLETE) {
                    List<StudentDocumentResponseModel> response =
                        controller.apiResponse.data;
                    List data = [response.length];
                    print('response>>>${response.length}');

                    return Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SimpleDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: const BorderSide(
                                              color: kColorPrimary)),
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          width: Get.width,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Account Manager Details',
                                                    style: TextStyle(
                                                        color: kNavy,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Flexible(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                        //Get.back();
                                                      },
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.03,
                                                        width: Get.width * 0.08,
                                                        decoration: BoxDecoration(
                                                            color: kRed,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
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
                                              DropdownButtonHideUnderline(
                                                child: DropdownButtonFormField(
                                                    isExpanded: true,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15))),
                                                    validator: (doc) {
                                                      if (doc != null) {
                                                        return "Please Select Document";
                                                      }
                                                    },
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    hint: Text("Documents*"),
                                                    value: _selectedDocument,
                                                    items: document
                                                        .map((documents) {
                                                      return DropdownMenuItem(
                                                          value: documents
                                                              .documentName
                                                              .toString(),
                                                          child: Text(
                                                            documents
                                                                .documentName
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                                    color:
                                                                        kGrey4,
                                                                    fontFamily:
                                                                        "Roboto",
                                                                    fontSize:
                                                                        13),
                                                          ));
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedDocument =
                                                            newValue as String?;
                                                      });
                                                    }),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    height: Get.height * 0.05,
                                                    width: Get.width * 0.30,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Select File',
                                                        style: TextStyle(
                                                          color: kRed,
                                                          fontSize: 15,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const Text(
                                                    'No File Chosen',
                                                    style: TextStyle(
                                                      color: Color(0xff565656),
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ),
                                              Container(
                                                height: Get.height * 0.045,
                                                width: Get.width * 0.25,
                                                decoration: BoxDecoration(
                                                  color: kRed.withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Upload',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: Get.height * 0.04,
                              width: Get.width * 0.40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: kNavy),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: kNavy,
                                  ),
                                  Text(
                                    "Add Document",
                                    style: TextStyle(
                                      color: kNavy,
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
                          SvgPicture.asset('assets/icons/Filter.svg'),
                          InkWell(
                            onTap: () async {
                              final xl.Workbook workbook = xl.Workbook();
                              final xl.Worksheet sheet = workbook.worksheets[0];
                              sheet.getRangeByName('A1').setText('Attachment');
                              sheet.getRangeByName('B1').setText('Remarks');
                              sheet
                                  .getRangeByName('C1')
                                  .setText('Date Uploaded');
                              sheet.getRangeByName('D1').setText('Upload by');

                              // sheet.importList(list, firstRow, firstColumn, isVertical);
                              sheet.tableCollection.toString();
                              print(data[0]);
                              for (var i = 0; i < data[0]; i++) {
                                sheet
                                    .getRangeByIndex(i + 2, 1)
                                    .setValue(response[i].documentName);
                                sheet
                                    .getRangeByIndex(i + 2, 2)
                                    .setValue(response[i].reviewRemark);
                                sheet
                                    .getRangeByIndex(i + 2, 3)
                                    .setValue(response[i].expiryDate);
                                sheet
                                    .getRangeByIndex(i + 2, 4)
                                    .setValue(response[i].uploadBy);
                              }
                              ///////////////////////////////////
                              final List<int> bytes = workbook.saveAsStream();
                              workbook.dispose();

                              // if (kIsWeb) {
                              //   AnchorElement(
                              //       href:
                              //           'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
                              //     ..setAttribute('download', 'Output.xlsx')
                              //     ..click();
                              // } else {
                              final String path =
                                  (await getApplicationSupportDirectory()).path;
                              final String fileName =
                                  // Platform.isWindows
                                  //     ? '$path\\Output.xlsx'
                                  //     :
                                  '$path/Output.xlsx';
                              final File file = File(fileName);
                              await file.writeAsBytes(bytes, flush: true);
                              OpenFile.open(fileName);
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      //   ],
                      // ),

                      PaginatedDataTable(
                        onRowsPerPageChanged: (perPage) {},
                        columnSpacing: 0,
                        rowsPerPage: response.length,
                        availableRowsPerPage: [response.length],
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
                                        'Attachment',
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
                                            'Remarks',
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
                              width: Get.width * 0.53,
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
                                        'Date uploaded',
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
                              width: Get.width * 0.53,
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
                                        'Uploaded by',
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
                                        'Action',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        source: TableRow(context, response),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
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
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.04,
                                                          ),
                                                          const Divider(),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.04,
                                                          ),
                                                          Row(
                                                            children: [
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
                                                                        add.toString()),
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
                                                                      onTap:
                                                                          () {
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
                                                                        size:
                                                                            25,
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
                                                                            color:
                                                                                Colors.red.withOpacity(0.2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Text(add1.toString()),
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
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              const Text('Add Group'),
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
                                                                      onTap:
                                                                          () {
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
                                                                        size:
                                                                            25,
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
                                                                            color:
                                                                                Colors.red.withOpacity(0.2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Text(add1.toString()),
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
                                                                            .withOpacity(0.5),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
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
                      const SizedBox(
                        height: 30,
                      ),
                      supportSection(),
                    ]);
                  } else if (controller.apiResponse.status == Status.ERROR) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('No Data Available'),
                    ));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final List<StudentDocumentResponseModel>? data;
  final BuildContext;
  final _description = TextEditingController();
  String? _docType;
  final List<String> _document = ['English proficiency Score card'];

  TableRow(this.BuildContext, this.data);

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
          child: Center(child: Text('${data![index].documentName}')),
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
          child: Center(child: Text('${data![index].addStamp}')),
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
          child: Center(child: Text('${data![index].uploadBy}')),
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
              StatefulBuilder(
                builder: (context, void Function(void Function()) setState) {
                  return PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: ListTile(
                          onTap: () {
                            showDialog(
                                context: BuildContext,
                                builder: (BuildContext) {
                                  return SimpleDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: const BorderSide(
                                            color: kColorPrimary)),
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        width: Get.width,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Account Manager Details',
                                                  style: TextStyle(
                                                      color: kNavy,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Flexible(
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: Get.height * 0.03,
                                                      width: Get.width * 0.08,
                                                      decoration: BoxDecoration(
                                                          color: kRed,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
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
                                            Container(
                                              height: Get.height * 0.060,
                                              width: Get.width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border:
                                                    Border.all(color: kGrey4),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    hint: const Text(
                                                        "English Proficiency score card"),
                                                    value: _docType,
                                                    items: _document
                                                        .map((document) {
                                                      return DropdownMenuItem(
                                                          value: document,
                                                          child: Text(
                                                            document,
                                                            style:
                                                                const TextStyle(
                                                                    color:
                                                                        kGrey4,
                                                                    fontFamily:
                                                                        "Roboto",
                                                                    fontSize:
                                                                        13),
                                                          ));
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _docType =
                                                            newValue as String?;
                                                      });
                                                    }),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.02,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  height: Get.height * 0.05,
                                                  width: Get.width * 0.30,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Selected File',
                                                      style: TextStyle(
                                                        color: kRed,
                                                        fontSize: 15,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  'No File Chosen',
                                                  style: TextStyle(
                                                    color: Color(0xff565656),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.02,
                                            ),
                                            Container(
                                              height: Get.height * 0.045,
                                              width: Get.width * 0.25,
                                              decoration: BoxDecoration(
                                                color: kRed.withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Upload',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          leading: const Icon(
                            Icons.insert_drive_file,
                            color: Color(0xff00BCD4),
                          ),
                          title: const Text(
                            'Upload',
                            style: TextStyle(
                              color: Color(0xff00BCD4),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
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
                  );
                },
              )
            ],
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
