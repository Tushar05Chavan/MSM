import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/application_view_response_model.dart';
import 'package:msm_unify/model/responseModek/get_notes_response_model.dart';
import 'package:msm_unify/viewModel/add_notes_application_view_model.dart';
import 'package:msm_unify/viewModel/get_notes_view_model.dart';

class NotesTab extends StatefulWidget {
  final ApplicationViewResponseModel data;

  const NotesTab({super.key, required this.data});

  @override
  _NotesTabState createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab> {
  final GetNotesViewModel _getNotesViewModel = Get.put(GetNotesViewModel());

  final AddNotesApplicationViewModel _addNotesApplicationViewModel =
      Get.put(AddNotesApplicationViewModel());

  @override
  void initState() {
    _getNotesViewModel.getNotesViewModel(
        activityId: widget.data.genInfo!.applicationId);
    super.initState();
  }

  TextEditingController _notes = TextEditingController();
  void showInSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        backgroundColor: kGreen,
        content: Text(
          'Add Not Successfully',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  void showInErrorSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        backgroundColor: kRed,
        content: Text(
          'Somthing Went Wrong',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Student's Comments",
              style: TextStyle(
                color: kNavy,
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _notes,
              maxLines: 6,
              decoration: InputDecoration(
                  hintText:
                      'Enter your Comments including future request if any',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            const SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: () {
                var body = {
                  "ActivityType": "1",
                  "StatusId": 0,
                  "Priority": -1,
                  "ApplicationId": "${widget.data.genInfo!.applicationId}",
                  "Remark": _notes.text,
                };
                _addNotesApplicationViewModel
                    .addNotesApplicationViewModel(body);
                if (_addNotesApplicationViewModel.apiResponse.status ==
                    Status.COMPLETE) {
                  showInSnackBar();
                  _notes.clear();
                } else {
                  if (_addNotesApplicationViewModel.apiResponse.status ==
                      Status.ERROR) {
                    showInErrorSnackBar();
                  }
                }
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: Get.height * 0.05,
                  width: Get.width * 0.30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kNavy)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.add,
                        color: kNavy,
                      ),
                      Text(
                        'Add Note',
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 11,
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            GetBuilder<GetNotesViewModel>(builder: (controller) {
              if (controller.apiResponse.status == Status.COMPLETE) {
                List<GetNotesResponseModel> response =
                    controller.apiResponse.data;
                return PaginatedDataTable(
                    onRowsPerPageChanged: (perPage) {},
                    columnSpacing: 0,
                    availableRowsPerPage: [response.length],
                    rowsPerPage: response.length,
                    dataRowHeight: Get.height * 0.10,
                    headingRowHeight: Get.height * 0.08,
                    horizontalMargin: 1,
                    columns: [
                      DataColumn(
                          label: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              height: Get.height * 0.10,
                              width: Get.width * 0.50,
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
                                      "Student's Notes",
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
                              width: Get.width * 0.50,
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
                                      'Data',
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
                                          Future.delayed(Duration(seconds: 1),
                                              () {
                                            // colorsValue = false;
                                            setState(() {});
                                          });
                                        });

                                        // showDialog(
                                        //     context: context,
                                        //     builder: (BuildContext context) {
                                        //       // return AlertDialog(
                                        //       //   actions: [
                                        //       //     Container(
                                        //       //       height: Get.height * 0.46,
                                        //       //       child: StatefulBuilder(
                                        //       //         builder: (BuildContext
                                        //       //         context,
                                        //       //             void Function(
                                        //       //                 void Function())
                                        //       //             setState) {
                                        //       //           return Column(
                                        //       //             children: [
                                        //       //               Container(
                                        //       //                   color: Colors
                                        //       //                       .black
                                        //       //                       .withOpacity(
                                        //       //                       0.1),
                                        //       //                   child:
                                        //       //                   TextFormField(
                                        //       //                     decoration:
                                        //       //                     const InputDecoration(
                                        //       //                       hoverColor:
                                        //       //                       Colors
                                        //       //                           .red,
                                        //       //                       prefixIcon:
                                        //       //                       Icon(Icons
                                        //       //                           .search_outlined),
                                        //       //                       hintText:
                                        //       //                       'Search',
                                        //       //                     ),
                                        //       //                   )),
                                        //       //               Row(
                                        //       //                 children: [
                                        //       //                   Checkbox(
                                        //       //                     activeColor:
                                        //       //                     Colors
                                        //       //                         .orange,
                                        //       //                     value:
                                        //       //                     _checkbox,
                                        //       //                     onChanged:
                                        //       //                         (value) {
                                        //       //                       setState(() {
                                        //       //                         _checkbox =
                                        //       //                         !_checkbox;
                                        //       //                         _checkboxListTile =
                                        //       //                         !_checkboxListTile;
                                        //       //                         _checkboxListTile1 =
                                        //       //                         !_checkboxListTile1;
                                        //       //                         _checkboxListTile2 =
                                        //       //                         !_checkboxListTile2;
                                        //       //                         _checkboxListTile3 =
                                        //       //                         !_checkboxListTile3;
                                        //       //                       });
                                        //       //                     },
                                        //       //                   ),
                                        //       //                   const Text(
                                        //       //                       'Select All'),
                                        //       //                 ],
                                        //       //               ),
                                        //       //               const Divider(),
                                        //       //               CheckboxListTile(
                                        //       //                 activeColor:
                                        //       //                 Colors.orange,
                                        //       //                 controlAffinity:
                                        //       //                 ListTileControlAffinity
                                        //       //                     .leading,
                                        //       //                 title: const Text(
                                        //       //                     '107395'),
                                        //       //                 value:
                                        //       //                 _checkboxListTile,
                                        //       //                 onChanged: (value) {
                                        //       //                   setState(() {
                                        //       //                     _checkboxListTile =
                                        //       //                     !_checkboxListTile;
                                        //       //                   });
                                        //       //                 },
                                        //       //               ),
                                        //       //               CheckboxListTile(
                                        //       //                 activeColor:
                                        //       //                 Colors.orange,
                                        //       //                 controlAffinity:
                                        //       //                 ListTileControlAffinity
                                        //       //                     .leading,
                                        //       //                 title: const Text(
                                        //       //                     '107217'),
                                        //       //                 value:
                                        //       //                 _checkboxListTile1,
                                        //       //                 onChanged: (value) {
                                        //       //                   setState(() {
                                        //       //                     _checkboxListTile1 =
                                        //       //                     !_checkboxListTile1;
                                        //       //                   });
                                        //       //                 },
                                        //       //               ),
                                        //       //               CheckboxListTile(
                                        //       //                 activeColor:
                                        //       //                 Colors.orange,
                                        //       //                 controlAffinity:
                                        //       //                 ListTileControlAffinity
                                        //       //                     .leading,
                                        //       //                 title: const Text(
                                        //       //                     '104575'),
                                        //       //                 value:
                                        //       //                 _checkboxListTile2,
                                        //       //                 onChanged: (value) {
                                        //       //                   setState(() {
                                        //       //                     _checkboxListTile2 =
                                        //       //                     !_checkboxListTile2;
                                        //       //                   });
                                        //       //                 },
                                        //       //               ),
                                        //       //               CheckboxListTile(
                                        //       //                 activeColor:
                                        //       //                 Colors.orange,
                                        //       //                 controlAffinity:
                                        //       //                 ListTileControlAffinity
                                        //       //                     .leading,
                                        //       //                 title: const Text(
                                        //       //                     '123456'),
                                        //       //                 value:
                                        //       //                 _checkboxListTile3,
                                        //       //                 onChanged: (value) {
                                        //       //                   setState(() {
                                        //       //                     _checkboxListTile3 =
                                        //       //                     !_checkboxListTile3;
                                        //       //                   });
                                        //       //                 },
                                        //       //               ),
                                        //       //               const Divider(),
                                        //       //               const SizedBox(
                                        //       //                 height: 5,
                                        //       //               ),
                                        //       //               Row(
                                        //       //                 mainAxisAlignment:
                                        //       //                 MainAxisAlignment
                                        //       //                     .end,
                                        //       //                 children: [
                                        //       //                   InkWell(
                                        //       //                     onTap: () {
                                        //       //                       Get.back();
                                        //       //                     },
                                        //       //                     child:
                                        //       //                     const Text(
                                        //       //                       "OK",
                                        //       //                       style: TextStyle(
                                        //       //                           color: Color(
                                        //       //                               0xffFF5722),
                                        //       //                           fontFamily:
                                        //       //                           'Roboto',
                                        //       //                           fontWeight:
                                        //       //                           FontWeight
                                        //       //                               .w500,
                                        //       //                           fontSize:
                                        //       //                           16),
                                        //       //                     ),
                                        //       //                   ),
                                        //       //                   const SizedBox(
                                        //       //                     width: 20,
                                        //       //                   ),
                                        //       //                   InkWell(
                                        //       //                     onTap: () {
                                        //       //                       Get.back();
                                        //       //                     },
                                        //       //                     child:
                                        //       //                     const Text(
                                        //       //                       "CANCEL",
                                        //       //                       style: TextStyle(
                                        //       //                           color: Color(
                                        //       //                               0xffFF5722),
                                        //       //                           fontFamily:
                                        //       //                           'Roboto',
                                        //       //                           fontWeight:
                                        //       //                           FontWeight
                                        //       //                               .w500,
                                        //       //                           fontSize:
                                        //       //                           16),
                                        //       //                     ),
                                        //       //                   ),
                                        //       //                   const SizedBox(
                                        //       //                     width: 10,
                                        //       //                   ),
                                        //       //                 ],
                                        //       //               ),
                                        //       //             ],
                                        //       //           );
                                        //       //         },
                                        //       //       ),
                                        //       //     ),
                                        //       //   ],
                                        //       // );
                                        //     });
                                      },
                                      // onTap: () {},
                                      child: Icon(
                                        Icons.filter_list,
                                        color: Colors.black,
                                      ))
                                ],
                              ))),
                    ],
                    source: TableRow(response));
              } else {
                if (controller.apiResponse.status == Status.ERROR) {
                  return const Center(
                    child: Text('Somthing Went Wrong'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
            const SizedBox(
              height: 50,
            ),
            supportSection(),
          ],
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final List<GetNotesResponseModel> data;

  TableRow(this.data);
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.50,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Center(
            child: Html(data: ' ${data[index].activityRemark}'),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.50,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Center(
            child: Text('${data[index].activityStamp}'),
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
