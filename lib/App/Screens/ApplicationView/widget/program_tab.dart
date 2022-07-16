import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/application_program_of_program_response_model.dart';
import 'package:msm_unify/model/responseModek/application_view_response_model.dart';
import 'package:msm_unify/model/responseModek/get_program_detail_response_model.dart';
import 'package:msm_unify/model/responseModek/get_program_intake_response_model.dart';
import 'package:msm_unify/model/responseModek/program_mode_response_model.dart';
import 'package:msm_unify/model/responseModek/update_program_response_model.dart';
import 'package:msm_unify/viewModel/application_program_of_program_view_model.dart';
import 'package:msm_unify/viewModel/get_program_detail_view_model.dart';
import 'package:msm_unify/viewModel/get_program_intake_view_model.dart';
import 'package:msm_unify/viewModel/program_mode_view_model.dart';
import 'package:msm_unify/viewModel/update_program_view_model.dart';

import '../../../../viewModel/program_campus_view_model.dart';
import '../../../../viewModel/update_program_view_model.dart';
import '../../ApplicationProgramStudent/widget/application_program_info_tab_screen.dart';

class ProgramTab extends StatefulWidget {
  final ApplicationViewResponseModel data;

  const ProgramTab({super.key, required this.data});
  @override
  _ProgramTabState createState() => _ProgramTabState();
}

class _ProgramTabState extends State<ProgramTab> {
  String? _selectedInstitute;
  final List<String> _institute = ['All', 'Acadamey of Art University', 'ACMi'];

  String? _selectedProgram;
  final List<String> _program = ['Search', 'All', 'None'];

  String? _selcetedIntake;
  final List<String> _intake = ['Search', 'All', 'None'];

  String? _selectedCampus;
  List<String> _campus = ['Search', 'Wolfville', 'None'];

  String? _selectedPresence;
  final List<String> _presence = ['Search', 'All', 'None'];

  String? _selectedMode;
  final List<String> _mode = ['Search', 'All', 'None'];

  String? _selectedPref1;
  final List<String> _Presf1 = ['BCA', 'MCA', 'B.Com', 'M.Com'];

  String? _selectedPref2;
  final List<String> _Presf2 = ['BCA', 'MCA', 'B.Com', 'M.Com'];

  String? _selectedPref3;
  final List<String> _Presf3 = ['BCA', 'MCA', 'B.Com', 'M.Com'];

  final ProgramCampusViewModel _programCampusViewModel =
      Get.put(ProgramCampusViewModel());

  final ApplicationProgramOfProgramViewModel
      _applicationProgramOfProgramViewModel =
      Get.put(ApplicationProgramOfProgramViewModel());

  final ProgramModeViewModel _programModeViewModel =
      Get.put(ProgramModeViewModel());

  final GetProgramIntakeViewModel _getProgramIntakeViewModel =
      Get.put(GetProgramIntakeViewModel());

  final GetProgramDetailViewViewModel _getProgramDetailViewViewModel =
      Get.put(GetProgramDetailViewViewModel());

      final UpdateProgramViewModel updateProgramViewModel =
      Get.put(UpdateProgramViewModel());
  @override
  void initState() {
    print(
        'widget.data.programInfo!.intekId${widget.data.genInfo!.applicationId}');
    print(
        'widget.data.programInfo!.programid${widget.data.programInfo!.programId}');
    // getProgramCampus();
    getProgram();
    getMode();
    getProgramIntake();
    getProgramDetail();
    super.initState();
  }

  // List<ProgramCampusResponseModel> campus = [];
  // Future<void> getProgramCampus() async {
  //   await _programCampusViewModel.programCampusViewModel(
  //       intakeId: widget.data.programInfo!.intekId);
  //   List<ProgramCampusResponseModel> response =
  //       _programCampusViewModel.apiResponse.data;
  //   response.forEach((element) {
  //     campus.add(element);
  //   });
  //   setState(() {});
  // }

