import 'package:flutter/material.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/commission_institution_response_model.dart';
import 'package:msm_unify/model/responseModek/commission_intake_dropdown_response_model.dart';
import 'package:msm_unify/model/responseModek/test_score_exam_drop_response_model.dart';

DropdownButtonHideUnderline InstitutionDropdown(
    {String? selectedInstitute,
    List<CommissionInstitutionResponseModel>? institution}) {
  return DropdownButtonHideUnderline(
    child: DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
          isExpanded: true,
          borderRadius: BorderRadius.circular(5),
          hint: const Text("All"),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: kGrey4, width: 1),
                borderRadius: BorderRadius.circular(15)),
            label: const Text('Institute'),
            labelStyle: const TextStyle(
              fontFamily: 'Roboto',
              color: kGrey4,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: kGrey, width: 2)),
          ),
          value: selectedInstitute,
          items: institution!.map((institution) {
            return DropdownMenuItem(
                value: institution.instName.toString(),
                child: Text(
                  institution.instName.toString(),
                  style: const TextStyle(
                      color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                ));
          }).toList(),
          onChanged: (newValue) {
            selectedInstitute = newValue as String?;
          }),
    ),
  );
}

DropdownButtonHideUnderline IntakeDropdown(
    {String? selectedIntake,
    List<CommissionIntakeDropdownResponseModel>? intake}) {
  return DropdownButtonHideUnderline(
    child: DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
          borderRadius: BorderRadius.circular(5),
          hint: const Text("All"),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: kGrey4, width: 1),
                borderRadius: BorderRadius.circular(15)),
            label: const Text('Intake'),
            labelStyle: const TextStyle(
              fontFamily: 'Roboto',
              color: kGrey4,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: kGrey, width: 2)),
          ),
          value: selectedIntake,
          items: intake!.map((intake) {
            return DropdownMenuItem(
                value: intake.intakeName.toString(),
                child: Text(
                  intake.intakeName.toString(),
                  style: const TextStyle(
                      color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                ));
          }).toList(),
          onChanged: (newValue) {
            selectedIntake = newValue as String?;
          }),
    ),
  );
}

DropdownButtonHideUnderline examDropDown(
    {String? selectedExam, List<ExamDropResponseModel>? exam}) {
  return DropdownButtonHideUnderline(
    child: DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
          borderRadius: BorderRadius.circular(5),
          hint: const Text("All"),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: kGrey4, width: 1),
                borderRadius: BorderRadius.circular(15)),
            label: const Text('Select exam Type'),
            labelStyle: const TextStyle(
              fontFamily: 'Roboto',
              color: kGrey4,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: kGrey, width: 2)),
          ),
          value: selectedExam,
          items: exam!.map((exam) {
            return DropdownMenuItem(
                value: exam.reqName.toString(),
                child: Text(
                  exam.reqName.toString(),
                  style: const TextStyle(
                      color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                ));
          }).toList(),
          onChanged: (newValue) {
            selectedExam = newValue as String?;
          }),
    ),
  );
}
