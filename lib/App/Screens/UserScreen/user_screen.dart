import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/Screens/UserScreen/widget/add_user_screen.dart';
import 'package:msm_unify/App/Screens/UserScreen/widget/update_user_screen.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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

  String? _selectedPartner;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];

  String? _selectedType;
  final List<String> _type = ['All', 'Recently Modified', 'Last 10 Modified'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    _selectedCountry = newValue as String?;
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
                                      color: Colors.black.withOpacity(0.2)),
                                  hintText: 'What do you Want to study?',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    _selectedPartner = newValue as String?;
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
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    InkWell(
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
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Users',
                      style: TextStyle(
                          color: kNavy,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AddUserScreen());
                      },
                      child: Container(
                          height: Get.height * 0.050,
                          // width: Get.width * 0.30,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                color: kNavy,
                                style: BorderStyle.solid,
                                width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.add,
                                size: 20,
                                color: kNavy,
                              ),
                              Text(
                                'Add User',
                                style: TextStyle(
                                  color: kNavy,
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.020,
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
                        value: _selectedType,
                        items: _type.map((student) {
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
                            _selectedType = newValue as String?;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.020,
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
                      validator: (search) {
                        if (search != null) {
                          return "Please Enter Keyword";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "search keyword",
                        suffixIcon: Icon(Icons.search,
                            color: Colors.grey.withOpacity(0.5)),
                        border: InputBorder.none,
                        // enabledBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(20),
                        //     borderSide: const BorderSide(
                        //       color: kGrey,
                        //       width: 2,
                        //     )),
                        // focusedBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(20),
                        //     borderSide: const BorderSide(
                        //       color: kColorPrimary,
                        //       width: 2,
                        //     )),
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2),
                            fontFamily: 'Roboto'),
                      ),
                    )),
                SizedBox(
                  height: Get.height * 0.02,
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
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Column(
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
                                      'Name',
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
                                            'Email ID/Username',
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
                                              const Duration(seconds: 2), () {
                                            // colorsValue = false;
                                            setState(() {});
                                          });
                                        });
                                      },
                                      child: const Text(
                                        'Reporting Manager for GMO',
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
                                              const Duration(seconds: 2), () {
                                            // colorsValue = false;
                                            setState(() {});
                                          });
                                        });
                                      },
                                      child: const Text(
                                        'Reporting Manager for MSM Unify',
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
                                              const Duration(seconds: 2), () {
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
                                    Future.delayed(const Duration(seconds: 2),
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
                            ),
                          ),
                        ],
                        source: TableRow(context)),
                  ],
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
                SizedBox(
                  height: Get.height * 0.025,
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
  final BuildContext;

  TableRow(this.BuildContext);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        InkWell(
          onTap: () {
            Get.to(() => UpdateUserScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Jay',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            Get.to(() => UpdateUserScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'infoeduglobal.org@gmail.com',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            Get.to(() => UpdateUserScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.53,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            Get.to(() => UpdateUserScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.73,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Dweeti Anadkat',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            Get.to(() => UpdateUserScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: () {
            Get.to(() => UpdateUserScreen());
          },
          child: Container(
            height: Get.height * 0.17,
            width: Get.width * 0.43,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
              ),
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