  List<ApplicationProgramOfProgramResponseModel> programs = [];
  Future<void> getProgram() async {
    await _applicationProgramOfProgramViewModel
        .applicationProgramOfProgramViewModel(
            institutionId: widget.data.programInfo!.institutionId);
    List<ApplicationProgramOfProgramResponseModel> response =
        _applicationProgramOfProgramViewModel.apiResponse.data;
    response.forEach((element) {
      programs.add(element);
    });
    setState(() {});
  }

  List<ProgramModeResponseModel> modes = [];
  Future<void> getMode() async {
    await _programModeViewModel.programModeViewModel(
        programId: widget.data.programInfo!.programId);
    List<ProgramModeResponseModel> response =
        _programModeViewModel.apiResponse.data;
    response.forEach((element) {
      modes.add(element);
    });
    setState(() {});
  }

  List<GetProgramIntake> getIntakes = [];
  Future<void> getProgramIntake() async {
    await _getProgramIntakeViewModel.getProgramIntakeViewModel(
        programId: widget.data.programInfo!.programId,
        applicationId: widget.data.genInfo!.applicationId);

    List<GetProgramIntake> response =
        _getProgramIntakeViewModel.apiResponse.data;
    response.forEach((element) {
      getIntakes.add(element);
    });
    setState(() {});
  }

  GetProgramDetailResponseModel? getProgramsDetails;
  Future<void> getProgramDetail() async {
    await _getProgramDetailViewViewModel.getProgramDetailViewViewModel(
        programId: widget.data.programInfo!.programId);
    getProgramsDetails = _getProgramDetailViewViewModel.apiResponse.data;
    print('response==$getProgramsDetails');
  }

