import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/Institution/institute_profile_screen.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/institute_table_response_model.dart';

import '../../../Api/api_response.dart';
import '../../../viewModel/institute_table_view_model.dart';

class NewInstituteListScreen extends StatefulWidget {
  @override
  _NewInstituteListScreenState createState() => _NewInstituteListScreenState();
}

class _NewInstituteListScreenState extends State<NewInstituteListScreen> {
  InstituteTableViewModel instituteTableViewModel =
      Get.put(InstituteTableViewModel());

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
  bool gmo = false;
  bool msmUnify = false;
  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: commonDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPreferredSize(context, _key),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'institution  ',
                          style: TextStyle(
                            color: kNavy,
                            fontFamily: 'Poppins',
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Filter By:',
                          style: TextStyle(
                              color: Color(0xffAAAAAA),
                              fontFamily: 'Poppins',
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                gmo = true;
                                msmUnify = false;
                              });
                            },
                            child: Container(
                              height: Get.height * 0.045,
                              width: Get.width * 0.30,
                              decoration: BoxDecoration(
                                  color:
                                      gmo == true ? kRed : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.3),
                                  )),
                              child: Center(
                                child: Text(
                                  'GMO Institutions',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'Poppins',
                                      color: gmo == true ? Colors.white : kRed),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                gmo = false;
                                msmUnify = true;
                              });
                            },
                            child: Container(
                              height: Get.height * 0.045,
                              width: Get.width * 0.40,
                              decoration: BoxDecoration(
                                  color: msmUnify == true
                                      ? kGreen
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.3),
                                  )),
                              child: Center(
                                child: Text(
                                  'MSM Unify Institutions',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'Poppins',
                                      color: msmUnify == true
                                          ? Colors.white
                                          : kGreen),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/FilterRed.svg',
                          height: 30,
                          width: 30,
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
                    GetBuilder<InstituteTableViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          List<InstituteResponceModel> resp =
                              controller.apiResponse.data;
                          // print('RESPONSE=======${resp}');
                          return PaginatedDataTable(
                            onRowsPerPageChanged: (perPage) {},
                            columnSpacing: 0,
                            rowsPerPage: 5,
                            dataRowHeight: Get.height * 0.05,
                            headingRowHeight: Get.height * 0.08,
                            horizontalMargin: 1,
                            availableRowsPerPage: [5],
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
                                                    const Duration(seconds: 2),
                                                    () {
                                                  // colorsValue = false;
                                                  setState(() {});
                                                });
                                              });
                                            },
                                            child: const Text(
                                              'AEF type',
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
                                                    const Duration(seconds: 2),
                                                    () {
                                                  // colorsValue = false;
                                                  setState(() {});
                                                });
                                              });
                                            },
                                            child: const Text(
                                              'AEF Status',
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
                                                'Authorization',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
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
                                                    const Duration(seconds: 2),
                                                    () {
                                                  // colorsValue = false;
                                                  setState(() {});
                                                });
                                              });
                                            },
                                            child: const Text(
                                              'Province',
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
                                                    const Duration(seconds: 2),
                                                    () {
                                                  // colorsValue = false;
                                                  setState(() {});
                                                });
                                              });
                                            },
                                            child: const Text(
                                              'Country',
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
                                                    const Duration(seconds: 2),
                                                    () {
                                                  // colorsValue = false;
                                                  setState(() {});
                                                });
                                              });
                                            },
                                            child: const Text(
                                              'Partner type',
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
                                                    const Duration(seconds: 2),
                                                    () {
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
                                        ],
                                      ))),
                            ],
                            source: TableRow(resp, buildContext: context),
                          );
                        } else {
                          if (controller.apiResponse.status == Status.ERROR) {
                            return CircularProgressIndicator();
                          }
                          return Center(
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
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
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
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.04,
                                                        ),
                                                        Divider(),
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.04,
                                                        ),
                                                        Row(
                                                          children: [
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
                                                                  child: Text(add
                                                                      .toString()),
                                                                ),
                                                                itemBuilder:
                                                                    (context) =>
                                                                        [
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add = 'Not And';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('Not And'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add = 'or';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('or'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add = 'Not or';
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('Not or'),
                                                                          ),
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                add = 'And';
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
                                                                            const EdgeInsets.all(10),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Colors
                                                                              .red
                                                                              .withOpacity(0.2),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
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
                                                                          const EdgeInsets.all(
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        "+",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.green.withOpacity(0.5),
                                                                            fontSize: 25),
                                                                      ),
                                                                    ),
                                                                    itemBuilder:
                                                                        (context) =>
                                                                            [
                                                                      PopupMenuItem(
                                                                        onTap:
                                                                            () {
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
                                                                        onTap:
                                                                            () {
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
                                                                            const EdgeInsets.all(10),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Colors
                                                                              .red
                                                                              .withOpacity(0.2),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
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
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .green
                                                                          .withOpacity(
                                                                              0.5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
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
                      height: 40,
                    ),
                    supportSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final buildContext;
  final List<InstituteResponceModel>? data;

  TableRow(this.data, {required this.buildContext});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.22,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].instName}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.22,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].aefType}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.22,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].aefType}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.22,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].agentAuthStatus}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.22,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].provinceName}'),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.22,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text(
            '${data![index].countryName}',
          ),
        ),
      ),
      DataCell(
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.22,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data![index].partnerTypeName}'),
        ),
      ),
      DataCell(
        Center(
          child: Container(
            height: Get.height * 0.22,
            width: Get.width * 0.10,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: buildContext,
                    builder: (context) {
                      return SimpleDialog(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xffe8252a)),
                            borderRadius: BorderRadius.circular(10)),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.03,
                                                      ),
                                                      Container(
                                                        // color: Color(0xffF5F5F5),
                                                        width: double.infinity,
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: DataTable(
                                                            // sortAscending: false,
                                                            // sortColumnIndex: 0,
                                                            headingRowHeight:
                                                                Get.height *
                                                                    0.10,
                                                            headingRowColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                            .grey[
                                                                        200]),
                                                            border:
                                                                TableBorder.all(
                                                              width: 3.0,
                                                              color: const Color(
                                                                  0xffF5F5F5),
                                                            ),
                                                            columns: [
                                                              DataColumn(
                                                                label: Row(
                                                                  children: [
                                                                    const Text(
                                                                      'Name',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width *
                                                                          0.02,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return SimpleDialog(
                                                                                children: [
                                                                                  StatefulBuilder(
                                                                                    builder: (BuildContext context, void Function(void Function()) setState) {
                                                                                      return Column(
                                                                                        children: [
                                                                                          Container(
                                                                                            color: const Color(0xffF5F5F5),
                                                                                            width: double.infinity,
                                                                                            height: Get.height * 0.07,
                                                                                            child: TextFormField(
                                                                                              decoration: const InputDecoration(
                                                                                                hoverColor: Colors.red,
                                                                                                prefixIcon: Icon(Icons.search_outlined, color: Colors.grey),
                                                                                                hintText: 'Search',
                                                                                              ),
                                                                                              //controller: searchController,
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: Get.height * 0.30,
                                                                                          ),
                                                                                          const Divider(
                                                                                            height: 1.3,
                                                                                            color: Colors.grey,
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              TextButton(
                                                                                                  onPressed: () {
                                                                                                    Navigator.pop(context);
                                                                                                  },
                                                                                                  child: const Text(
                                                                                                    "OK",
                                                                                                    style: TextStyle(color: Color(0xffff5722)),
                                                                                                  )),
                                                                                              TextButton(
                                                                                                onPressed: () {
                                                                                                  Navigator.pop(context);
                                                                                                },
                                                                                                child: const Text(
                                                                                                  "CANCEL",
                                                                                                  style: TextStyle(color: Color(0xffff5722)),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          )
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  )
                                                                                ],
                                                                              );
                                                                            });
                                                                      },
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .filter_list,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              DataColumn(
                                                                label: Row(
                                                                  children: [
                                                                    const Text(
                                                                      'Date Modified',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width *
                                                                          0.02,
                                                                    ),
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          showDialog(
                                                                              context: context,
                                                                              builder: (BuildContext context) {
                                                                                return SimpleDialog(
                                                                                  children: [
                                                                                    StatefulBuilder(
                                                                                      builder: (BuildContext context, void Function(void Function()) setState) {
                                                                                        return Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              color: const Color(0xffF5F5F5),
                                                                                              width: double.infinity,
                                                                                              height: Get.height * 0.07,
                                                                                              child: TextFormField(
                                                                                                decoration: const InputDecoration(
                                                                                                  hoverColor: Colors.red,
                                                                                                  prefixIcon: Icon(Icons.search_outlined, color: Colors.grey),
                                                                                                  hintText: 'Search',
                                                                                                ),
                                                                                                // controller: searchController,
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: Get.height * 0.30,
                                                                                            ),
                                                                                            const Divider(
                                                                                              height: 1.3,
                                                                                              color: Colors.grey,
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                TextButton(
                                                                                                    onPressed: () {
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: const Text(
                                                                                                      "OK",
                                                                                                      style: TextStyle(color: Color(0xffff5722)),
                                                                                                    )),
                                                                                                TextButton(
                                                                                                  onPressed: () {
                                                                                                    Navigator.pop(context);
                                                                                                  },
                                                                                                  child: const Text(
                                                                                                    "CANCEL",
                                                                                                    style: TextStyle(color: Color(0xffff5722)),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            )
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    )
                                                                                  ],
                                                                                );
                                                                              });
                                                                        },
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .filter_list,
                                                                          color:
                                                                              Colors.black,
                                                                        ))
                                                                  ],
                                                                ),
                                                              ),
                                                              DataColumn(
                                                                label: Row(
                                                                  children: const [
                                                                    InkWell(
                                                                      child:
                                                                          Text(
                                                                        'Download',
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                            rows: const <
                                                                DataRow>[
                                                              DataRow(
                                                                cells: <
                                                                    DataCell>[
                                                                  DataCell(Text(
                                                                      'Sarah')),
                                                                  DataCell(Text(
                                                                      '19')),
                                                                  DataCell(
                                                                      Text('')),
                                                                ],
                                                              ),
                                                              DataRow(
                                                                cells: <
                                                                    DataCell>[
                                                                  DataCell(Text(
                                                                      'Janine')),
                                                                  DataCell(Text(
                                                                      '43')),
                                                                  DataCell(
                                                                      Text('')),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          );
                                        });
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
                                          child: SvgPicture.asset(
                                            'assets/icons/collateral.svg',
                                          )),
                                      SizedBox(
                                        width: Get.width * 0.06,
                                      ),
                                      const Text("Marketing Collateral")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(InstituteProfileScreen());
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: Get.height * 0.035,
                                        width: Get.width * 0.120,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: const Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Colors.white,
                                            size: 20),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.06,
                                      ),
                                      const Text("View Detail")
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
