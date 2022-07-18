import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart' as rr;
import 'package:msm_unify/App/Screens/AddStudent/new_student_screen.dart';
import 'package:msm_unify/App/Screens/StudentEdit/student_edit_screen.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/student_list_response_model.dart';
import 'package:msm_unify/viewModel/delete_student_view_model.dart';
import 'package:msm_unify/viewModel/student_list_view_model.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xl;
import 'package:syncfusion_flutter_datagrid_export/export.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final StudentDeleteViewModel _studentDeleteViewModel =
      Get.put(StudentDeleteViewModel());

  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;
  String? _selectedStudent;
  final List<String> _student = [
    'All',
    'Recently Modified',
    'Last 10 modified'
  ];
  final StudentListViewModel _studentListViewModel =
      Get.put(StudentListViewModel());
  final TextEditingController _search = TextEditingController();
  @override
  void initState() {
    _studentListViewModel.studentListViewModel();
    super.initState();
  }

  void showInSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        backgroundColor: kGreen,
        content: Text(
          'Update Successfully',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  void showInErrorSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        backgroundColor: kRed,
        content: Text(
          'Update Successfully',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  Future<void> createExcel() async {
    final xl.Workbook workbook = xl.Workbook();
    final xl.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Student ID');

    sheet.getRangeByName('B1').setText('Status');
    sheet.getRangeByName('C1').setText('Applications');
    sheet.getRangeByName('D1').setText('Citizenships');
    sheet.getRangeByName('E1').setText('First Name');
    sheet.getRangeByName('F1').setText('Last Name');
    sheet.getRangeByName('G1').setText('Contact Number');
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            'Student List Views',
                            style: TextStyle(
                                color: kNavy,
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => NewStudentScreen());
                            },
                            child: Container(
                                height: Get.height * 0.050,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(
                                      color: kNavy, style: BorderStyle.solid),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'Add New Student Profile',
                                      style: TextStyle(
                                        color: kNavy,
                                        fontFamily: 'Roboto',
                                        fontSize: 11,
                                      ),
                                    )
                                  ],
                                )),
                          ),
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
                          controller: _search,
                          onChanged: (value) {
                            _studentListViewModel.studentListViewModel(
                                keyword: _search.text);
                          },
                          decoration: InputDecoration(
                            hintText: "search keyword",
                            suffixIcon: Icon(Icons.search,
                                color: Colors.grey.withOpacity(0.5)),
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.5)),
                          ),
                        )),

                    //       Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child: TextFormField(
                    //     controller: _search,
                    //     onChanged: (value) {
                    //       _studentListViewModel.studentListViewModel(
                    //           keyword: _search.text);
                    //     },
                    //     decoration: InputDecoration(
                    //         hintStyle: TextStyle(
                    //           color: Colors.black.withOpacity(0.2),
                    //         ),
                    //         hintText: 'Category Search',
                    //         suffixIcon: Icon(Icons.search_outlined),
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(15),
                    //             borderSide: BorderSide(color: kRed)),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(15),
                    //           borderSide: BorderSide(color: kRed),
                    //         )),
                    //   ),
                    // ),

                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    GetBuilder<StudentListViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status ==
                            rr.Status.COMPLETE) {
                          StudentListResponseModel resp =
                              controller.apiResponse.data;
                          List data = [resp.data!.length];
                          print('RESPONSE===${resp.data!.length}');
                          return Column(
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
                                  InkWell(
                                    onTap: () async {
                                      final xl.Workbook workbook =
                                          xl.Workbook();
                                      final xl.Worksheet sheet =
                                          workbook.worksheets[0];
                                      sheet
                                          .getRangeByName('A1')
                                          .setText('Student ID');

                                      sheet
                                          .getRangeByName('B1')
                                          .setText('Status');
                                      sheet
                                          .getRangeByName('C1')
                                          .setText('Applications');
                                      sheet
                                          .getRangeByName('D1')
                                          .setText('Citizenships');
                                      sheet
                                          .getRangeByName('E1')
                                          .setText('First Name');
                                      sheet
                                          .getRangeByName('F1')
                                          .setText('Last Name');
                                      sheet
                                          .getRangeByName('G1')
                                          .setText('Contact Number');

                                      // sheet.importList(list, firstRow, firstColumn, isVertical);
                                      sheet.tableCollection.toString();
                                      print(data[0]);
                                      for (var i = 0; i < data[0]; i++) {
                                        sheet
                                            .getRangeByIndex(i + 2, 1)
                                            .setValue(resp.data![i].studentId);
                                        sheet
                                            .getRangeByIndex(i + 2, 2)
                                            .setValue(resp.data![i].status);
                                        sheet
                                            .getRangeByIndex(i + 2, 3)
                                            .setValue(resp
                                                .data![i].numberOfApplication);
                                        sheet
                                            .getRangeByIndex(i + 2, 4)
                                            .setValue(
                                                resp.data![i].citizenship);
                                        sheet
                                            .getRangeByIndex(i + 2, 5)
                                            .setValue(resp.data![i].firstName);
                                        sheet
                                            .getRangeByIndex(i + 2, 6)
                                            .setValue(resp.data![i].lastName);
                                        sheet
                                            .getRangeByIndex(i + 2, 7)
                                            .setValue(resp.data![i].mobileNo);
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
                                      final String fileName = Platform.isWindows
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
                              PaginatedDataTable(
                                onRowsPerPageChanged: (perPage) {},
                                columnSpacing: 0,
                                rowsPerPage: 5,
                                dataRowHeight: Get.height * 0.07,
                                headingRowHeight: Get.height * 0.08,
                                availableRowsPerPage: const [5],
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
                                                  'Student ID',
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
                                                  color: Colors.white,
                                                  width: 2)),
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
                                                  'Status',
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
                                      width: Get.width * 0.470,
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
                                                'Applications',
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
                                                  color: Colors.white,
                                                  width: 2)),
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
                                                  'Citizenship',
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
                                                  color: Colors.white,
                                                  width: 2)),
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
                                                  color: Colors.white,
                                                  width: 2)),
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
                                                  'Last Name',
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
                                                  color: Colors.white,
                                                  width: 2)),
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
                                                  'Contact Number',
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
                                                  color: Colors.white,
                                                  width: 2)),
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
                                source: TableRow(BuildContext: context, resp),
                              ),
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
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Number of items: ${resp.data!.length}',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'Poppins'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        } else {
                          if (controller.apiResponse.status ==
                              rr.Status.ERROR) {
                            return const CircularProgressIndicator();
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
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
  final StudentDeleteViewModel _studentDeleteViewModel =
      Get.put(StudentDeleteViewModel());
  final StudentListResponseModel? data;

  TableRow(
    this.data, {
    required this.BuildContext,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        onTap: () {
          Get.to(StudentEditScreen(studentId: data!.data![index].studentId));
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
          child: Text('${data!.data![index].studentId}'),
        ),
      ),
      DataCell(
        onTap: () {
          Get.to(StudentEditScreen(studentId: data!.data![index].studentId));
        },
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.430,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data!.data![index].status}'),
        ),
      ),
      DataCell(
        onTap: () {
          Get.to(StudentEditScreen(studentId: data!.data![index].studentId));
        },
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.420,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data!.data![index].numberOfApplication}'),
        ),
      ),
      DataCell(
        onTap: () {
          Get.to(StudentEditScreen(studentId: data!.data![index].studentId));
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
          child: Text('${data!.data![index].citizenship}'),
        ),
      ),
      DataCell(
        onTap: () {
          Get.to(StudentEditScreen(studentId: data!.data![index].studentId));
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
          child: Text('${data!.data![index].firstName}'),
        ),
      ),
      DataCell(
        onTap: () {
          Get.to(StudentEditScreen(studentId: data!.data![index].studentId));
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
          child: Text('${data!.data![index].lastName}'),
        ),
      ),
      DataCell(
        onTap: () {
          Get.to(StudentEditScreen(studentId: data!.data![index].studentId));
        },
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.17,
          width: Get.width * 0.43,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('+${data!.data![index].mobileNo}'),
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
          child: InkWell(
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
                                onTap: () {
                                  showDialog(
                                    context: BuildContext,
                                    builder: (context) {
                                      return SimpleDialog(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: Get.height * 0.05,
                                                ),
                                                const Text(
                                                  ' Are you sure, want to delete this record?',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: kGrey5,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.08,
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
                                                      minWidth:
                                                          Get.width * 0.20,
                                                      color: Colors.green,
                                                      shape:
                                                          ContinuousRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      child: const Text(
                                                        'No',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.03,
                                                    ),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        print(
                                                            'Student id: ${data!.data![index].studentId}');
                                                        _studentDeleteViewModel
                                                            .studentDeleteViewModel(
                                                                studentId: data!
                                                                    .data![
                                                                        index]
                                                                    .studentId)
                                                            .then((value) =>
                                                                Get.back());
                                                        if (_studentDeleteViewModel
                                                                .apiResponse
                                                                .status ==
                                                            rr.Status
                                                                .COMPLETE) {
                                                          print(
                                                              'Application Exists');
                                                        } else {
                                                          print('Error');
                                                        }
                                                      },
                                                      height: Get.height * 0.06,
                                                      minWidth:
                                                          Get.width * 0.20,
                                                      color: Colors.red,
                                                      shape:
                                                          ContinuousRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      child: const Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.01,
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
                                        height: Get.height * 0.06,
                                        width: Get.width * 0.09,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          size: 30,
                                        )),
                                    SizedBox(
                                      width: Get.width * 0.06,
                                    ),
                                    const Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Container(
                                      height: Get.height * 0.035,
                                      width: Get.width * 0.09,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Icon(
                                        Icons.email,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.06,
                                    ),
                                    const Text(
                                      "Send Invitation",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                      ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Get.height * 0.040,
                  width: Get.width * 0.08,
                  decoration: BoxDecoration(
                    color: kGrey5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.keyboard_arrow_down_sharp,
                      color: Colors.white, size: 17),
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
  int get rowCount => data!.data!.length;

  @override
  int get selectedRowCount => 0;
}
