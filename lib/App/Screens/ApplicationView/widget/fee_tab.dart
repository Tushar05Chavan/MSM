import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/fee_response_model.dart';
import 'package:msm_unify/viewModel/fee_view_model.dart';
import 'package:msm_unify/viewModel/receipt_type_view_model.dart';

import '../../../../model/responseModek/receipt_type_response_model.dart';

class FeeTab extends StatefulWidget {
  const FeeTab({Key? key}) : super(key: key);

  @override
  _FeeTabState createState() => _FeeTabState();
}

class _FeeTabState extends State<FeeTab> {
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;
  String? _selectedTustionFee;
  String? _selectedReceiptType;
  String? _selectedModeOfPayment;
  final List<String> _tuitionfee = [
    'Tuition Fee',
  ];
  final List<String> _modeOfPayment = [
    'Application Fee Waiver',
    'Bank Transfer',
    'A Credit Card',
    'EPBC',
  ];
  final List<String> _receipttype = [
    'Flywire receipt to be used as TT',
    'etc',
  ];
  final TextEditingController _startDate = TextEditingController();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  final FeeViewModel _feeViewModel = Get.put(FeeViewModel());

  final ReceiptTypeViewModel _receiptTypeViewModel =
      Get.put(ReceiptTypeViewModel());
  List<ReceiptTypeResponseModel> receiptTypes = [];
  Future<void> getReceiptType() async {
    await _receiptTypeViewModel.receiptTypeViewModel();
    List<ReceiptTypeResponseModel> response =
        _receiptTypeViewModel.apiResponse.data;
    response.forEach((element) {
      receiptTypes.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    getReceiptType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 55,
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
            GetBuilder<FeeViewModel>(
              builder: (controller) {
                if (controller.apiResponse.status == Status.COMPLETE) {
                  List<FeeResponseModel> response = controller.apiResponse.data;
                  print('fee data: ${response}');
                  return PaginatedDataTable(
                      onRowsPerPageChanged: (perPage) {},
                      columnSpacing: 0,
                      availableRowsPerPage: [5],
                      rowsPerPage: 5,
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
                                          'Deposit date',
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
                                                  Duration(seconds: 1), () {
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
                                        'Type',
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
                                          'Fee amount',
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
                                                  Duration(seconds: 1), () {
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
                                        'Basis',
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
                                width: Get.width * 0.38,
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
                                          'Mode of Payment',
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
                                                  Duration(seconds: 1), () {
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
                                            fontSize: 12),
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
                                width: Get.width * 0.40,
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
                                          'Receipt type / Status',
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              // colorsValue = true;
                                              Future.delayed(
                                                  Duration(seconds: 1), () {
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
                                        'Refund',
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
                      source: TableRow(response));
                } else {
                  if (controller.apiResponse.status == Status.ERROR) {
                    return const CircularProgressIndicator();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
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
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.red)),
                        content: Container(
                          height: Get.height * 0.80,
                          width: Get.width,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Fee Details',
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
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      validator: (title) {
                                        if (title != null) {
                                          return "Tuition Fee";
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(5),
                                      hint: const Text("Tuition Fee"),
                                      value: _selectedTustionFee,
                                      items: _tuitionfee.map((tustionfee) {
                                        return DropdownMenuItem(
                                            value: tustionfee,
                                            child: Text(
                                              tustionfee,
                                              style: const TextStyle(
                                                  color: kGrey4,
                                                  fontFamily: "Roboto",
                                                  fontSize: 13),
                                            ));
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedTustionFee =
                                              newValue as String?;
                                        });
                                      }),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      validator: (title) {
                                        if (title != null) {
                                          return "Mode of payment";
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(5),
                                      hint: const Text("Mode of payment"),
                                      value: _selectedModeOfPayment,
                                      items: _modeOfPayment.map((mode) {
                                        return DropdownMenuItem(
                                            value: mode,
                                            child: Text(
                                              mode,
                                              style: const TextStyle(
                                                  color: kGrey4,
                                                  fontFamily: "Roboto",
                                                  fontSize: 13),
                                            ));
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedModeOfPayment =
                                              newValue as String?;
                                        });
                                      }),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                commontextfiled(hintText: '18800'),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: _startDate,
                                  cursorColor: kRed,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.today),
                                        onPressed: () async {
                                          DateTime date = DateTime(1900);
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());

                                          date = (await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime.now()))!;
                                          _startDate.text =
                                              formatter.format(date);
                                        },
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          )),
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.2),
                                          fontFamily: 'Roboto'),
                                      hintText: 'Today Date',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'DD/MM/YYYY',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'Roboto',
                                    color: Color(0xff565656),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      validator: (title) {
                                        if (title != null) {
                                          return "Mode of payment";
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(5),
                                      hint: const Text("Per Year"),
                                      value: _selectedModeOfPayment,
                                      items: _modeOfPayment.map((mode) {
                                        return DropdownMenuItem(
                                            value: mode,
                                            child: Text(
                                              mode,
                                              style: const TextStyle(
                                                  color: kGrey4,
                                                  fontFamily: "Roboto",
                                                  fontSize: 13),
                                            ));
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedModeOfPayment =
                                              newValue as String?;
                                        });
                                      }),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      validator: (title) {
                                        if (title != null) {
                                          return "Mode of payment";
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(5),
                                      hint: const Text("Receipt type"),
                                      value: _selectedReceiptType,
                                      items: receiptTypes.map((mode) {
                                        return DropdownMenuItem(
                                            value: mode.recTypeId.toString(),
                                            child: Text(
                                              mode.recTypeName.toString(),
                                              style: const TextStyle(
                                                  color: kGrey4,
                                                  fontFamily: "Roboto",
                                                  fontSize: 13),
                                            ));
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedReceiptType =
                                              newValue as String?;
                                        });
                                      }),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                const Text(
                                  'Upload Receipt',
                                  style: TextStyle(
                                      color: Color(0xffAAAAAA),
                                      fontFamily: 'Poppins',
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: Get.height * 0.04,
                                  width: Get.width * 0.20,
                                  decoration: BoxDecoration(
                                    color: kGreen1,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Upload',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: Get.height * 0.04,
                                    width: Get.width * 0.20,
                                    decoration: BoxDecoration(
                                      color: kRed,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: Get.height * 0.04,
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
                        'Add More',
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
              height: 45,
            ),
            supportSection(),
          ],
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final List<FeeResponseModel> data;

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
          child: Text('${data[index].feeType}'),
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
          child: Text('${data[index].feeAmount}'),
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
          child: Text('${data[index].feeBasis}'),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.10,
          width: Get.width * 0.38,
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
          child: Text('${data[index].intake}'),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.10,
          width: Get.width * 0.40,
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
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
