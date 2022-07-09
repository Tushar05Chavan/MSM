import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/province_country_response_model.dart';
import 'package:msm_unify/viewModel/province_country_view_model.dart';

class CommonProvinceState extends StatefulWidget {
  String? selectedProvince;
  String? hintText;

  CommonProvinceState(
      {super.key, required this.selectedProvince, required this.hintText});
  @override
  _CommonProvinceStateState createState() => _CommonProvinceStateState();
}

class _CommonProvinceStateState extends State<CommonProvinceState> {
  final ProvinceCountryViewModel _provinceCountryViewModel =
      Get.put(ProvinceCountryViewModel());

  List<ProvinceCountryResponseModel> provinceState = [];
  Future<void> provinceCountry() async {
    await _provinceCountryViewModel.provinceCountryViewModel(12);
    List<ProvinceCountryResponseModel> response =
        _provinceCountryViewModel.apiResponse.data;
    response.forEach((element) {
      provinceState.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    provinceCountry();
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
                validator: (value) {
                  if (value == null) {
                    return "Province/State is required";
                  }
                },
                borderRadius: BorderRadius.circular(5),
                hint: Text(widget.hintText.toString()),
                value: widget.selectedProvince,
                items: provinceState.map((state) {
                  return DropdownMenuItem(
                      value: state.provinceId.toString(),
                      child: Text(
                        state.provinceName.toString(),
                        style: const TextStyle(
                            color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                      ));
                }).toList(),
                onChanged: (newValue) {
                  widget.selectedProvince = newValue as String?;
                }),
          ),
        ],
      ),
    );
  }
}
