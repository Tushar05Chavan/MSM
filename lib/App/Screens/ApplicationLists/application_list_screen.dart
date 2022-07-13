import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/AddStudent/add_student_screen.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/Responsive/responsive.dart';

import '../../../model/responseModek/recent_applications_new_enhance_response_model.dart';

class ApplicationListScreen extends StatefulWidget {
  final List<RecentApplicationsNewEnhanceResponseModel>? recentData;

  const ApplicationListScreen({super.key, this.recentData});

  @override
  _ApplicationListScreenState createState() => _ApplicationListScreenState();
}

class _ApplicationListScreenState extends State<ApplicationListScreen> {
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  final List<String> _modified = [
    'All',
    'Recently modified',
    'Last 10 modified'
  ];
  // var tableRow = TableRow();
  String? _selectedCountry;
  String? _selectedModified;
  String? _selectedPartner;
  bool colorsValue = false;
  bool _checkbox = false;
  bool _checkboxListTile = false;
  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;
  bool _checkboxListTile3 = false;
  bool _addCondition = false;
  bool _addGroup = false;
  String? add;
  String? add1;
  List<RecentApplicationsNewEnhanceResponseModel> response = [];
  addDataList() {
    widget.recentData?.forEach((element) {
      response.add(element);
    });
  }

