// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';

// import '../../../../model/responseModek/level_of_education_response_model.dart';
// import '../../../common/color_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:msm_unify/Api/api_response.dart';
// import 'package:msm_unify/App/common/AppConfig/common_country.dart';
// import 'package:msm_unify/App/common/AppConfig/common_language.dart';
// import 'package:msm_unify/model/responseModek/country_response_model.dart';
// import 'package:msm_unify/model/responseModek/student_education_province_response_model.dart';
// import 'package:msm_unify/model/responseModek/student_view_response_model.dart';
// import 'package:msm_unify/viewModel/country_view_model.dart';
// import 'package:msm_unify/viewModel/level_of_education_view_model.dart';

// import '../../../../model/responseModek/grade_response_model.dart';
// import '../../../../model/responseModek/level_of_education_response_model.dart';
// import '../../../../viewModel/grade_view_model.dart';
// import '../../../../viewModel/student_education_province_view_model.dart';
// import '../../../../viewModel/student_education_update_view_model.dart';
// import '../../../common/AppConfig/support_section.dart';
// import '../../../common/color_constant.dart';
// import 'grade_details.dart';

// class GradeDetails extends StatefulWidget {
//   GradeDetails(
//       {Key? key,
//       required this.levelOfEdu,
//       required this.highestLevelOfEducationName})
//       : super(key: key);
//   List<LevelOfEducationResponseModel> levelOfEdu;

//   final String highestLevelOfEducationName;
//   @override
//   State<GradeDetails> createState() => _GradeDetailsState();
// }

// class _GradeDetailsState extends State<GradeDetails> {
//   List<CountryResponseModel> countryS = [];
//   final CountryViewModel _countryViewModel = Get.put(CountryViewModel());
//   final TextEditingController _degreeawarded = TextEditingController();
//   String? _selectedLevelOfEducation;
//   List<EducationProvinceResponseModel> provinceState = [];
//   String? _selectedProvince;
//   String? _selectedPrimaryLanguage;
//   final TextEditingController _startDate = TextEditingController();
//   final TextEditingController _endDate = TextEditingController();
//   final DateFormat formatter = DateFormat('dd-MM-yyyy');

//   String selectedCountryEducation = '';
//   @override
//   void initState() {
//     provinceCountry();
//     getCountry();
//     super.initState();
//   }

