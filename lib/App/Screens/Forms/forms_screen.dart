import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/form_institution_response_model.dart';
import 'package:msm_unify/model/responseModek/get_forms_detail_response_model.dart';
import 'package:msm_unify/viewModel/form_institution_view_model.dart';
import 'package:msm_unify/viewModel/get_form_details_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xl;
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:open_file/open_file.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

  String? _selectedInstitute;
  List data = [];
  final FormInstitutionViewModel _formInstitutionViewModel =
      Get.put(FormInstitutionViewModel());
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<FormInstitutionResponseModel> institutions = [];
  Future<void> getFormInstitution() async {
    await _formInstitutionViewModel.formInstitutionViewModel();
    List<FormInstitutionResponseModel> response =
        _formInstitutionViewModel.apiResponse.data;
    response.forEach((element) {
      institutions.add(element);
    });
    setState(() {});
    print('Insti==$institutions');
  }

  Future<void> createExcel() async {
    final xl.Workbook workbook = xl.Workbook();
    final xl.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Title');
    sheet.getRangeByName('B1').setText('Institution');
    sheet.getRangeByName('C1').setText('Description');
    // sheet.getRangeByName('D1').setText('Action');
    //sheet.getRangeByName('E1').setText('Logged by');
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

  final TextEditingController _search = TextEditingController();
  @override
  void initState() {
    getFormInstitution();

    super.initState();
  }

  final GetFormDetailsViewModel _getFormDetailsViewModel =
      Get.put(GetFormDetailsViewModel());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: commonDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // buildPreferredSize(context, _key),
              SearchBar(keyGlobal: _key),
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
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
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    Text(
                      'Forms',
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
                child: Container(
                  height: Get.height * 0.070,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kGrey4,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(5),
                        hint: const Text(
                          "Institution",
                        ),
                        value: _selectedInstitute,
                        items: institutions.map((instituions) {
                          return DropdownMenuItem(
                              value: instituions.institutionId.toString(),
                              child: Text(
                                instituions.instName.toString(),
                                style: const TextStyle(
                                    color: kGrey4,
                                    fontFamily: "Roboto",
                                    fontSize: 13),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          _selectedInstitute = newValue as String?;

                          _getFormDetailsViewModel.getFormDetailsViewModel(
                              institutionId:
                                  int.parse(_selectedInstitute.toString()),
                              keyword: '');
                          setState(() {});
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Container(
              //       height: Get.height * 0.070,
              //       width: double.infinity,
              //       padding: const EdgeInsets.symmetric(horizontal: 10),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         border: Border.all(color: kGrey4),
              //       ),
              //       child: TextFormField(
              //         controller: _search,
              //         validator: (search) {
              //           if (search != null) {
              //             return "Please Enter Keyword";
              //           }
              //         },
              //         decoration: InputDecoration(
              //           hintText: "search keyword",
              //           suffixIcon: IconButton(
              //             onPressed: () {
              //               var data = FormInstitutionResponseModel().instName =
              //                   _search.text;
              //               institutions.forEach((element) {
              //                 if (element.instName!.toLowerCase() ==
              //                     _search.text.toLowerCase()) {
              //                   print('true000000');
              //                   _getFormDetailsViewModel
              //                       .getFormDetailsViewModel(
              //                           institutionId: 0,
              //                           keyword: _search.text);
              //                   setState(() {});
              //                 } else {
              //                   print('false000000');
              //                 }
              //               });
              //             },
              //             icon: Icon(Icons.search,
              //                 color: Colors.grey.withOpacity(0.5)),
              //           ),
              //           border: InputBorder.none,
              //           hintStyle: TextStyle(
              //               color: Colors.black.withOpacity(0.2),
              //               fontFamily: 'Roboto'),
              //         ),
              //       )),
              // ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _search,
                  onChanged: (value) {
                    _getFormDetailsViewModel.getFormDetailsViewModel(
                        institutionId: 0, keyword: _search.text);
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      hintText: 'Category Search',
                      suffixIcon: Icon(Icons.search_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kRed)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: kRed),
                      )),
                ),
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    GetBuilder<GetFormDetailsViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          List<GetFormsDetailsResponseModel> response =
                              controller.apiResponse.data;

                          List data = [response.length];
                          print('RESPONSE===${response.length}');
                          return Column(
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
                                    InkWell(
                                      onTap: () async {
                                        final xl.Workbook workbook =
                                            xl.Workbook();
                                        final xl.Worksheet sheet =
                                            workbook.worksheets[0];
                                        sheet
                                            .getRangeByName('A1')
                                            .setText('Title');
                                        sheet
                                            .getRangeByName('B1')
                                            .setText('Institution');
                                        sheet
                                            .getRangeByName('C1')
                                            .setText('Description');
                                        // sheet
                                        //     .getRangeByName('D1')
                                        //     .setText('Add Stamp');
                                        // sheet
                                        //     .getRangeByName('E1')
                                        //     .setText('Logged by');

                                        // sheet.importList(list, firstRow, firstColumn, isVertical);
                                        sheet.tableCollection.toString();
                                        print(data[0]);
                                        for (var i = 0; i < data[0]; i++) {
                                          sheet
                                              .getRangeByIndex(i + 2, 1)
                                              .setValue(response[i].docTitle);
                                          sheet
                                              .getRangeByIndex(i + 2, 2)
                                              .setValue(
                                                  response[i].institutionName);
                                          sheet
                                              .getRangeByIndex(i + 2, 3)
                                              .setValue(
                                                  response[i].docDescription);
                                          // sheet
                                          //     .getRangeByIndex(i + 2, 4)
                                          //     .setValue(
                                          //         response.data![i].addStamp);
                                          // sheet
                                          //     .getRangeByIndex(i + 2, 5)
                                          //     .setValue(
                                          //         response.data![i].loggedBy);
                                        }
///////////////////////////////////
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
                                                    color: Colors.white,
                                                    width: 2)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                    'Title',
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
                                                    ))
                                              ],
                                            ))),
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
                                                InkWell(
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
                                                    ))
                                              ],
                                            ))),
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
                                                ' Description',
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
                                  ],
                                  source: TableRow(response)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                                          height:
                                                              Get.height * 0.80,
                                                          width: Get.width,
                                                          child:
                                                              StatefulBuilder(
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
                                                                              color: Colors.red.withOpacity(0.2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            child:
                                                                                Text(add.toString()),
                                                                          ),
                                                                          itemBuilder: (context) =>
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      PopupMenuButton(
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              const EdgeInsets.all(10),
                                                                          child:
                                                                              Text(
                                                                            "+",
                                                                            style:
                                                                                TextStyle(color: Colors.green.withOpacity(0.5), fontSize: 25),
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
                                                                  _addCondition ==
                                                                          true
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
                                                          right: 5,
                                                          bottom: 5,
                                                          child: Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    const Text(
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
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    const Text(
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
                              ),
                              SizedBox(
                                height: Get.height * 0.025,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Number of items: ${response.length}',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'Poppins'),
                                  ),
                                ],
                              ),
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
  final List<GetFormsDetailsResponseModel> data;

  TableRow(this.data);
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data[index].docTitle}'),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
              border: Border.symmetric(
                  vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)))),
          child: Text('${data[index].institutionName}'),
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
          child: Text('${data[index].docDescription}'),
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
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
