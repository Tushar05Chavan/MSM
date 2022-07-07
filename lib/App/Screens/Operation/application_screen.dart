import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/AddStudent/add_student_screen.dart';
import 'package:msm_unify/App/Screens/ApplicationView/application_view.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/operation_application_response_model.dart';

import '../../../Api/api_response.dart';
import '../../../viewModel/operation_application_view_model.dart';

class ApplicationScreen extends StatefulWidget {
  @override
  _ApplicationScreenState createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  ApplicationViewModel applicationViewModel = Get.put(ApplicationViewModel());

  final List<String> _all = ['All', 'Recently Modified', 'Last 10 Modified'];
  String? _selectedAll;

  String? _selectedCountry;

  String? _selectedPartner;
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Flexible(
                          child: Text(
                            'Application List View',
                            style: TextStyle(
                                color: kNavy,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(AddStudentScreen());
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              height: Get.height * 0.035,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: kNavy),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    '+',
                                    style:
                                        TextStyle(color: kNavy, fontSize: 20),
                                  ),
                                  Text(
                                    'New Application',
                                    style:
                                        TextStyle(color: kNavy, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(5),
                          hint: const Text("All"),
                          value: _selectedAll,
                          items: _all.map((all) {
                            return DropdownMenuItem(
                                value: all,
                                child: Text(
                                  all,
                                  style: const TextStyle(
                                      color: kGrey4,
                                      fontFamily: "Roboto",
                                      fontSize: 13),
                                ));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedAll = newValue as String?;
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search_outlined),
                          hintText: 'Search Keyword',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<ApplicationViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          ApplicationResponseModel resp =
                              controller.apiResponse.data;
                          //print('RESPONSE=======${resp}');
                          return PaginatedDataTable(
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
                                        width: Get.width * 0.47,
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
                                                  'Application ID',
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
                                                  child: const Icon(
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
                                                      const Duration(
                                                          seconds: 2), () {
                                                    // colorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: const Text(
                                                'Status',
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
                                                      const Duration(
                                                          seconds: 2), () {
                                                    // colorsValue = false;
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: const Text(
                                                'Create Date',
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
                                                        const Duration(
                                                            seconds: 2), () {
                                                      // colorsValue = false;
                                                      setState(() {});
                                                    });
                                                  });
                                                },
                                                child: const Text(
                                                  'Submit Date',
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
                                        ))),
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.60,
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
                                                  'Institution Name',
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
                                        ))),
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.60,
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
                                                  'Contact Number',
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
                                        ))),
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.30,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffF5F5F5),
                                            border: Border.all(
                                                color: Colors.white, width: 2)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                DataColumn(
                                    label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        height: Get.height * 0.10,
                                        width: Get.width * 0.60,
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
                                                  'Document Status',
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
                                        ))),
                              ],
                              source: TableRow(BuildContext: context, resp));
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
                                                        const Divider(),
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
                     Row(
                       children: [
                         Text(
                                    'Number of items: 178',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'Poppins'),
                                  ),
                       ],
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

  final ApplicationResponseModel? data;
  // void setState(void Function() fn) setState ;
  String? _selectedDeferTo;

  final List<String> _deferTo = [
    'None',
    'Jul-2022',
    'Aug-2022',
    'Oct-2022',
    'Nov-2022',
    'Jan-2023'
  ];
  TableRow(
    this.data, {
    this.BuildContext,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        GestureDetector(
          onTap: () {
            Get.to(ApplicationViewScreen(
              applicationId: data!.data![index].applicationId,
            ));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: Get.height * 0.17,
            width: Get.width * 0.33,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Text('${data!.data![index].applicationId}'),
          ),
        ),
      ),
      DataCell(
        GestureDetector(
          onTap: () {
            Get.to(ApplicationViewScreen(
              applicationId: data!.data![index].applicationId,
            ));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: Get.height * 0.17,
            width: Get.width * 0.50,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Text('${data!.data![index].statusName}'),
          ),
        ),
      ),
      DataCell(
        GestureDetector(
          onTap: () {
            Get.to(ApplicationViewScreen(
              applicationId: data!.data![index].applicationId,
            ));
          },
          child: Container(
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
      ),
      DataCell(
        GestureDetector(
          onTap: () {
            Get.to(ApplicationViewScreen(
              applicationId: data!.data![index].applicationId,
            ));
          },
          child: Container(
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
      ),
      DataCell(
        GestureDetector(
          onTap: () {
            Get.to(ApplicationViewScreen(
              applicationId: data!.data![index].applicationId,
            ));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: Get.height * 0.17,
            width: Get.width * 0.33,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Text('${data!.data![index].applicationDate}'),
          ),
        ),
      ),
      DataCell(
        GestureDetector(
          onTap: () {
            Get.to(ApplicationViewScreen(
              applicationId: data!.data![index].applicationId,
            ));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Text('${data!.data![index].submitDate}'),
          ),
        ),
      ),
      DataCell(
        GestureDetector(
          onTap: () {
            Get.to(ApplicationViewScreen(
              applicationId: data!.data![index].applicationId,
            ));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: Get.height * 0.17,
            width: Get.width * 0.50,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Text('${data!.data![index].instName}'),
          ),
        ),
      ),
      DataCell(
        GestureDetector(
          onTap: () {
            Get.to(ApplicationViewScreen(
              applicationId: data!.data![index].applicationId,
            ));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: Get.height * 0.17,
            width: Get.width * 0.37,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Text('+${data!.data![index].mobileNo}'),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.30,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Center(
              child: PopupMenuButton(
            itemBuilder: (BuildContext) => [
              PopupMenuItem(
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: BuildContext,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: Colors.red)),
                              content: Container(
                                height: Get.height * 0.35,
                                width: Get.width,
                                child: SingleChildScrollView(
                                  child: StatefulBuilder(
                                    builder: (context,
                                        void Function(void Function())
                                            setState) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'create Deferral Request',
                                                style: TextStyle(
                                                    color: kNavy,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                                        BorderRadius.circular(
                                                            10),
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
                                          Container(
                                            height: Get.height * 0.10,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color: kGrey.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  'Current Intake',
                                                  style: TextStyle(
                                                    color: Color(0xff79747E),
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '  May-2022',
                                                  style: TextStyle(
                                                      color: kRed,
                                                      fontSize: 15,
                                                      fontFamily: 'Poppins'),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                                validator: (title) {
                                                  if (title != null) {
                                                    return "Mode of payment";
                                                  }
                                                },
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                hint: const Text("Defer to*"),
                                                value: _selectedDeferTo,
                                                items: _deferTo.map((deferTo) {
                                                  return DropdownMenuItem(
                                                      value: deferTo,
                                                      child: Text(
                                                        deferTo,
                                                        style: const TextStyle(
                                                            color: kGrey4,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontSize: 13),
                                                      ));
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selectedDeferTo =
                                                        newValue as String?;
                                                  });
                                                }),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: Get.height * 0.04,
                                              width: Get.width * 0.20,
                                              decoration: BoxDecoration(
                                                color: kRed,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: const ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Create Deferral Request'),
                    ),
                  ))
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
          )),
        ),
      ),
      DataCell(
        GestureDetector(
          onTap: () {
            Get.to(ApplicationViewScreen(
              applicationId: data!.data![index].applicationId,
            ));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: Get.height * 0.17,
            width: Get.width * 0.50,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: Text('${data!.data![index].documentsStatus}'),
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