  // UpdateProgramResponseModel? updatePrograms;
  // Future<void> updateProgram() async {
  //   await updateProgramViewModel.UpdateProgramViewModel(
  //       programId: widget.data.programInfo!.programId);
  //   updatePrograms = updateProgramViewModel.apiResponse.data;
  //   print('response==$updatePrograms');
  // }

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: Get.height * 0.12,
                  width: Get.width * 0.80,
                  decoration: BoxDecoration(
                      color: kGrey6, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Institution',
                        style: TextStyle(
                            color: Color(0xff79747E),
                            fontFamily: 'Poppins',
                            fontSize: 16),
                      ),
                      Text(
                        '${widget.data.programInfo!.instName}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(color: kRed)),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Flexible(
                                        child: Text(
                                          'Program Information',
                                          style: TextStyle(
                                              color: kNavy,
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
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
                                                    BorderRadius.circular(5)),
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                              isExpanded: true,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              hint: const Text("Institution"),
                                              decoration: InputDecoration(
                                                label:
                                                    const Text('Institution'),
                                                labelStyle: const TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: kGrey4,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: kGrey4, width: 2),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: kGrey4, width: 1),
                                                ),
                                              ),
                                              value: _selectedInstitute,
                                              items:
                                                  _institute.map((institute) {
                                                return DropdownMenuItem(
                                                    value: institute,
                                                    child: Text(
                                                      institute,
                                                      style: const TextStyle(
                                                          color: kGrey4,
                                                          fontFamily: "Roboto",
                                                          fontSize: 13),
                                                    ));
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedInstitute =
                                                      newValue as String?;
                                                });
                                              }),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                      Expanded(
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                              isExpanded: true,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              hint: const Text("Program"),
                                              decoration: InputDecoration(
                                                label: const Text('Program'),
                                                labelStyle: const TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: kGrey4,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: kGrey4, width: 2),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                      color: kGrey4, width: 1),
                                                ),
                                              ),
                                              value: _selectedProgram,
                                              items: programs.map((program) {
                                                return DropdownMenuItem(
                                                    value: program.programId
                                                        .toString(),
                                                    child: Text(
                                                      program.programName
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: kGrey4,
                                                          fontFamily: "Roboto",
                                                          fontSize: 13),
                                                    ));
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedProgram =
                                                      newValue as String?;
                                                });
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("Intake"),
                                        decoration: InputDecoration(
                                          label: const Text('Intake'),
                                          labelStyle: const TextStyle(
                                            fontFamily: 'Roboto',
                                            color: kGrey4,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: kGrey4, width: 2),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: kGrey4, width: 1),
                                          ),
                                        ),
                                        value: _selcetedIntake,
                                        items: getIntakes.map((institute) {
                                          return DropdownMenuItem(
                                              value:
                                                  institute.intekId.toString(),
                                              child: Text(
                                                institute.intakeName.toString(),
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selcetedIntake =
                                                newValue as String?;
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  // DropdownButtonHideUnderline(
                                  //   child: DropdownButtonFormField(
                                  //       isExpanded: true,
                                  //       borderRadius: BorderRadius.circular(5),
                                  //       hint: const Text("Campus"),
                                  //       decoration: InputDecoration(
                                  //         label: const Text('Campus'),
                                  //         labelStyle: const TextStyle(
                                  //           fontFamily: 'Roboto',
                                  //           color: kGrey4,
                                  //         ),
                                  //         focusedBorder: OutlineInputBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(15),
                                  //           borderSide: const BorderSide(
                                  //               color: kGrey4, width: 2),
                                  //         ),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(15),
                                  //           borderSide: const BorderSide(
                                  //               color: kGrey4, width: 1),
                                  //         ),
                                  //       ),
                                  //       value: _selectedCampus,
                                  //       items: List.generate(
                                  //           campus.length,
                                  //           (index) => DropdownMenuItem(
                                  //               value: campus[index]
                                  //                   .campusName
                                  //                   .toString(),
                                  //               child: Text(
                                  //                 campus[index]
                                  //                     .campusName
                                  //                     .toString(),
                                  //                 style: const TextStyle(
                                  //                     color: kGrey4,
                                  //                     fontFamily: "Roboto",
                                  //                     fontSize: 13),
                                  //               ))),
                                  //       onChanged: (newValue) {
                                  //         _selectedCampus = newValue as String?;
                                  //       }),
                                  // ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("Student Presence"),
                                        decoration: InputDecoration(
                                          label: const Text('Student Presence'),
                                          labelStyle: const TextStyle(
                                            fontFamily: 'Roboto',
                                            color: kGrey4,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: kGrey4, width: 2),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: kGrey4, width: 1),
                                          ),
                                        ),
                                        value: _selectedPresence,
                                        items: _presence.map((presence) {
                                          return DropdownMenuItem(
                                              value: presence,
                                              child: Text(
                                                presence,
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedPresence =
                                                newValue as String?;
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        borderRadius: BorderRadius.circular(5),
                                        hint: const Text("Mode"),
                                        decoration: InputDecoration(
                                          label: const Text('Mode'),
                                          labelStyle: const TextStyle(
                                            fontFamily: 'Roboto',
                                            color: kGrey4,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: kGrey4, width: 2),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: kGrey4, width: 1),
                                          ),
                                        ),
                                        value: _selectedMode,
                                        items: modes.map((mode) {
                                          return DropdownMenuItem(
                                              value: mode.modeId.toString(),
                                              child: Text(
                                                mode.modeName.toString(),
                                                style: const TextStyle(
                                                    color: kGrey4,
                                                    fontFamily: "Roboto",
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedMode = newValue as String?;
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  const CommonContainer(
                                    title: 'Submission Deadline',
                                    subTitle: '',
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  CommonContainer(
                                    title: 'Duration',
                                    subTitle:
                                        '${getProgramsDetails!.durationTime}',
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  CommonContainer(
                                    title: 'Average Processing Time',
                                    subTitle:
                                        '${getProgramsDetails!.averageProcessingDay}',
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  const CommonContainer(
                                    title: 'Cost of Living',
                                    subTitle: 'CAD 40 one-time',
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.018,
                                  ),
                                  SizedBox(
                                    width: Get.width,
                                    height: Get.height * 0.22,
                                    child: ListView.builder(
                                      itemCount:
                                          getProgramsDetails!.feeDetail!.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          margin: EdgeInsets.all(7),
                                          height: Get.height * 0.10,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${getProgramsDetails!.feeDetail![index].feeType}',
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                      fontFamily: 'Roboto',
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.01,
                                                ),
                                                Text(
                                                  '${getProgramsDetails!.programCurrency} ${getProgramsDetails!.feeDetail![index].feeAmount} ${getProgramsDetails!.feeDetail![index].feeBasis}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        height: Get.height * 0.54,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: kGrey)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: Get.height * 0.03,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Preference 1',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.005,
                                              ),
                                              Container(
                                                height: Get.height * 0.060,
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border:
                                                      Border.all(color: kGrey4),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      hint: const Text(
                                                          "Preference"),
                                                      value: _selectedPref1,
                                                      items: _Presf1.map(
                                                          (preference) {
                                                        return DropdownMenuItem(
                                                            value: preference,
                                                            child: Text(
                                                              preference,
                                                              style: const TextStyle(
                                                                  color: kGrey4,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontSize: 13),
                                                            ));
                                                      }).toList(),
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          _selectedPref1 =
                                                              newValue
                                                                  as String?;
                                                        });
                                                      }),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Sep-2022 -All',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.close,
                                                        color: kRed,
                                                      ))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Preference 2',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.005,
                                              ),
                                              Container(
                                                height: Get.height * 0.060,
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border:
                                                      Border.all(color: kGrey4),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      hint: const Text(
                                                          "Preference"),
                                                      value: _selectedPref2,
                                                      items: _Presf2.map(
                                                          (preference) {
                                                        return DropdownMenuItem(
                                                            value: preference,
                                                            child: Text(
                                                              preference,
                                                              style: const TextStyle(
                                                                  color: kGrey4,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontSize: 13),
                                                            ));
                                                      }).toList(),
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          _selectedPref2 =
                                                              newValue
                                                                  as String?;
                                                        });
                                                      }),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Sep-2022 -All',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.close,
                                                        color: kRed,
                                                      ))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Preference 3',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.005,
                                              ),
                                              Container(
                                                height: Get.height * 0.060,
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border:
                                                      Border.all(color: kGrey4),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      hint: const Text(
                                                          "Preference"),
                                                      value: _selectedPref3,
                                                      items: _Presf3.map(
                                                          (preference) {
                                                        return DropdownMenuItem(
                                                            value: preference,
                                                            child: Text(
                                                              preference,
                                                              style: const TextStyle(
                                                                  color: kGrey4,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontSize: 13),
                                                            ));
                                                      }).toList(),
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          _selectedPref3 =
                                                              newValue
                                                                  as String?;
                                                        });
                                                      }),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Sep-2022 -All',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.close,
                                                        color: kRed,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          left: 25,
                                          top: -10,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 10,
                                                left: 10,
                                                right: 10),
                                            color: Colors.white,
                                            child: Text(
                                              'Backup Program',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Roboto'),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'DISCLAIMER:',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        children: [
                                          TextSpan(
                                              text:
                                                  'The alternative program choices will be accepted in the order of the preference mentioned. The Admissions Officer will select the program to apply in order of preference if the primary program selected is a) not available; b) student is ineligible; c) other reasons which may not allow submission of application program. The Admissions Officer will take the alternative choices and preference order as final and will submit the application accordingly.',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: Get.width * 0.20,
                                      height: Get.height * 0.05,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Center(
                                          child: Text(
                                        'Update',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.09,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8),
                        )),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.15,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Program',
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.programInfo!.programName} ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.09,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Intake",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.programInfo!.intakeName}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.11,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Campus",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.programInfo!.campusName}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.09,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mode",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.programInfo!.modeName}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.09,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Student Presence",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.programInfo!.shoreType}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.09,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Duration",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.programInfo!.durationTime}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.09,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Average Processing Time",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.programInfo!.averageProcessingDay}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.09,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cost of Living",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.programInfo!.instCostofLivingYear} CAD per Year',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.09,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Application Fee",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '80 CAD-one-time',
                    style: TextStyle(
                        color: Color(0xff192A3E),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.09,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Tuition Fee",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '18800 CAD-per year',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.09,
              width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: kGrey6, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Partner Type",
                    style: TextStyle(
                        color: Color(0xff79747E),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  Text(
                    '${widget.data.programInfo!.partnerTypeName}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            supportSection()
          ],
        ),
      ),
    );
  }
}
