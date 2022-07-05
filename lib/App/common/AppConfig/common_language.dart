import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/language_response_model.dart';
import 'package:msm_unify/viewModel/language_view_model.dart';

class CommonLanguage extends StatefulWidget {
  String? selectedLanguage;
  String? hintText;

  CommonLanguage(
      {super.key, required this.selectedLanguage, required this.hintText});

  @override
  _CommonLanguageState createState() => _CommonLanguageState();
}

class _CommonLanguageState extends State<CommonLanguage> {
  final LanguageViewModel _languageViewModel = Get.put(LanguageViewModel());
  List<LanguageResponseModel> getLanguages = [];
  Future<void> getLanguage() async {
    await _languageViewModel.languageViewModel();
    List<LanguageResponseModel> response = _languageViewModel.apiResponse.data;
    response.forEach((element) {
      getLanguages.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                borderRadius: BorderRadius.circular(5),
                hint: Text(widget.hintText.toString()),
                value: widget.selectedLanguage,
                items: getLanguages.map((language) {
                  return DropdownMenuItem(
                      value: language.languageName.toString(),
                      child: Text(
                        language.languageName.toString(),
                        style: const TextStyle(
                            color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                      ));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    widget.selectedLanguage = newValue as String?;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