//   Future<void> getCountry() async {
//     await _countryViewModel.countryViewModel();
//     List<CountryResponseModel> response = _countryViewModel.apiResponse.data;
//     response.forEach((element) {
//       countryS.add(element);
//     });
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           const Text(
//             'Add School Details',
//             style: TextStyle(
//                 color: kNavy,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600),
//           ),
//           InkWell(
//             onTap: () => Get.back(),
//             child: Container(
//               height: Get.height * 0.04,
//               width: Get.width * 0.08,
//               decoration: BoxDecoration(
//                   color: kRed, borderRadius: BorderRadius.circular(10)),
//               child: const Icon(Icons.close, color: Colors.white),
//             ),
//           ),
//         ]),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButtonFormField(
//                 isExpanded: true,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15))),
//                 validator: (title) {
//                   return title != null ? "Level of Education" : null;
//                 },
//                 borderRadius: BorderRadius.circular(5),
//                 hint: const Text("Level Of Education"),
//                 value: _selectedLevelOfEducation,
//                 items: widget.levelOfEdu.map((levelOfEducation) {
//                   return DropdownMenuItem(
//                       value: levelOfEducation.eduLevelId.toString(),
//                       child: Text(
//                         levelOfEducation.eduLevelName.toString(),
//                         style: const TextStyle(
//                             color: kGrey4, fontFamily: "Roboto", fontSize: 13),
//                       ));
//                 }).toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedLevelOfEducation = newValue as String?;
//                   });
//                 }),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         DropdownButtonHideUnderline(
//           child: DropdownButtonFormField(
//               isExpanded: true,
//               decoration: InputDecoration(
//                   label: const Text('Country of Institution',
//                       style: TextStyle(color: kGrey)),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15))),
//               validator: (title) {
//                 if (title != null) {
//                   return "Country of institution";
//                 }
//               },
//               borderRadius: BorderRadius.circular(5),
//               hint: const Text("Country of institution"),
//               value: selectedCountryEducation,
//               items: countryS.map((countryDrop) {
//                 return DropdownMenuItem(
//                     value: countryDrop.countryId.toString(),
//                     child: Text(
//                       countryDrop.countryName.toString(),
//                       style: TextStyle(
//                           color: Colors.black.withOpacity(0.7),
//                           fontFamily: "Roboto",
//                           fontSize: 13),
//                     ));
//               }).toList(),
//               onChanged: (newValue) {
//                 provinceState.clear();
//                 selectedCountryEducation = newValue as String;

//                 provinceCountry().then((value) => setState(() {}));
//               }),
//         ),
//         TextFormField(
//           validator: (fName) {
//             return fName != null ? "Name Of Institution" : null;
//           },
//           cursorColor: kRed,
//           decoration: InputDecoration(
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: const BorderSide(
//                     color: Colors.black,
//                   )),
//               hintStyle: TextStyle(
//                   color: Colors.black.withOpacity(0.2), fontFamily: 'Roboto'),
//               hintText: 'Name Of Institution',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               )),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         DropdownButtonHideUnderline(
//           child: DropdownButtonFormField(
//               isExpanded: true,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               validator: (value) {
//                 if (value == null) {
//                   return "Province/State is required";
//                 }
//               },
//               borderRadius: BorderRadius.circular(5),
//               hint: Text('${widget.highestLevelOfEducationName}'),
//               value: _selectedProvince,
//               items: provinceState.map((state) {
//                 return DropdownMenuItem(
//                     value: state.provinceName.toString(),
//                     child: Text(
//                       state.provinceName.toString(),
//                       style: const TextStyle(
//                           color: kGrey4, fontFamily: "Roboto", fontSize: 13),
//                     ));
//               }).toList(),
//               onChanged: (newValue) {
//                 _selectedProvince = newValue as String?;
//               }),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         CommonLanguage(
//             hintText: 'Primary Language',
//             selectedLanguage: _selectedPrimaryLanguage),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _startDate,
//           cursorColor: kRed,
//           decoration: InputDecoration(
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.today),
//                 onPressed: () async {
//                   DateTime date = DateTime(1900);
//                   FocusScope.of(context).requestFocus(FocusNode());

//                   date = (await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime.now()))!;
//                   _startDate.text = formatter.format(date);
//                 },
//               ),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: const BorderSide(
//                     color: Colors.black,
//                   )),
//               hintStyle: TextStyle(
//                   color: Colors.black.withOpacity(0.2), fontFamily: 'Roboto'),
//               hintText: 'Start date DD/MM/YYYY',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               )),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _endDate,
//           cursorColor: kRed,
//           decoration: InputDecoration(
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.today),
//                 onPressed: () async {
//                   DateTime date = DateTime(1900);
//                   FocusScope.of(context).requestFocus(FocusNode());

//                   date = (await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime.now()))!;
//                   _endDate.text = formatter.format(date);
//                 },
//               ),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: const BorderSide(
//                     color: Colors.black,
//                   )),
//               hintStyle: TextStyle(
//                   color: Colors.black.withOpacity(0.2), fontFamily: 'Roboto'),
//               hintText: 'End date DD/MM/YYYY',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               )),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _degreeawarded,
//           cursorColor: kRed,
//           decoration: InputDecoration(
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.today),
//                 onPressed: () async {
//                   DateTime date = DateTime(1900);
//                   FocusScope.of(context).requestFocus(FocusNode());

//                   date = (await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime.now()))!;
//                   _degreeawarded.text = formatter.format(date);
//                 },
//               ),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: const BorderSide(
//                     color: Colors.black,
//                   )),
//               hintStyle: TextStyle(
//                   color: Colors.black.withOpacity(0.2), fontFamily: 'Roboto'),
//               hintText: 'Degree awarded date DD/MM/YYYY',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               )),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           validator: (fName) {
//             if (fName != null) {
//               return "Name Of Institution";
//             }
//           },
//           cursorColor: kRed,
//           decoration: InputDecoration(
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: const BorderSide(
//                     color: Colors.black,
//                   )),
//               hintStyle: TextStyle(
//                   color: Colors.black.withOpacity(0.2), fontFamily: 'Roboto'),
//               hintText: 'Degree awarded/ Program name',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               )),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             height: Get.height * 0.035,
//             width: Get.width * 0.20,
//             decoration: BoxDecoration(
//               color: kRed,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Center(
//               child: Text(
//                 'Add',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   final EducationProvinceViewModel _educationProvinceViewModel =
//       Get.put(EducationProvinceViewModel());

//   String? selectedCountry2 = '';

//   Future<void> provinceCountry() async {
//     await _educationProvinceViewModel.educationDropViewModel(
//         countryId: int.parse(selectedCountry2!.toString()));
//     List<EducationProvinceResponseModel> response =
//         _educationProvinceViewModel.apiResponse.data;
//     response.forEach((element) {
//       provinceState.add(element);
//     });
//     setState(() {});
//   }
// }
