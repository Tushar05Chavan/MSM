import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/common_country.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/commission_institution_response_model.dart';
import 'package:msm_unify/model/responseModek/commission_intake_dropdown_response_model.dart';
import 'package:msm_unify/viewModel/commision_intake_dropdown_view_model.dart';
import 'package:msm_unify/viewModel/commission_institution_view_model.dart';

import '../../../model/responseModek/country_dropdown_response_model.dart';
import '../../../viewModel/country_dropdown_view_model.dart';
import 'widget/institution_dropdown.dart';

class PendingOfferScreen extends StatefulWidget {
  const PendingOfferScreen({Key? key}) : super(key: key);

  @override
  State<PendingOfferScreen> createState() => _PendingOfferScreenState();
}

class _PendingOfferScreenState extends State<PendingOfferScreen> {
  final _startDate = TextEditingController();
  final _endDate = TextEditingController();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  CommissionIntakeDropdownViewModel offerIntakeDropViewModel =
      Get.put(CommissionIntakeDropdownViewModel());

  final CommissionInstitutionViewModel _intakeInstituteDropViewModel =
      Get.put(CommissionInstitutionViewModel());

  final CountryDropViewModel countryDropViewModel =
      Get.put(CountryDropViewModel());

  String? _selectedCounty;
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
  bool _advance = false;
  bool _get = false;

  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];

  String? _selectedInstitute;
  List<CommissionInstitutionResponseModel> institutions = [];
  Future<void> getInstitution() async {
    await _intakeInstituteDropViewModel.commissionInstitutionViewModel();
    List<CommissionInstitutionResponseModel> response =
        _intakeInstituteDropViewModel.apiResponse.data;
    response.forEach((element) {
      institutions.add(element);
    });
    setState(() {});
  }

  String? _selectedIntake;
  List<CommissionIntakeDropdownResponseModel> intakes = [];
  Future<void> getIntake() async {
    await offerIntakeDropViewModel.commissionIntakeDropdownViewModel();
    List<CommissionIntakeDropdownResponseModel> response =
        offerIntakeDropViewModel.apiResponse.data;

    response.forEach((element) {
      intakes.add(element);
    });
    setState(() {});
  }

  String? _selectedCountry;
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

  @override
  void initState() {
    getInstitution();
    getIntake();
    getCountry();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
              SizedBox(
                height: Get.height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    Text(
                      'Pending Offer Letter',
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
                height: Get.height * 0.020,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  // height: Get.height * 1.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kGrey6, width: 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 0.5,
                            offset: const Offset(0.3, 0.3),
                            spreadRadius: 0.7),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        TextFormField(
                          controller: _startDate,
                          validator: (date) {
                            if (date != null) {
                              return "Enter valid date";
                            }
                          },
                          cursorColor: kRed,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.today),
                                onPressed: () async {
                                  DateTime date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  date = (await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now()))!;
                                  _startDate.text = formatter.format(date);
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  )),
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.2),
                                  fontFamily: 'Roboto'),
                              hintText: '01/05/2022',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        TextFormField(
                          controller: _endDate,
                          cursorColor: kRed,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.today),
                                onPressed: () async {
                                  DateTime date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  date = (await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now()))!;
                                  _endDate.text = formatter.format(date);
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  )),
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.2),
                                  fontFamily: 'Roboto'),
                              hintText: '31/05/2022',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        InstitutionDropdown(
                            selectedInstitute: _selectedInstitute,
                            institution: institutions),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        IntakeDropdown(
                            selectedIntake: _selectedIntake, intake: intakes),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        CommonCountry(
                            selectedCountry: _selectedCountry,
                            hintText: "Country*"),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _get = true;
                                });
                              },
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width * 0.20,
                                decoration: BoxDecoration(
                                    color: kRedLight,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text('Get',
                                        style: const TextStyle(
                                            color: Colors.white))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        _advance == false
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _advance = true;
                                          });
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: kRedLight,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: const Center(
                                            child: Text('Advance',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/Filter.svg',
                                        height: 30,
                                        width: 30,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/XLSX.svg',
                                        height: 30,
                                        width: 30,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/colfilter.svg',
                                        height: 30,
                                        width: 30,
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/Group 2222.svg',
                                        height: 25,
                                        width: 25,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.010,
                                  ),
                                  _get == false
                                      ? Container(
                                          height: Get.height * 0.20,
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: kGrey4),
                                          ),
                                          child: const Center(
                                            child: Text('No Data',
                                                style: TextStyle(
                                                  color: kGrey5,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                )),
                                          ),
                                        )
                                      : Container(
                                          height: Get.height * 0.77,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: kGrey4),
                                          ),
                                          child: Column(
                                            children: [
                                              Column(
                                                children: [
                                                  PaginatedDataTable(
                                                      onRowsPerPageChanged:
                                                          (perPage) {},
                                                      columnSpacing: 0,
                                                      rowsPerPage: 10,
                                                      dataRowHeight:
                                                          Get.height * 0.05,
                                                      headingRowHeight:
                                                          Get.height * 0.08,
                                                      horizontalMargin: 1,
                                                      columns: [
                                                        DataColumn(
                                                            label: Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                                height:
                                                                    Get.height *
                                                                        0.10,
                                                                width: Get
                                                                        .width *
                                                                    0.33,
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xffF5F5F5),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            2)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          // colorsValue = true;
                                                                          Future.delayed(
                                                                              const Duration(seconds: 2),
                                                                              () {
                                                                            // colorsValue = false;
                                                                            setState(() {});
                                                                          });
                                                                        });
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'S No',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            // colorsValue = true;
                                                                            Future.delayed(const Duration(seconds: 1),
                                                                                () {
                                                                              // colorsValue = false;
                                                                              setState(() {});
                                                                            });
                                                                          });
                                                                        },
                                                                        // onTap: () {},
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .filter_list,
                                                                          color:
                                                                              Colors.black,
                                                                        ))
                                                                  ],
                                                                ))),
                                                        DataColumn(
                                                            label: Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                                height: Get
                                                                        .height *
                                                                    0.10,
                                                                width: Get
                                                                        .width *
                                                                    0.430,
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xffF5F5F5),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            2)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          // colorsValue = true;
                                                                          Future.delayed(
                                                                              const Duration(seconds: 2),
                                                                              () {
                                                                            // colorsValue = false;
                                                                            setState(() {});
                                                                          });
                                                                        });
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'Institution',
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        softWrap:
                                                                            false,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            // colorsValue = true;
                                                                            Future.delayed(const Duration(seconds: 1),
                                                                                () {
                                                                              // colorsValue = false;
                                                                              setState(() {});
                                                                            });
                                                                          });
                                                                        },
                                                                        // onTap: () {},
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .filter_list,
                                                                          color:
                                                                              Colors.black,
                                                                        ))
                                                                  ],
                                                                ))),
                                                        DataColumn(
                                                          label: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                            height: Get.height *
                                                                0.10,
                                                            width: Get.width *
                                                                0.43,
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0xffF5F5F5),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2)),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        // colorsValue = true;
                                                                        Future.delayed(
                                                                            const Duration(seconds: 2),
                                                                            () {
                                                                          // colorsValue = false;
                                                                          setState(
                                                                              () {});
                                                                        });
                                                                      });
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Business Region',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child: InkWell(
                                                                      onTap: () {
                                                                        setState(
                                                                            () {
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
                                                                        Icons
                                                                            .filter_list,
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn(
                                                            label: Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                                height:
                                                                    Get.height *
                                                                        0.10,
                                                                width: Get
                                                                        .width *
                                                                    0.53,
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xffF5F5F5),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            2)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            // colorsValue = true;
                                                                            Future.delayed(const Duration(seconds: 2),
                                                                                () {
                                                                              // colorsValue = false;
                                                                              setState(() {});
                                                                            });
                                                                          });
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          'Pending Offer letter count',
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child: InkWell(
                                                                          onTap: () {
                                                                            setState(() {
                                                                              // colorsValue = true;
                                                                              Future.delayed(const Duration(seconds: 1), () {
                                                                                // colorsValue = false;
                                                                                setState(() {});
                                                                              });
                                                                            });
                                                                          },
                                                                          // onTap: () {},
                                                                          child: const Icon(
                                                                            Icons.filter_list,
                                                                            color:
                                                                                Colors.black,
                                                                          )),
                                                                    )
                                                                  ],
                                                                ))),
                                                        DataColumn(
                                                            label: Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2),
                                                                height:
                                                                    Get.height *
                                                                        0.10,
                                                                width: Get
                                                                        .width *
                                                                    0.48,
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xffF5F5F5),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            2)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            // colorsValue = true;
                                                                            Future.delayed(const Duration(seconds: 2),
                                                                                () {
                                                                              // colorsValue = false;
                                                                              setState(() {});
                                                                            });
                                                                          });
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          '>TAT(Delayed count)',
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child: InkWell(
                                                                          onTap: () {
                                                                            setState(() {
                                                                              // colorsValue = true;
                                                                              Future.delayed(const Duration(seconds: 1), () {
                                                                                // colorsValue = false;
                                                                                setState(() {});
                                                                              });
                                                                            });
                                                                          },
                                                                          // onTap: () {},
                                                                          child: const Icon(
                                                                            Icons.filter_list,
                                                                            color:
                                                                                Colors.black,
                                                                          )),
                                                                    )
                                                                  ],
                                                                ))),
                                                      ],
                                                      source: TableRow()),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                child: Container(
                                                  height: Get.height * 0.08,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black
                                                            .withOpacity(0.2)),
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
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  actions: [
                                                                    Stack(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              Get.height * 0.80,
                                                                          width:
                                                                              Get.width,
                                                                          child:
                                                                              StatefulBuilder(
                                                                            builder:
                                                                                (BuildContext context, void Function(void Function()) setState) {
                                                                              return Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  const Text(
                                                                                    'Filter Builder',
                                                                                    style: TextStyle(fontFamily: 'Roboto', fontSize: 22, color: Colors.black),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: Get.height * 0.04,
                                                                                  ),
                                                                                  const Divider(),
                                                                                  SizedBox(
                                                                                    height: Get.height * 0.04,
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      PopupMenuButton(
                                                                                          child: Container(
                                                                                            padding: const EdgeInsets.all(10),
                                                                                            decoration: BoxDecoration(
                                                                                              color: Colors.red.withOpacity(0.2),
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                            ),
                                                                                            child: Text(add.toString()),
                                                                                          ),
                                                                                          itemBuilder: (context) => [
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
                                                                                              setState(() {
                                                                                                _addGroup = true;
                                                                                              });
                                                                                            },
                                                                                            child: const Text('Add Group'),
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
                                                                                  _addCondition == true
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
                                                                          right:
                                                                              5,
                                                                          bottom:
                                                                              5,
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: const Text(
                                                                                  'OK',
                                                                                  style: TextStyle(color: Colors.red, fontSize: 16),
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
                                                                                  style: TextStyle(color: Colors.red, fontSize: 16),
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
                                                            color: Color(
                                                                0xffe8252a),
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ],
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _advance = false;
                                            });
                                          },
                                          child: Container(
                                            height: Get.height * 0.045,
                                            width: Get.width * 0.25,
                                            decoration: BoxDecoration(
                                                color: kRed,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                              child: Text(
                                                'Basic',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        width: double.infinity,
                                        height: 300,
                                        child: LineChart(
                                          LineChartData(
                                              gridData: FlGridData(
                                                drawHorizontalLine: true,
                                                drawVerticalLine: false,
                                              ),
                                              titlesData: FlTitlesData(
                                                show: true,
                                                rightTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                                topTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                              ),
                                              borderData:
                                                  FlBorderData(show: false),
                                              lineBarsData: [
                                                LineChartBarData(
                                                    isCurved: true,
                                                    spots: [
                                                      const FlSpot(0, 1),
                                                      const FlSpot(0, 0),
                                                      const FlSpot(2, 10),
                                                      const FlSpot(3, 7),
                                                      const FlSpot(4, 12),
                                                      const FlSpot(5, 13),
                                                      const FlSpot(6, 17),
                                                      const FlSpot(7, 15),
                                                      const FlSpot(8, 20)
                                                    ])
                                              ]),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          color: Colors.black.withOpacity(0.2),
                                        )),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Drop Filter Fileds Here',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 15,
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return const AlertDialog();
                                                              });
                                                        },
                                                        child: SvgPicture.asset(
                                                          'assets/icons/Group 2222.svg',
                                                          height: 23,
                                                          width: 23,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      SvgPicture.asset(
                                                          'assets/icons/XLSX.svg'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 1,
                                            ),
                                            Container(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              width: Get.width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Drop Data Filed Here',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 15,
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.05,
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: 3,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Container(
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                              height:
                                                                  Get.height *
                                                                      0.05,
                                                              decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xffE0E0E0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              13)),
                                                              child: Row(
                                                                children: const [
                                                                  Text(
                                                                    'Applications',
                                                                    style:
                                                                        TextStyle(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .filter_list,
                                                                    color: Colors
                                                                        .grey,
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              width: Get.width,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Drop Data Filed Here',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      height: Get.height * 0.05,
                                                      width: Get.width * 0.30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                          )),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      height: Get.height * 0.05,
                                                      width: Get.width * 0.245,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                        color: Colors.grey,
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                color: Colors.grey,
                                              )),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: Get.height * 0.05,
                                                    width: Get.width * 0.25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        border: const Border
                                                                .symmetric(
                                                            vertical: BorderSide(
                                                                color: Colors
                                                                    .grey))),
                                                    child: const Center(
                                                      child: Text(
                                                        'Grand Total ',
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),
              supportSection()
            ],
          ),
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
          width: Get.width * 0.430,
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
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.48,
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
  int get rowCount => 5;

  @override
  int get selectedRowCount => 0;
}