  @override
  void initState() {
    addDataList();
    print('==data==${widget.recentData![0].applicationId}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kColorPrimary,
                titleSpacing: 10.0,
                title: const Text("Application List Views"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Search program to apply",
                            style: TextStyle(
                                color: Color(0xff555555),
                                fontFamily: 'Roboto',
                                fontSize: 11),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: Get.height * 0.060,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kGrey4),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      borderRadius: BorderRadius.circular(5),
                                      hint: const Text("Nationalities"),
                                      value: _selectedCountry,
                                      items: _country.map((country) {
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
                                          _selectedCountry =
                                              newValue as String?;
                                        });
                                      }),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: Get.height * 0.060,
                                  width: Get.width * 0.55,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.2)),
                                        hintText: 'What do you Want to study?',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: Get.height * 0.060,
                                width: Get.width * 0.30,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.2)),
                                      hintText: 'Destination',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ),
                              Container(
                                height: Get.height * 0.060,
                                width: Get.width * 0.35,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kGrey4),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      borderRadius: BorderRadius.circular(5),
                                      hint: const Text("All"),
                                      value: _selectedPartner,
                                      items: _partner.map((partner) {
                                        return DropdownMenuItem(
                                            value: partner,
                                            child: Text(
                                              partner,
                                              style: const TextStyle(
                                                  color: kGrey4,
                                                  fontFamily: "Roboto",
                                                  fontSize: 13),
                                            ));
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedPartner =
                                              newValue as String?;
                                        });
                                      }),
                                ),
                              ),
                              Container(
                                height: Get.height * 0.060,
                                width: Get.width * 0.25,
                                decoration: BoxDecoration(
                                    color: kNavy,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Text(
                                    "Search",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width * 0.50,
                            child: const Text(
                              'Application List Views',
                              style: TextStyle(
                                  color: kNavy,
                                  fontSize: 21,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(AddStudentScreen());
                            },
                            child: Container(
                              width: Get.width * 0.35,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              height: Get.height * 0.035,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: kNavy),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.060,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kGrey4),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              borderRadius: BorderRadius.circular(5),
                              hint: const Text("All"),
                              value: _selectedModified,
                              items: _modified.map((modified) {
                                return DropdownMenuItem(
                                    value: modified,
                                    child: Text(
                                      modified,
                                      style: const TextStyle(
                                          color: kGrey4,
                                          fontFamily: "Roboto",
                                          fontSize: 13),
                                    ));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedModified = newValue as String?;
                                });
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: Get.height * 0.060,
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.search_outlined,
                                  color: kGrey4, size: 30),
                              hintText: 'Search Keyword',
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.1),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.2),
                                  ))),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
                        height: 3,
                      ),
                      PaginatedDataTable(
                          onRowsPerPageChanged: (perPage) {},
                          columnSpacing: 0,
                          rowsPerPage: 5,
                          availableRowsPerPage: const [5],
                          dataRowHeight: Get.height * 0.12,
                          headingRowHeight: Get.height * 0.08,
                          horizontalMargin: 1,
                          columns: <DataColumn>[
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.430,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Application ID',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '107395'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '107217'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '104575'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '123456'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.29,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Status',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Application Created'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Application Received'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Application Rejected'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Application Rejected'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.29,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'First Name',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'anpaad'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Avinav1'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Avinav3'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'kishan'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.29,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Last Name',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Benoit Rajdd'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'malani'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Strong Malani'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'but'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.29,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Submit Date',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Aberty University'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'M.A. Legal Studies (39 Credit)'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Master of Urban Planning and Policy'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'MS Information Systems'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.37,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Institution Name',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'M.A. Human Resources Management (36 Credit)'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'M.A. Legal Studies (39 Credit)'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Master of Urban Planning and Policy'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'MS Information Systems'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.37,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Contact Number',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '915954895525'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '91 5748888584748'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        ' 91 99415554155'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '91 996998469485'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.25,
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
                                            colorsValue = true;
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              colorsValue = false;
                                              setState(() {});
                                            });
                                          });
                                        },
                                        child: Text(
                                          'Action',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: colorsValue == true
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                          source: TableRow(dataList: response, context)),
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
                                                              height: 10),
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
                                                              height: 10),
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
                        height: 25,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      supportSection(),
                    ],
                  ),
                ),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kColorPrimary,
                titleSpacing: 10.0,
                title: const Text("Fee Waier Lists"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Search program to apply",
                            style: TextStyle(
                                color: Color(0xff555555),
                                fontFamily: 'Roboto',
                                fontSize: 11),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Container(
                                  height: Get.height * 0.060,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: kGrey4),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("Nationalities"),
                                        value: _selectedCountry,
                                        items: _country.map((country) {
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
                                            _selectedCountry =
                                                newValue as String?;
                                          });
                                        }),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.060,
                                width: Get.width * 0.30,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.2)),
                                      hintText: 'What do you Want to study?',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: Get.height * 0.060,
                                  width: Get.width * 0.30,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.2)),
                                        hintText: 'Destination',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  height: Get.height * 0.060,
                                  width: Get.width * 0.30,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: kGrey4),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("All"),
                                        value: _selectedPartner,
                                        items: _partner.map((partner) {
                                          return DropdownMenuItem(
                                              value: partner,
                                              child: Text(
                                                partner,
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedPartner =
                                                newValue as String?;
                                          });
                                        }),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  height: Get.height * 0.060,
                                  width: Get.width * 0.20,
                                  decoration: BoxDecoration(
                                      color: kNavy,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
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
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: Text(
                              'Application List Views',
                              style: TextStyle(
                                  color: kNavy,
                                  fontSize: 21,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: Get.height * 0.035,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: kNavy),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '+',
                                  style: TextStyle(color: kNavy, fontSize: 20),
                                ),
                                Text(
                                  'New Application',
                                  style: TextStyle(color: kNavy, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.40,
                            height: Get.height * 0.060,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: kGrey4),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  borderRadius: BorderRadius.circular(5),
                                  hint: const Text("All"),
                                  value: _selectedModified,
                                  items: _modified.map((modified) {
                                    return DropdownMenuItem(
                                        value: modified,
                                        child: Text(
                                          modified,
                                          style: const TextStyle(
                                              color: kGrey4,
                                              fontFamily: "Roboto",
                                              fontSize: 13),
                                        ));
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedModified = newValue as String?;
                                    });
                                  }),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: Get.height * 0.060,
                            width: Get.width * 0.40,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.search_outlined,
                                      color: kGrey4, size: 30),
                                  hintText: 'Search Keyword',
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.2),
                                      ))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
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
                        height: 3,
                      ),
                      PaginatedDataTable(
                          onRowsPerPageChanged: (perPage) {},
                          columnSpacing: 0,
                          rowsPerPage: 5,
                          availableRowsPerPage: const [5],
                          dataRowHeight: Get.height * 0.12,
                          headingRowHeight: Get.height * 0.08,
                          horizontalMargin: 1,
                          columns: <DataColumn>[
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.20,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Application ID',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '107395'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '107217'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '104575'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '123456'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.20,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Status',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Application Created'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Application Received'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Application Rejected'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Application Rejected'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.20,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'First Name',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'anpaad'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Avinav1'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Avinav3'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'kishan'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.20,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Last Name',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Benoit Rajdd'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'malani'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Strong Malani'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'but'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.20,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Submit Date',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Aberty University'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'M.A. Legal Studies (39 Credit)'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Master of Urban Planning and Policy'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'MS Information Systems'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.37,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Institution Name',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'M.A. Human Resources Management (36 Credit)'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'M.A. Legal Studies (39 Credit)'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'Master of Urban Planning and Policy'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        'MS Information Systems'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.37,
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
                                              colorsValue = true;
                                              Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                colorsValue = false;
                                                setState(() {});
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Contact Number',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                colorsValue = true;
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  colorsValue = false;
                                                  setState(() {});
                                                });
                                              });

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      actions: [
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.46,
                                                          child:
                                                              StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                void Function(
                                                                        void
                                                                            Function())
                                                                    setState) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.1),
                                                                      child:
                                                                          TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          hoverColor:
                                                                              Colors.red,
                                                                          prefixIcon:
                                                                              Icon(Icons.search_outlined),
                                                                          hintText:
                                                                              'Search',
                                                                        ),
                                                                      )),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            Colors.orange,
                                                                        value:
                                                                            _checkbox,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _checkbox =
                                                                                !_checkbox;
                                                                            _checkboxListTile =
                                                                                !_checkboxListTile;
                                                                            _checkboxListTile1 =
                                                                                !_checkboxListTile1;
                                                                            _checkboxListTile2 =
                                                                                !_checkboxListTile2;
                                                                            _checkboxListTile3 =
                                                                                !_checkboxListTile3;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          'Select All'),
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '915954895525'),
                                                                    value:
                                                                        _checkboxListTile,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile =
                                                                            !_checkboxListTile;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '91 5748888584748'),
                                                                    value:
                                                                        _checkboxListTile1,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile1 =
                                                                            !_checkboxListTile1;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        ' 91 99415554155'),
                                                                    value:
                                                                        _checkboxListTile2,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile2 =
                                                                            !_checkboxListTile2;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    activeColor:
                                                                        Colors
                                                                            .orange,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    title: const Text(
                                                                        '91 996998469485'),
                                                                    value:
                                                                        _checkboxListTile3,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _checkboxListTile3 =
                                                                            !_checkboxListTile3;
                                                                      });
                                                                    },
                                                                  ),
                                                                  const Divider(),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "OK",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "CANCEL",
                                                                          style: TextStyle(
                                                                              color: Color(0xffFF5722),
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            // onTap: () {},
                                            child: Icon(
                                              Icons.filter_list,
                                              color: colorsValue == true
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                            DataColumn(
                              label: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.25,
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
                                            colorsValue = true;
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              colorsValue = false;
                                              setState(() {});
                                            });
                                          });
                                        },
                                        child: Text(
                                          'Action',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: colorsValue == true
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                          source: TableRow(dataList: response, context)),
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
                                                              height: 10),
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
                                                              height: 10),
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
                        height: 25,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      supportSection(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class TableRow extends DataTableSource {
  final List<RecentApplicationsNewEnhanceResponseModel> dataList;
  final BuildContext;

  TableRow(this.BuildContext, {required this.dataList});
  @override
  DataRow? getRow(int index) {
    String? selectedValue;
    final List<String> value = [
      'None',
    ];

    return Responsive.isMobile(BuildContext)
        ? DataRow.byIndex(
            color: MaterialStateProperty.all(Colors.transparent),
            index: index,
            cells: [
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.33,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].applicationId}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.29,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].applicationStatusName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.29,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].firstName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.29,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].lastName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.29,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].intakeName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.37,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].instName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.37,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].mobileNo}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Center(
                    child: SizedBox(
                      height: Get.height * 0.04,
                      width: Get.width * 0.08,
                      // decoration: const BoxDecoration(
                      //   border: Border.symmetric(
                      //     vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      //   ),
                      // ),
                      child: PopupMenuButton(
                        child: Container(
                          height: Get.height * 0.04,
                          width: Get.width * 0.09,
                          decoration: BoxDecoration(
                            color: const Color(0xff999999),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: const BorderSide(
                                                color: Colors.red)),
                                        actions: [
                                          SizedBox(
                                            height: Get.height * 0.20,
                                            width: Get.width,
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const Center(
                                                  child: Text(
                                                    'Are you sure,want to delete this record?',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff565656),
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.05,
                                                        width: Get.width * 0.25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: kGreen1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'No',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.05,
                                                        width: Get.width * 0.25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: kRed,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: const ListTile(
                                leading: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 25,
                                ),
                                title: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: const BorderSide(
                                                color: Colors.red)),
                                        actions: [
                                          SizedBox(
                                            width: Get.width,
                                            height: Get.height * 0.35,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Create Deferral Request',
                                                      style: TextStyle(
                                                          color: kNavy,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.04,
                                                        width: Get.width * 0.08,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.red,
                                                        ),
                                                        child: const Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                          size: 25,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  height: Get.height * 0.10,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF4F5F7),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Current intake',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff79747E),
                                                          fontSize: 17,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Sep-2022',
                                                        style: TextStyle(
                                                          color: kRed,
                                                          fontSize: 17,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: Get.width,
                                                  height: Get.height * 0.060,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: kGrey4),
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        hint: const Text(
                                                            "Defer to"),
                                                        value: selectedValue,
                                                        items: value
                                                            .map((country) {
                                                          return DropdownMenuItem(
                                                              value: country,
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
                                                            (newValue) {}),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Center(
                                                  child: Container(
                                                    height: Get.height * 0.05,
                                                    width: Get.width * 0.20,
                                                    decoration: BoxDecoration(
                                                      color: kRedLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
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
                              child: const ListTile(
                                leading: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                title: Text(
                                  'Create Deferral Request',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ])
        : DataRow.byIndex(
            color: MaterialStateProperty.all(Colors.transparent),
            index: index,
            cells: [
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.20,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].applicationId}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.20,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].applicationStatusName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.20,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].firstName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.20,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].lastName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.20,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].intakeName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.37,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].instName}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.37,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical:
                            BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "${dataList[index].mobileNo}",
                      style:
                          const TextStyle(fontFamily: 'Roboto', fontSize: 14),
                    )),
                  ),
                ),
                DataCell(
                  Center(
                    child: SizedBox(
                      height: Get.height * 0.04,
                      width: Get.width * 0.08,
                      // decoration: const BoxDecoration(
                      //   border: Border.symmetric(
                      //     vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
                      //   ),
                      // ),
                      child: PopupMenuButton(
                        child: Container(
                          height: Get.height * 0.04,
                          width: Get.width * 0.09,
                          decoration: BoxDecoration(
                            color: const Color(0xff999999),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: const BorderSide(
                                                color: Colors.red)),
                                        actions: [
                                          SizedBox(
                                            height: Get.height * 0.20,
                                            width: Get.width,
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const Center(
                                                  child: Text(
                                                    'Are you sure,want to delete this record?',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff565656),
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.05,
                                                        width: Get.width * 0.25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: kGreen1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'No',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.05,
                                                        width: Get.width * 0.25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: kRed,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: const ListTile(
                                leading: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 25,
                                ),
                                title: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: const BorderSide(
                                                color: Colors.red)),
                                        actions: [
                                          SizedBox(
                                            width: Get.width,
                                            height: Get.height * 0.35,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Create Deferral Request',
                                                      style: TextStyle(
                                                          color: kNavy,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.04,
                                                        width: Get.width * 0.08,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.red,
                                                        ),
                                                        child: const Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                          size: 25,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  height: Get.height * 0.10,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF4F5F7),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Current intake',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff79747E),
                                                          fontSize: 17,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Sep-2022',
                                                        style: TextStyle(
                                                          color: kRed,
                                                          fontSize: 17,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: Get.width,
                                                  height: Get.height * 0.060,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: kGrey4),
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        hint: const Text(
                                                            "Defer to"),
                                                        value: selectedValue,
                                                        items: value
                                                            .map((country) {
                                                          return DropdownMenuItem(
                                                              value: country,
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
                                                            (newValue) {}),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Center(
                                                  child: Container(
                                                    height: Get.height * 0.05,
                                                    width: Get.width * 0.20,
                                                    decoration: BoxDecoration(
                                                      color: kRedLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
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
                              child: const ListTile(
                                leading: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                title: Text(
                                  'Create Deferral Request',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
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
  int get rowCount => 5;

  @override
  int get selectedRowCount => 0;
}
