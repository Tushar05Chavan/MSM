import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/viewModel/country_view_model.dart';

class CommonCountry extends StatefulWidget {
  String? selectedCountry;
  String? hintText;
  Function(String val)? onchange;

  CommonCountry(
      {super.key,
      required this.selectedCountry,
      required this.hintText,
      this.onchange});

  @override
  _CommonCountryState createState() => _CommonCountryState();
}

class _CommonCountryState extends State<CommonCountry> {
  final CountryViewModel _countryViewModel = Get.put(CountryViewModel());

  List<CountryResponseModel> countryS = [];
  Future<void> getCountry() async {
    await _countryViewModel.countryViewModel();
    List<CountryResponseModel> response = _countryViewModel.apiResponse.data;
    response.forEach((element) {
      countryS.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    getCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
                isExpanded: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                validator: (value) {
                                          if (value == null) {
                                            return "Country of education is required";
                                          }
                                        },
                borderRadius: BorderRadius.circular(5),
                hint: Text('Country of Education'),
                value: widget.selectedCountry,
                items: countryS.map((province) {
                  return DropdownMenuItem(
                      value: province.countryId.toString(),
                      child: Text(
                        province.countryName.toString(),
                        style: const TextStyle(
                            color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                      ));
                }).toList(),
                onChanged: (String? newValue) {
                  widget.selectedCountry = newValue;
                  print('widget>>>>>${widget.selectedCountry}');
                  widget.onchange!(widget.selectedCountry!);
                }),
          ),
        ],
      ),
    );
  }
}
