import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/get_user_task_type_response_model.dart';
import 'package:msm_unify/model/responseModek/user_assignee_response_model.dart';
import 'package:msm_unify/viewModel/get_user_task_type_view_model.dart';
import 'package:msm_unify/viewModel/get_user_task_view_model.dart';
import 'package:msm_unify/viewModel/user_assignee_view_model.dart';

import '../../../model/responseModek/get_user_task_response_model.dart';

class NewUserTaskScreen extends StatefulWidget {
  const NewUserTaskScreen({Key? key}) : super(key: key);

  @override
  _NewUserTaskScreenState createState() => _NewUserTaskScreenState();
}

class _NewUserTaskScreenState extends State<NewUserTaskScreen> {
  String? _selectedCountry;
  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];
  
  String? _selectedPartner;
  String? _selectedOwner;
  String? _selectedType;
  String? _selectedAssignedTo;
  String? _selectedLow;
  String? _selectedStatus;
  String? _selectedMinutes;
  String? _selectedStartHours;
  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];
  final List<String> _owner = ['jay/infoeduglobal@gmail.com'];
  final List<String> _low = ['High', 'Low', 'Medium'];
  final List<String> _status = [
    'Closed',
    'Completed',
    'Deferred',
    'in Progress'
  ];
  String? _selectedAssignee;
  final List<String> _assignee = ['Me', 'Jay/infoeduglobal@gmail.com'];
  final List<String> _minutes = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
  ];
  final List<String> _startHours = [
    '12 Am',
    '01 AM',
    '02 Am',
    '03 Am',
    '04 AM',
    '05 AM',
    '06 AM'
  ];
  final List<String> _assignedTo = ['Jay/infoeduglobal@gmail.com'];
  final List<String> _type = ['Jay/infoeduglobal@gmail.com'];
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final TextEditingController _fromDate = TextEditingController();
  final TextEditingController _toDate = TextEditingController();
  bool _checkboxListTile = false;
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final UserAssigneeViewModel _userAssigneeViewModel =
      Get.put(UserAssigneeViewModel());
  List<UserAssigneeResponseModel> assignee = [];
  Future<void> getUserAssignee() async {
    await _userAssigneeViewModel.userAssigneeViewModel();
    List<UserAssigneeResponseModel> response =
        _userAssigneeViewModel.apiResponse.data;
    response.forEach((element) {
      assignee.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    _toDate.text = DateTime.now().toString();
    getUserAssignee();
    getUserTaskType();
    // DateFormat.MMMd().format(_toDate).toString();
    super.initState();
  }

  final GetUserTaskViewModel _getUserTaskViewModel =
      Get.put(GetUserTaskViewModel());

  final GetUserTaskTypeViewModel _getUserTaskTypeViewModel =
      Get.put(GetUserTaskTypeViewModel());
  List<GetUserTaskTypeResponseModel> getUserTaskTypes = [];
  Future<void> getUserTaskType() async {
    await _getUserTaskTypeViewModel.getUserTaskTypeViewModel();
    List<GetUserTaskTypeResponseModel> response =
        _getUserTaskTypeViewModel.apiResponse.data;
    response.forEach((element) {
      getUserTaskTypes.add(element);
    });
    setState(() {});
  }

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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
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
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'User Tasks',
                      style: TextStyle(
                        color: kNavy,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                          value: _selectedAssignee,
                          items: assignee.map((assignee) {
                            return DropdownMenuItem(
                                value: assignee.userId.toString(),
                                child: Text(
                                  assignee.displayName.toString(),
                                  style: const TextStyle(
                                      color: kGrey4,
                                      fontFamily: "Roboto",
                                      fontSize: 13),
                                ));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedAssignee = newValue as String?;
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _fromDate,
                      validator: (date) {
                        if (date != null) {
                          return "Enter valid date";
                        }
                      },
                      cursorColor: kRed,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.today),
                            onPressed: () async {
                              DateTime date = DateTime(1900);
                              FocusScope.of(context).requestFocus(FocusNode());

                              date = (await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now()))!;
                              _fromDate.text = date.toString();
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
                          hintText: 'From Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      'DD/MM/YYYY',
                      style: TextStyle(
                        color: Color(0xff808080),
                        fontFamily: 'Roboto',
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: _toDate,
                      validator: (date) {
                        if (date != null) {
                          return "Enter valid date";
                        }
                      },
                      cursorColor: kRed,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.today),
                            onPressed: () async {
                              DateTime date = DateTime(1900);
                              FocusScope.of(context).requestFocus(FocusNode());

                              date = (await showDatePicker(
                                  context: context,   
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now()))!;
                              _toDate.text = date.toString();
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
                          hintText: '02/06/2022',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      'DD/MM/YYYY',
                      style: TextStyle(
                        color: Color(0xff808080),
                        fontFamily: 'Roboto',
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        _getUserTaskViewModel.getUserTaskViewModel(
                            toDate: _toDate.text,
                            assignedTo: _selectedAssignee == null
                                ? 81
                                : int.parse(_selectedAssignee.toString()),
                            fromDate: _fromDate.text);
                        setState(() {});
                      },
                      child: Container(
                        height: Get.height * 0.04,
                        width: Get.width * 0.20,
                        decoration: BoxDecoration(
                          color: kGreen1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Search',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SimpleDialog(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Color(0xffe8252a)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              height: Get.height * 0.70,
                                              width: Get.width,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          'Task',
                                                          style: TextStyle(
                                                              color: kNavy,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Poppins'),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            height: Get.height *
                                                                0.03,
                                                            width: Get.width *
                                                                0.07,
                                                            decoration: BoxDecoration(
                                                                color: kRed,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: const Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    DropdownButtonHideUnderline(
                                                      child:
                                                          DropdownButtonFormField(
                                                              isExpanded: true,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Owner',
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              hint:
                                                                  const Text(
                                                                      "jay/infoeduglobal@gmail.com"),
                                                              value:
                                                                  _selectedOwner,
                                                              items: _assignee
                                                                  .map(
                                                                      (assignee) {
                                                                return DropdownMenuItem(
                                                                    value:
                                                                        assignee,
                                                                    child: Text(
                                                                      assignee,
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
                                                                  (newValue) {
                                                                setState(() {
                                                                  _selectedOwner =
                                                                      newValue
                                                                          as String?;
                                                                });
                                                              }),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    DropdownButtonHideUnderline(
                                                      child:
                                                          DropdownButtonFormField(
                                                              isExpanded: true,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Assigned To *',
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              hint: const Text(
                                                                  "jay/infoeduglobal@gmail.com"),
                                                              value:
                                                                  _selectedAssignedTo,
                                                              items: assignee.map(
                                                                  (assigneeTo) {
                                                                return DropdownMenuItem(
                                                                    value: assigneeTo
                                                                        .userId
                                                                        .toString(),
                                                                    child: Text(
                                                                      assigneeTo
                                                                          .displayName
                                                                          .toString(),
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
                                                                  (newValue) {
                                                                setState(() {
                                                                  _selectedAssignedTo =
                                                                      newValue
                                                                          as String?;
                                                                });
                                                              }),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    DropdownButtonHideUnderline(
                                                      child:
                                                          DropdownButtonFormField(
                                                              isExpanded: true,
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                              ),
                                                              borderRadius: BorderRadius
                                                                  .circular(5),
                                                              hint: const Text(
                                                                  "Type *"),
                                                              value:
                                                                  _selectedType,
                                                              items:
                                                                  getUserTaskTypes
                                                                      .map(
                                                                          (type) {
                                                                return DropdownMenuItem(
                                                                    value: type
                                                                        .taskTypeId
                                                                        .toString(),
                                                                    child: Text(
                                                                      type.taskTypeName
                                                                          .toString(),
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
                                                                  (newValue) {
                                                                setState(() {
                                                                  _selectedType =
                                                                      newValue
                                                                          as String?;
                                                                });
                                                              }),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    DropdownButtonHideUnderline(
                                                      child:
                                                          DropdownButtonFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Priority *',
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              hint: const Text(
                                                                  "Low"),
                                                              value:
                                                                  _selectedLow,
                                                              items: _low
                                                                  .map((law) {
                                                                return DropdownMenuItem(
                                                                    value: law,
                                                                    child: Text(
                                                                      law,
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
                                                                  (newValue) {
                                                                setState(() {
                                                                  _selectedLow =
                                                                      newValue
                                                                          as String?;
                                                                });
                                                              }),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    DropdownButtonHideUnderline(
                                                      child:
                                                          DropdownButtonFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Status',
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              hint: const Text(
                                                                  "Not Started"),
                                                              value:
                                                                  _selectedStatus,
                                                              items: _status
                                                                  .map(
                                                                      (status) {
                                                                return DropdownMenuItem(
                                                                    value:
                                                                        status,
                                                                    child: Text(
                                                                      status,
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
                                                                  (newValue) {
                                                                setState(() {
                                                                  _selectedStatus =
                                                                      newValue
                                                                          as String?;
                                                                });
                                                              }),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
                                                      controller: _fromDate,
                                                      validator: (date) {
                                                        if (date != null) {
                                                          return "Enter valid date";
                                                        }
                                                      },
                                                      cursorColor: kRed,
                                                      decoration:
                                                          InputDecoration(
                                                              suffixIcon:
                                                                  IconButton(
                                                                icon: Icon(Icons
                                                                    .today),
                                                                onPressed:
                                                                    () async {
                                                                  DateTime
                                                                      date =
                                                                      DateTime(
                                                                          1900);
                                                                  FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          FocusNode());

                                                                  date = (await showDatePicker(
                                                                      context:
                                                                          context,
                                                                      initialDate:
                                                                          DateTime
                                                                              .now(),
                                                                      firstDate:
                                                                          DateTime(
                                                                              1900),
                                                                      lastDate:
                                                                          DateTime
                                                                              .now()))!;
                                                                  _fromDate
                                                                          .text =
                                                                      formatter
                                                                          .format(
                                                                              date);
                                                                },
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.2),
                                                                  fontFamily:
                                                                      'Roboto'),
                                                              hintText:
                                                                  '02/06/2022',
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              )),
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    const Text(
                                                      'DD/MM/YYYY',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff808080),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    DropdownButtonHideUnderline(
                                                      child:
                                                          DropdownButtonFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              hint: const Text(
                                                                  "Start Hours *"),
                                                              value:
                                                                  _selectedStartHours,
                                                              items: _startHours
                                                                  .map(
                                                                      (startHours) {
                                                                return DropdownMenuItem(
                                                                    value:
                                                                        startHours,
                                                                    child: Text(
                                                                      startHours,
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
                                                                  (newValue) {
                                                                setState(() {
                                                                  _selectedStartHours =
                                                                      newValue
                                                                          as String?;
                                                                });
                                                              }),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    DropdownButtonHideUnderline(
                                                      child:
                                                          DropdownButtonFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              hint: const Text(
                                                                  "Start Minutes *"),
                                                              value:
                                                                  _selectedMinutes,
                                                              items: _minutes
                                                                  .map(
                                                                      (minutes) {
                                                                return DropdownMenuItem(
                                                                    value:
                                                                        minutes,
                                                                    child: Text(
                                                                      minutes,
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
                                                                  (newValue) {
                                                                setState(() {
                                                                  _selectedMinutes =
                                                                      newValue
                                                                          as String?;
                                                                });
                                                              }),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    commontextfiled(
                                                        hintText: 'Subject *'),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
                                                      maxLines: 4,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Description',
                                                        hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
                                                      controller: _fromDate,
                                                      validator: (date) {
                                                        if (date != null) {
                                                          return "Enter valid date";
                                                        }
                                                      },
                                                      cursorColor: kRed,
                                                      decoration:
                                                          InputDecoration(
                                                              suffixIcon:
                                                                  IconButton(
                                                                icon: Icon(Icons
                                                                    .today),
                                                                onPressed:
                                                                    () async {
                                                                  DateTime
                                                                      date =
                                                                      DateTime(
                                                                          1900);
                                                                  FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          FocusNode());

                                                                  date = (await showDatePicker(
                                                                      context:
                                                                          context,
                                                                      initialDate:
                                                                          DateTime
                                                                              .now(),
                                                                      firstDate:
                                                                          DateTime(
                                                                              1900),
                                                                      lastDate:
                                                                          DateTime
                                                                              .now()))!;
                                                                  // _fromDate.text =
                                                                  //     formatter
                                                                  //         .format(date);
                                                                },
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.2),
                                                                  fontFamily:
                                                                      'Roboto'),
                                                              hintText:
                                                                  'Reminder date',
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              )),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    const Text(
                                                      'DD/MM/YYYY',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff808080),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    CheckboxListTile(
                                                      activeColor:
                                                          Colors.orange,
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      title: const Text(
                                                          'Recurring'),
                                                      value: _checkboxListTile,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _checkboxListTile =
                                                              !_checkboxListTile;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.04,
                                                        width: Get.width * 0.20,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: kRedLight,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Add',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                height: Get.height * 0.04,
                                width: Get.width * 0.30,
                                decoration: BoxDecoration(
                                  color: kGreen1,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Add Task",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset('assets/icons/Filter.svg'),
                            const SizedBox(width: 10),
                            SvgPicture.asset('assets/icons/XLSX.svg'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        GetBuilder<GetUserTaskViewModel>(
                          builder: (controller) {
                            if (controller.apiResponse.status == Status.COMPLETE) {
                              List<GetUserTaskResponseModel> response =
                                  controller.apiResponse.data;

                                 return PaginatedDataTable(
                                  onRowsPerPageChanged: (perPage) {},
                                  columnSpacing: 0,
                                  availableRowsPerPage: [5],
                                  rowsPerPage: 5,
                                  dataRowHeight: Get.height * 0.08,
                                  headingRowHeight: Get.height * 0.08,
                                  horizontalMargin: 1,
                                  columns: [
                                    DataColumn(
                                        label: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            height: Get.height * 0.25,
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
                                                    'Owner',
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
                                                            Duration(seconds: 1),
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
                                                InkWell(
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
                                                'Subject',
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
                                            width: Get.width * 0.40,
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
                                                    'Activity Count',
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
                                            width: Get.width * 0.40,
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
                                                    'Due Date',
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
                                                    ))
                                              ],
                                            ))),
                                    DataColumn(
                                        label: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
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
                                                    ))
                                              ],
                                            ))),
                                    DataColumn(
                                        label: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
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
                                                    'Priority',
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
                                                    ))
                                              ],
                                            ))),
                                  ],
                                  source: TableRow(response));
                            } else {
                              if (controller.apiResponse.status == Status.ERROR) {
                                return const Center(
                                  child: Text('No Data Found'),
                                );
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ],
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
                    SizedBox(
                      height: Get.height * 0.030,
                    ),
                  ],
                ),
              ),
              Row(
                children: const [
                  Text(
                    'Number of items: 21',
                    textAlign: TextAlign.left,
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
              supportSection()
            ],
          ),
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final List<GetUserTaskResponseModel> data;

  TableRow(this.data);
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Container(
          height: Get.height * 0.25,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data[index].taskOwner}'),
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
          child: Text('${data[index].taskTypeName}'),
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
          child: Text('${data[index].taskSubject}'),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.40,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data[index].activityCount}'),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.40,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data[index].dueDate}'),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.40,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data[index].taskStatus}'),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.40,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
          child: Text('${data[index].taskPriority}'),
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
