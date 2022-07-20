import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xl;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class StudayPermitTab extends StatefulWidget {
  @override
  _StudayPermitTabState createState() => _StudayPermitTabState();
}

class _StudayPermitTabState extends State<StudayPermitTab> {
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;
  String? _docType;
  final List<String> _type = [
    'All',
    'Business Certificate',
    'Business Profile',
    'Business Licence'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
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
                                        )),
                                  )
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
                                        'Data uploaded',
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
                                        )),
                                  )
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
                                        ' uploaded By',
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
                                      'Intake',
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
                    source: TableRow()),
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
                                                                color: Colors
                                                                    .red
                                                                    .withOpacity(
                                                                        0.2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Text(add
                                                                  .toString()),
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
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
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
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
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
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
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
                                                        BorderRadius.circular(
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
                                      Container(
                                        height: Get.height * 0.055,
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(color: kGrey),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              hint: const Text("Province"),
                                              style: const TextStyle(
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
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            child: Container(
                                              height: Get.height * 0.040,
                                              width: Get.width * 0.25,
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Center(
                                                  child: Text(
                                                'Select File',
                                                style: TextStyle(
                                                    color: kRed,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 13),
                                              )),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            'No File Chosen',
                                            style: TextStyle(
                                                color: Color(0xff858796),
                                                fontSize: 16,
                                                fontFamily: 'Nunito'),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
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
                          });
                    },
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kNavy),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            Icons.add,
                            color: kNavy,
                          ),
                          Text(
                            'Add More',
                            style: TextStyle(
                              color: kNavy,
                              fontFamily: 'Poppins',
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                supportSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
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
        ),
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
