import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/common_country.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/province_country_response_model.dart';
import 'package:msm_unify/viewModel/province_country_view_model.dart';

import '../../../common/AppConfig/support_section.dart';

class DetailsTabScreen extends StatefulWidget {
  const DetailsTabScreen({Key? key}) : super(key: key);

  @override
  _DetailsTabScreenState createState() => _DetailsTabScreenState();
}

class _DetailsTabScreenState extends State<DetailsTabScreen> {
  String? selectedPartnerType;
  String? _selectedCountry;
  String? _selectedState;
  String? selectedPrincipalCountry;
  final List<String> _partnerType = ['GMO and MSM Unify'];
  final List<String> _state = ['Gujrat', 'MP', 'UP', 'Punjab', 'RJ'];
  final List<String> _principalCountry = ['india', 'pakistan', 'bangladesh'];
  final List<String> _country = ['india', 'pakistan', 'bangladesh'];
  final PageController _controller = PageController(
    initialPage: 0,
  );

  final ProvinceCountryViewModel _provinceCountryViewModel =
      Get.put(ProvinceCountryViewModel());

  List<ProvinceCountryResponseModel> provinceState = [];
  Future<void> provinceCountry() async {
    await _provinceCountryViewModel.provinceCountryViewModel(
        cuntryId: int.parse(_selectedCountry.toString()));
    List<ProvinceCountryResponseModel> response =
        _provinceCountryViewModel.apiResponse.data;
    response.forEach((element) {
      provinceState.add(element);
    });
    setState(() {});
  }

  String? indexed = '0';
  _onPageViewChange(int page) {
    // print("Current Page: " + page.toString());
    indexed = page.toString();
    setState(() {});
    print('index===$indexed');
  }

  @override
  initState() {
    provinceCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: _onPageViewChange,
              controller: _controller,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "General Information",
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      commontextfiled(
                          hintText: 'Edu Global Overseas',
                          labelText: Text(
                            'Company Name (Legal Name)',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(
                          hintText: 'Edu Global Overseas',
                          labelText: Text(
                            'Altemate Companay Name (Trade Name)',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Partner Type (Auto fetched)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                            hint: const Text("GMO and MSM Unify"),
                            value: selectedPartnerType,
                            items: _partnerType.map((partnerType) {
                              return DropdownMenuItem(
                                  value: partnerType,
                                  child: Text(
                                    partnerType,
                                    style: const TextStyle(
                                        color: kGrey4,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedPartnerType = newValue as String?;
                              });
                            }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(hintText: 'Website'),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(hintText: 'Skype ID'),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(hintText: 'WhatsApp ID'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Contact Information",
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(
                          hintText: 'Jay',
                          labelText: Text(
                            'Legal First Name',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(
                          hintText: 'Prajapati',
                          labelText: Text(
                            'Legal Last Name',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Email ID',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Phone Number',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Cell Phone',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonCountry(
                        hintText: 'India',
                        selectedCountry: selectedPrincipalCountry,
                        onchange: (String val) {
                          setState(() {
                            selectedPrincipalCountry = val;
                            print(
                                '_selectedCountryEducation $selectedPrincipalCountry $val');
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Street Address',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'City',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonCountry(
                        hintText: 'India',
                        selectedCountry: _selectedCountry,
                        onchange: (String val) {
                          setState(() {
                            provinceState.clear();
                            _selectedCountry = val;
                            print(
                                '_selectedCountryEducation $_selectedCountry $val');
                          });
                          provinceCountry().then((value) => setState(() {}));
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Province/State',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5),
                            hint: const Text("Gujarat"),
                            value: _selectedState,
                            items: provinceState.map((provinceState) {
                              return DropdownMenuItem(
                                  value: provinceState.provinceName.toString(),
                                  child: Text(
                                    provinceState.provinceName.toString(),
                                    style: const TextStyle(
                                        color: kGrey4,
                                        fontFamily: "Roboto",
                                        fontSize: 13),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedState = newValue as String?;
                              });
                            }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'ZipCode/PostalCode',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      set(),
                      const SizedBox(
                        height: 30,
                      ),
                      supportSection(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Primary Contact Information",
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Full Name',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Phone',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Mobile',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Email ID',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Skype ID',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'WhatsApp ID',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Address,Sector Number,Street,Nearest Landmark',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'City',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Country',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'province/State',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Zipcode/PostalCode',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      set(),
                      const SizedBox(
                        height: 30,
                      ),
                      supportSection(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Secondary Contact Information",
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Full Name',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Phone',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Mobile',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Email ID',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Skype ID',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'WhatsApp ID',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Address,Sector Number,Street,Nearest Landmark',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'City',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Country',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'province/State',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Zipcode/PostalCode',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      set(),
                      const SizedBox(
                        height: 30,
                      ),
                      supportSection(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Director/Owner Contact Information",
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Full Name',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Phone',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Mobile',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Email ID',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Skype ID',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'WhatsApp ID',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Address,Sector Number,Street,Nearest Landmark',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'City',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Country',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'province/State',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Zipcode/PostalCode',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      set(),
                      const SizedBox(
                        height: 30,
                      ),
                      supportSection(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Banking Information",
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Beneficiary Account Number',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Beneficiary Name',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Bank Name',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Branch Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Branch Number',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Bank Address',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'IFSC Code',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                          hintText: '',
                          labelText: Text(
                            'Swift Code',
                            style: TextStyle(
                              color: kGrey.withOpacity(0.5),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Institution Number',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Transit Number',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'PAN Number',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      commontextfiled(
                        hintText: 'Currency',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                            hintText: 'Comment',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      set(),
                      const SizedBox(
                        height: 30,
                      ),
                      supportSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  set() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              indexed == 1.toString() ||
                      indexed == 2.toString() ||
                      indexed == 3.toString()
                  ? GestureDetector(
                      onTap: () {},
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
                    )
                  : const SizedBox(),
              const SizedBox(
                width: 10,
              ),
              indexed == 0.toString() ||
                      indexed == 1.toString() ||
                      indexed == 2.toString() ||
                      indexed == 3.toString()
                  ? GestureDetector(
                      onTap: () {
                        // if (!formGlobalKey.currentState!.validate()) {
                        //   print('Done');
                        // _onPageViewChange(0);
                        if (indexed == 0.toString()) {
                          // _onPageViewChange(1);
                          setState(() {
                            indexed == '1';
                          });
                        } else if (indexed == 1.toString()) {
                          setState(() {
                            indexed == 2.toString();
                            // _onPageViewChange(2);
                          });
                        } else if (indexed == 2.toString()) {
                          setState(() {
                            indexed == 3.toString();
                            // _onPageViewChange(2);
                          });
                        } else if (indexed == 3.toString()) {
                          setState(() {
                            indexed == 4.toString();
                            // _onPageViewChange(2);
                          });
                        }
                        // } else {
                        //   return null;
                        // }
                      },
                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.30,
                        decoration: BoxDecoration(
                            color: kGreen1,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            'Save & Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 11),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                          color: kGreen1,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 11),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor:
                  indexed == 0.toString() ? kGreen1 : Color(0xffAAAAAA),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor:
                  indexed == 1.toString() ? kGreen1 : Color(0xffAAAAAA),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor:
                  indexed == 2.toString() ? kGreen1 : Color(0xffAAAAAA),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor:
                  indexed == 3.toString() ? kGreen1 : Color(0xffAAAAAA),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor:
                  indexed == 4.toString() ? kGreen1 : Color(0xffAAAAAA),
            ),
          ],
        ),
      ],
    );
  }
}
