import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/country_dropdown_response_model.dart';
import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
import 'package:msm_unify/model/responseModek/student_visa_response_model.dart';
import 'package:msm_unify/model/responseModek/type_dropdown_response_model.dart';
import 'package:msm_unify/viewModel/country_dropdown_view_model.dart';
import 'package:msm_unify/viewModel/student_visa_View_model.dart';

import '../../../../viewModel/student_visa_view_model.dart';
import '../../../../viewModel/type_dropdown_view_model.dart';
import '../../../common/AppConfig/support_section.dart';
import '../../../common/color_constant.dart';

class StudentVisaTab extends StatefulWidget {
  final int? countryId;
  final int? studentId;
  final StudentViewResponseModel? data;

  const StudentVisaTab({Key? key, this.countryId, this.studentId, this.data})
      : super(key: key);

  @override
  State<StudentVisaTab> createState() => _StudentVisaTabState();
}

class _StudentVisaTabState extends State<StudentVisaTab> {
  final _comment = TextEditingController();

  String? _selectedCountry;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];

  String? _selectedStatus;
  final List<String> _status = ['Applied', 'Approved', 'Refused', 'Withdrawn'];

  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

  final CountryDropViewModel countryDropViewModel =
      Get.put(CountryDropViewModel());

  final StudentVisaViewModel studentVisa = Get.put(StudentVisaViewModel());

  String? _selectedCountryEducation;
  List<CountryDropResponseModel> countries = [];

  Future<void> getCountry() async {
    await countryDropViewModel.countryDropViewModel();
    List<CountryDropResponseModel> response =
        countryDropViewModel.apiResponse.data;

    response.forEach((element) {
      countries.add(element);
    });
    setState(() {});
  }

  final TypeDropViewModel typeDropViewModel = Get.put(TypeDropViewModel());
  String? _selectedType;
  List<TypeDropResponseModel> type = [];

  Future<void> getType() async {
    await typeDropViewModel.typeDropViewModel(
        countryId: int.parse(_selectedCountryEducation.toString()));
    List<TypeDropResponseModel> response = typeDropViewModel.apiResponse.data;
    response.forEach((element) {
      type.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    getType();
    getCountry();
    studentVisa.studentVisaViewModel(
        studentId: widget.data!.genInfo!.studentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (BuildContext context,
                                void Function(void Function()) setState) {
                              return SimpleDialog(
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(color: kRed)),
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
                                              'Student Visa',
                                              style: TextStyle(
                                                  color: kNavy,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            InkWell(
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
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'Country*',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              validator: (title) {
                                                if (title != null) {
                                                  return "Please Enter Title";
                                                }
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              hint: const Text("Country"),
                                              value: _selectedCountryEducation,
                                              items: countries
                                                  .map((countryEducation) {
                                                return DropdownMenuItem(
                                                    value: countryEducation
                                                        .countryId
                                                        .toString(),
                                                    child: Text(
                                                      countryEducation
                                                          .countryName
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: kGrey4,
                                                          fontFamily: "Roboto",
                                                          fontSize: 13),
                                                    ));
                                              }).toList(),
                                              onChanged: (newValue) {
                                                type.clear();
                                                _selectedCountryEducation =
                                                    newValue as String?;
                                                getType().then(
                                                    (value) => setState(() {}));
                                              }),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'Type*',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              validator: (title) {
                                                if (title != null) {
                                                  return "Please Select Type";
                                                }
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              hint: const Text("Type"),
                                              value: _selectedType,
                                              items: type.map((type) {
                                                return DropdownMenuItem(
                                                    value: type.visaTypeName
                                                        .toString(),
                                                    child: Text(
                                                      type.visaTypeName
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: kGrey4,
                                                          fontFamily: "Roboto",
                                                          fontSize: 13),
                                                    ));
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedType =
                                                      newValue as String?;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'Status*',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              validator: (title) {
                                                if (title != null) {
                                                  return "Please Select Status";
                                                }
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              hint: const Text("Status"),
                                              value: _selectedStatus,
                                              items: _status
                                                  .map((countryEducation) {
                                                return DropdownMenuItem(
                                                    value: countryEducation,
                                                    child: Text(
                                                      countryEducation,
                                                      style: const TextStyle(
                                                          color: kGrey4,
                                                          fontFamily: "Roboto",
                                                          fontSize: 13),
                                                    ));
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedStatus =
                                                      newValue as String?;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),
                                        Container(
                                          height: Get.height * 0.3,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: kGrey4),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: TextFormField(
                                              controller: _comment,
                                              cursorColor: kRed,
                                              decoration: InputDecoration(
                                                  hintStyle: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.2),
                                                      fontFamily: 'Roboto'),
                                                  hintText: 'Comment',
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.07,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: Get.height * 0.04,
                                            width: Get.width * 0.25,
                                            decoration: BoxDecoration(
                                                color: kRed,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Center(
                                                child: Text(
                                              'Add',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontFamily: 'Roboto',
                                              ),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      height: Get.height * 0.05,
                      width: Get.width * 0.29,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: kNavy, style: BorderStyle.solid)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.add,
                            color: kNavy,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              'Add More',
                              style: TextStyle(
                                color: kNavy,
                              ),
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
                  SvgPicture.asset(
                    'assets/icons/XLSX.svg',
                    height: 35,
                    width: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),
              GetBuilder<StudentVisaViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.COMPLETE) {
                    List<StudentVisaResponseModel> resp =
                        controller.apiResponse.data;

                    return Column(
                      children: [
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
                                                const Duration(seconds: 2), () {
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
                                                'Type',
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
                                                  const Duration(seconds: 2),
                                                  () {
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
                                  width: Get.width * 0.73,
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
                                            'Issue Date',
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
                                            'Valid Date',
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
                              ),
                            ],
                            source: TableRow(context, resp)),
                      ],
                    );
                  } else {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('No Data Available'),
                    ));
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
                                                              child: const Icon(
                                                                Icons.close,
                                                                color:
                                                                    Colors.red,
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
                                                                  child: Text(add1
                                                                      .toString()),
                                                                ),
                                                                itemBuilder:
                                                                    (context) =>
                                                                        [
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
                                                              child: const Icon(
                                                                Icons.close,
                                                                color:
                                                                    Colors.red,
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
                                                                  child: Text(add1
                                                                      .toString()),
                                                                ),
                                                                itemBuilder:
                                                                    (context) =>
                                                                        [
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
              SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Number of items: 0',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Poppins'),
                  ),
                ],
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
  final List<StudentVisaResponseModel>? data;
  final BuildContext;

  TableRow(
    this.BuildContext,
    this.data,
  );
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
          child: Center(child: Text('${data![index].countryName}')),
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
          child: Center(child: Text('${data![index].visaTypeName}')),
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
          child: Center(child: Text('${data![index].visaStatus}')),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.73,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Center(child: Text('${data![index].issueDate}')),
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
          child: Center(child: Text('${data![index].validUpto}')),
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
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 3;

  @override
  int get selectedRowCount => 0;
}
