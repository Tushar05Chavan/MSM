import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/Screens/StudentEdit/widget/student_edit_documents_tab.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/common_textfiled.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/country_code_relation_response_model.dart';
import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/model/responseModek/language_response_model.dart';
import 'package:msm_unify/model/responseModek/student_education_province_response_model.dart';
import 'package:msm_unify/viewModel/country_code_view_model.dart';
import 'package:msm_unify/viewModel/country_view_model.dart';
import 'package:msm_unify/viewModel/language_view_model.dart';
import 'package:msm_unify/viewModel/student_education_province_view_model.dart';
import 'package:msm_unify/viewModel/student_view_update_view_model.dart';
import 'package:msm_unify/viewModel/student_view_view_model.dart';

import '../../../model/responseModek/student_view_response_model.dart';
import 'widget/student_application_tab.dart';
import 'widget/student_education_tab.dart';
//import 'widget/student_intrest_tab.dart';
import 'widget/student_note_tab.dart';
import 'widget/student_test_scrores_tab.dart';
import 'widget/student_visa_tab.dart';

class StudentEditScreen extends StatefulWidget {
  final int? studentId;

  const StudentEditScreen({Key? key, this.studentId}) : super(key: key);

  @override
  _StudentEditScreenState createState() => _StudentEditScreenState();
}

class _StudentEditScreenState extends State<StudentEditScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController _first = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _maritalStatus = TextEditingController();
  final TextEditingController _emailId = TextEditingController();
  final TextEditingController _contactNo = TextEditingController();
  final TextEditingController _passportNo = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _pinCode = TextEditingController();
  final TextEditingController _mailAddress = TextEditingController();
  final TextEditingController _mailCity = TextEditingController();
  final TextEditingController _mailPinCode = TextEditingController();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final TextEditingController _dob = TextEditingController();

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _relation = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _cellNo = TextEditingController();
  final TextEditingController _businessNo = TextEditingController();
  final TextEditingController _homePhone = TextEditingController();

  String? _selectedGender;
  final List<String> _gender = ['Male', 'Female', 'other'];

  String? _selectedMaritalStatus;
  final List<String> _martalStatus = [
    'Common-law',
    'Divorced',
    'Married',
    'Separated',
    'Single',
    'Widowed'
  ];

  String? selectedTitle;
  String? selectedState;
  String? selectedState1;
  String? selectedCountry1;
  String? selectedCountry2;
  String? selectedFirstLanguage;
  String? selectedCountryCode;
  String? selectedCountryOfCitizenship;
  final List<String> _title = ['Mr.', 'Ms.', 'Miss', 'Mrs.'];

  TabController? _tabController;

  final PageController _controller = PageController(
    initialPage: 0,
  );
  String? indexed = '0';

  _onPageViewChange(int page) {
    // print("Current Page: " + page.toString());
    indexed = page.toString();
    setState(() {});
    print('index===$indexed');
  }

  final StudentViewViewModel _studentViewViewModel =
      Get.put(StudentViewViewModel());

  // StudentViewResponseModel? response;
  Future<void> studentData() async {
    print("ID of STUDENT=====${widget.studentId}");
    await _studentViewViewModel.studentViewViewModel(
        studentId: widget.studentId);

    print('dattaaaa ===$_first');
  }

  final CountryCodeViewModel _countryCodeViewModel =
      Get.put(CountryCodeViewModel());
  String? _selectedCellNo;
  String? _selectedHomeNo;
  String? _selectedBussnessNo;
  List<CountryCodeResponseModel> countryCode1 = [];

  Future<void> getCountryCode() async {
    await _countryCodeViewModel.countryCodeViewModel();
    List<CountryCodeResponseModel> response =
        _countryCodeViewModel.apiResponse.data;
    response.forEach((element) {
      countryCode1.add(element);
    });
  }

  final LanguageViewModel _languageViewModel = Get.put(LanguageViewModel());
  List<LanguageResponseModel> getLanguages = [];

  Future<void> getLanguage() async {
    await _languageViewModel.languageViewModel();
    List<LanguageResponseModel> response = _languageViewModel.apiResponse.data;
    response.forEach((element) {
      getLanguages.add(element);
    });
  }

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

  final EducationProvinceViewModel _educationProvinceViewModel =
      Get.put(EducationProvinceViewModel());

  List<EducationProvinceResponseModel> provinceState = [];

  Future<void> provinceCountry() async {
    await _educationProvinceViewModel.educationDropViewModel(
        countryId: int.parse(selectedCountry2.toString()));
    List<EducationProvinceResponseModel> response =
        _educationProvinceViewModel.apiResponse.data;
    response.forEach((element) {
      provinceState.add(element);
    });
    setState(() {});
  }

  final StudentViewUpdateViewModel _studentViewUpdateViewModel =
      Get.put(StudentViewUpdateViewModel());

  @override
  void initState() {
    getCountry();
    getCountryCode();
    studentData();
    getLanguage();
    provinceCountry();
    _tabController = TabController(length: 6, vsync: this);

    super.initState();
  }

  final TextEditingController _date = TextEditingController();
  bool edit = false;
  bool _checkboxListTile = false;
  bool emergency = false;

  void showInSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        backgroundColor: kGreen,
        content: Text(
          'Update Successfully',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  void showInErrorSnackBar() {
    Scaffold.of(context).showSnackBar(const SnackBar(
        backgroundColor: kRed,
        content: Text(
          'Update Successfully',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 20),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
            key: _key,
            endDrawer: commonDrawer(context),
            body: GetBuilder<StudentViewViewModel>(
              builder: (controller) {
                if (controller.apiResponse.status == Status.COMPLETE) {
                  StudentViewResponseModel resp = controller.apiResponse.data;
                  print('id==${resp.genInfo!.province}');
                  print(
                      'mailing province id==${resp.genInfo!.mailingProvince}');
                  _first.text = resp.genInfo!.firstName.toString();
                  _middleName.text = resp.genInfo!.middleName.toString();
                  _lastName.text = resp.genInfo!.lastName.toString();
                  _dob.text = resp.genInfo!.dateOfBirth.toString();
                  _maritalStatus.text = resp.genInfo!.maritialStatus.toString();
                  _emailId.text = resp.genInfo!.email.toString();
                  _contactNo.text = resp.genInfo!.mobileNo.toString();
                  _passportNo.text = resp.genInfo!.passportNo.toString();
                  _date.text = resp.genInfo!.passportExpiryDate.toString();
                  _address.text = resp.genInfo!.addres.toString();
                  _city.text = resp.genInfo!.city.toString();
                  _pinCode.text = resp.genInfo!.pincode.toString();
                  _mailAddress.text = resp.genInfo!.mailingAddres.toString();
                  _mailCity.text = resp.genInfo!.mailingCity.toString();
                  _mailPinCode.text = resp.genInfo!.mailingPincode.toString();
                  _firstName.text = resp.genInfo!.emrgencyName.toString();
                  _relation.text = resp.genInfo!.emergencyRelation.toString();
                  _email.text = resp.genInfo!.emergencyEmail.toString();
                  _cellNo.text = resp.genInfo!.emergencyCellPhone.toString();
                  _businessNo.text =
                      resp.genInfo!.emergencyBusinessPhone.toString();
                  _homePhone.text = resp.genInfo!.emergencyHomePhone.toString();
                  selectedState1 = resp.genInfo!.province;
                  selectedState = resp.genInfo!.mailingProvince;
                  print("selectedState1 === ${selectedState1}");
                  print("selectedState === ${selectedState}");
                  return NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              //buildPreferredSize(context, _key),
                              SearchBar(keyGlobal: _key),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: SvgPicture.asset(
                                                'assets/icons/back.svg',
                                                height: 22,
                                                width: 22,
                                              ),
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
                                        InkWell(
                                          onTap: () {
                                            edit = false;
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (BuildContext
                                                            context,
                                                        void Function(
                                                                void Function())
                                                            setState) {
                                                      return SimpleDialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            side: const BorderSide(
                                                                color:
                                                                    kColorPrimary)),
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: edit == false
                                                                ? Container(
                                                                    width: Get
                                                                        .width,
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            // mainAxisAlignment:
                                                                            //  MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              const Flexible(
                                                                                child: Text(
                                                                                  'Personal Information (As indicated on your passport)',
                                                                                  style: TextStyle(
                                                                                    color: kRed,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                                                child: Flexible(
                                                                                  child: InkWell(
                                                                                    onTap: () {
                                                                                      Get.back();
                                                                                    },
                                                                                    child: Container(
                                                                                      height: Get.height * 0.04,
                                                                                      width: Get.width * 0.08,
                                                                                      decoration: BoxDecoration(
                                                                                        color: kRed,
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                      ),
                                                                                      child: const Icon(
                                                                                        Icons.close,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          DropdownButtonHideUnderline(
                                                                            child: DropdownButtonFormField(
                                                                                decoration: InputDecoration(
                                                                                  labelText: 'Title *',
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                  ),
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5),
                                                                                hint: Text('${resp.genInfo!.salution}'),
                                                                                value: selectedTitle,
                                                                                items: _title.map((tile) {
                                                                                  return DropdownMenuItem(
                                                                                      value: tile,
                                                                                      child: Text(
                                                                                        tile,
                                                                                        style: const TextStyle(color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                                                                                      ));
                                                                                }).toList(),
                                                                                onChanged: (newValue) {
                                                                                  setState(() {
                                                                                    selectedTitle = newValue as String?;
                                                                                  });
                                                                                }),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          commontextfiled(
                                                                            controller:
                                                                                _first,
                                                                            labelText:
                                                                                Text(
                                                                              'First Name*',
                                                                              style: TextStyle(
                                                                                color: Colors.black.withOpacity(0.2),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          commontextfiled(
                                                                            controller:
                                                                                _middleName,
                                                                            labelText:
                                                                                Text(
                                                                              'Middle Name*',
                                                                              style: TextStyle(
                                                                                color: Colors.black.withOpacity(0.2),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          commontextfiled(
                                                                            controller:
                                                                                _lastName,
                                                                            labelText:
                                                                                Text(
                                                                              'Last Name *',
                                                                              style: TextStyle(
                                                                                color: Colors.black.withOpacity(0.2),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          DropdownButtonHideUnderline(
                                                                            child: DropdownButtonFormField(
                                                                                decoration: InputDecoration(
                                                                                  labelText: 'Gender *',
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                  ),
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5),
                                                                                hint: Text('${resp.genInfo!.gender}'),
                                                                                value: _selectedGender,
                                                                                items: _gender.map((gender) {
                                                                                  return DropdownMenuItem(
                                                                                      value: gender,
                                                                                      child: Text(
                                                                                        gender,
                                                                                        style: const TextStyle(color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                                                                                      ));
                                                                                }).toList(),
                                                                                onChanged: (newValue) {
                                                                                  setState(() {
                                                                                    _selectedGender = newValue as String?;
                                                                                  });
                                                                                }),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          DropdownButtonHideUnderline(
                                                                            child: DropdownButtonFormField(
                                                                                decoration: InputDecoration(
                                                                                  labelText: 'Marital Status *',
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                  ),
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5),
                                                                                hint: Text('${resp.genInfo!.maritialStatus}'),
                                                                                value: _selectedMaritalStatus,
                                                                                items: _martalStatus.map((status) {
                                                                                  return DropdownMenuItem(
                                                                                      value: status,
                                                                                      child: Text(
                                                                                        status,
                                                                                        style: const TextStyle(color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                                                                                      ));
                                                                                }).toList(),
                                                                                onChanged: (newValue) {
                                                                                  setState(() {
                                                                                    _selectedMaritalStatus = newValue as String?;
                                                                                  });
                                                                                }),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                _dob,
                                                                            cursorColor:
                                                                                kRed,
                                                                            decoration: InputDecoration(
                                                                                suffixIcon: IconButton(
                                                                                  icon: const Icon(Icons.today),
                                                                                  onPressed: () async {
                                                                                    DateTime date = DateTime(1900);
                                                                                    FocusScope.of(context).requestFocus(FocusNode());

                                                                                    date = (await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now()))!;
                                                                                    _date.text = formatter.format(date);
                                                                                  },
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: const BorderSide(
                                                                                      color: Colors.black,
                                                                                    )),
                                                                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.2), fontFamily: 'Roboto'),
                                                                                border: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                )),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          const Text(
                                                                            'DD/MM/YYYY',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color(0xff808080),
                                                                              fontSize: 11,
                                                                              fontFamily: 'Roboto',
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          DropdownButtonHideUnderline(
                                                                            child: DropdownButtonFormField(
                                                                                decoration: InputDecoration(
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                  ),
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5),
                                                                                hint: Text('${resp.genInfo!.language}'),
                                                                                value: selectedFirstLanguage,
                                                                                items: getLanguages.map((language) {
                                                                                  return DropdownMenuItem(
                                                                                      value: language.languageName.toString(),
                                                                                      child: Text(
                                                                                        language.languageName.toString(),
                                                                                        style: const TextStyle(color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                                                                                      ));
                                                                                }).toList(),
                                                                                onChanged: (newValue) {
                                                                                  setState(() {
                                                                                    selectedFirstLanguage = newValue as String?;
                                                                                  });
                                                                                }),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          commontextfiled(
                                                                            controller:
                                                                                _emailId,
                                                                            labelText:
                                                                                Text(
                                                                              'Contact Email ID *',
                                                                              style: TextStyle(
                                                                                color: Colors.black.withOpacity(0.2),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          DropdownButtonHideUnderline(
                                                                            child: DropdownButtonFormField(
                                                                                isExpanded: true,
                                                                                decoration: InputDecoration(
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                  ),
                                                                                ),
                                                                                validator: (value) {
                                                                                  if (value == null) {
                                                                                    return "Country Code is required";
                                                                                  }
                                                                                },
                                                                                borderRadius: BorderRadius.circular(5),
                                                                                hint: Text('${resp.genInfo!.mobileNoCountryCode}'),
                                                                                value: selectedCountryCode,
                                                                                items: countryCode1.map((countryCode) {
                                                                                  return DropdownMenuItem(
                                                                                      value: countryCode.countryCode.toString(),
                                                                                      child: Text(
                                                                                        countryCode.countryName.toString(),
                                                                                        style: const TextStyle(color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                                                                                      ));
                                                                                }).toList(),
                                                                                onChanged: (newValue) {
                                                                                  setState(() {
                                                                                    selectedCountryCode = newValue as String?;
                                                                                  });
                                                                                }),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          commontextfiled(
                                                                            controller:
                                                                                _contactNo,
                                                                            labelText:
                                                                                Text(
                                                                              'Contact Number',
                                                                              style: TextStyle(
                                                                                color: Colors.black.withOpacity(0.2),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                25,
                                                                          ),
                                                                          const Text(
                                                                            'Passport Details',
                                                                            style:
                                                                                TextStyle(
                                                                              color: kRed,
                                                                              fontSize: 14,
                                                                              fontFamily: 'Poppins',
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                25,
                                                                          ),
                                                                          DropdownButtonHideUnderline(
                                                                            child: DropdownButtonFormField(
                                                                                isExpanded: true,
                                                                                decoration: InputDecoration(label: const Text('Country of Citizenship', style: TextStyle(color: kGrey)), border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                                                                validator: (title) {
                                                                                  if (title != null) {
                                                                                    return "Country of CitizenShip";
                                                                                  }
                                                                                },
                                                                                borderRadius: BorderRadius.circular(5),
                                                                                hint: Text("${resp.genInfo!.countryName}"),
                                                                                value: selectedCountry1,
                                                                                items: countryS.map((countryDrop) {
                                                                                  return DropdownMenuItem(
                                                                                      value: countryDrop.countryId.toString(),
                                                                                      child: Text(
                                                                                        countryDrop.countryName.toString(),
                                                                                        style: TextStyle(color: Colors.black.withOpacity(0.7), fontFamily: "Roboto", fontSize: 13),
                                                                                      ));
                                                                                }).toList(),
                                                                                onChanged: (newValue) {
                                                                                  selectedCountry1 = newValue as String?;
                                                                                }),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                25,
                                                                          ),
                                                                          commontextfiled(
                                                                            controller:
                                                                                _passportNo,
                                                                            labelText:
                                                                                Text(
                                                                              'Passport Number *',
                                                                              style: TextStyle(
                                                                                color: Colors.black.withOpacity(0.2),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          const Text(
                                                                            'Please write Passport number/Passport applied/Passport not available ',
                                                                            style: TextStyle(
                                                                                color: Color(0xff808080),
                                                                                fontFamily: 'Roboto',
                                                                                fontSize: 11),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                _date,
                                                                            cursorColor:
                                                                                kRed,
                                                                            decoration: InputDecoration(
                                                                                suffixIcon: IconButton(
                                                                                  icon: const Icon(Icons.today),
                                                                                  onPressed: () async {
                                                                                    DateTime date = DateTime(1900);
                                                                                    FocusScope.of(context).requestFocus(FocusNode());

                                                                                    date = (await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now()))!;
                                                                                    _date.text = formatter.format(date);
                                                                                  },
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: const BorderSide(
                                                                                      color: Colors.black,
                                                                                    )),
                                                                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.2), fontFamily: 'Roboto'),
                                                                                border: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                )),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          const Text(
                                                                            'DD/MM/YYYY',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color(0xff808080),
                                                                              fontSize: 11,
                                                                              fontFamily: 'Roboto',
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  CircleAvatar(
                                                                                    radius: 10,
                                                                                    backgroundColor: edit == false ? kGreen1 : const Color(0xffAAAAAA),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  CircleAvatar(
                                                                                    radius: 10,
                                                                                    backgroundColor: edit == true ? kGreen1 : const Color(0xffAAAAAA),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      print('first name: ${_first.text}');
                                                                                      print('middle name: ${_middleName.text}');
                                                                                      print('last name: ${_lastName.text}');
                                                                                      print('email : ${_emailId.text}');
                                                                                      print('citizenship : ${selectedCountry1.toString()}');
                                                                                      print('mail province: $selectedState1');
                                                                                      print('province: ${(selectedState.toString())}');

                                                                                      var body = {
                                                                                        "Addres": _address.text,
                                                                                        "AgentId": 26,
                                                                                        "Citizenship": int.parse(selectedCountry1.toString()),
                                                                                        "City": _city.text,
                                                                                        "Country": selectedCountry2.toString(),
                                                                                        "DateOfBirth": _dob.text,
                                                                                        "Email": _emailId.text,
                                                                                        "EmergencyAddress": "",
                                                                                        "EmergencyAddressSame": false,
                                                                                        "EmergencyBusinessPhone": "9765432123",
                                                                                        "EmergencyBusinessPhoneCountryCode": "101",
                                                                                        "EmergencyCellPhone": "9828054321",
                                                                                        "EmergencyCellPhoneCountryCode": "101",
                                                                                        "EmergencyEmail": "dsfa@gmail.com",
                                                                                        "EmergencyHomePhone": "",
                                                                                        "EmergencyHomePhoneCountryCode": "",
                                                                                        "EmergencyPincode": "",
                                                                                        "EmergencyRelation": "Brother",
                                                                                        "EmrgencyName": "Johan",
                                                                                        "EnrollmentNo": "",
                                                                                        "FirstName": _first.text,
                                                                                        "Gender": _selectedGender.toString(),
                                                                                        "InstUserID": "",
                                                                                        "Language": selectedFirstLanguage.toString(),
                                                                                        "LastName": _lastName.text,
                                                                                        "MailingAddres": _mailAddress.text,
                                                                                        "MailingAddressSame": true,
                                                                                        "MailingCity": _mailCity.text,
                                                                                        "MailingPincode": _mailPinCode.text,
                                                                                        "MailingProvince": int.parse(selectedState1.toString()),
                                                                                        "MaritialStatus": _selectedMaritalStatus.toString(),
                                                                                        "MiddleName": _middleName.text,
                                                                                        "MobileNo": _contactNo.text,
                                                                                        "MobileNoCountryCode": selectedCountryCode.toString(),
                                                                                        "PassportExpiryDate": _date.text,
                                                                                        "PassportNo": _passportNo.text,
                                                                                        "Pincode": _pinCode.text,
                                                                                        "Province": int.parse(selectedState.toString()),
                                                                                        "Salution": selectedTitle.toString(),
                                                                                        "StudentId": 43905
                                                                                      };
                                                                                      _studentViewUpdateViewModel.studentViewUpdateViewModel(body).then((value) => {
                                                                                            if (_studentViewUpdateViewModel.apiResponse.status == Status.COMPLETE)
                                                                                              {
                                                                                                const GetSnackBar(
                                                                                                  title: 'Update Successfully!!!!!!',
                                                                                                  borderColor: kRed,
                                                                                                  backgroundColor: kGreen,
                                                                                                )
                                                                                              }
                                                                                            else
                                                                                              {
                                                                                                const GetSnackBar(
                                                                                                  title: 'No Data Update!!!!!!',
                                                                                                  borderColor: kRed,
                                                                                                  backgroundColor: kGreen,
                                                                                                )
                                                                                              }
                                                                                          });

                                                                                      setState(() {
                                                                                        edit = true;
                                                                                      });
                                                                                    },
                                                                                    child: Container(
                                                                                      height: Get.height * 0.05,
                                                                                      width: Get.width * 0.30,
                                                                                      decoration: BoxDecoration(color: kGreen1, borderRadius: BorderRadius.circular(15)),
                                                                                      child: const Center(
                                                                                        child: Text(
                                                                                          'Save & Continue',
                                                                                          style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 11),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    width: Get
                                                                        .width,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            const Flexible(
                                                                              child: Text(
                                                                                'Residential Address (As mentioned on the passport)',
                                                                                style: TextStyle(
                                                                                  color: kNavy,
                                                                                  fontFamily: "Poppins",
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                                child: Container(
                                                                                  height: Get.height * 0.04,
                                                                                  width: Get.width * 0.08,
                                                                                  decoration: BoxDecoration(
                                                                                    color: kRed,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  child: const Icon(
                                                                                    Icons.close,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        commontextfiled(
                                                                          controller:
                                                                              _address,
                                                                          labelText:
                                                                              Text(
                                                                            'Address *',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black.withOpacity(0.2),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        DropdownButtonHideUnderline(
                                                                          child: DropdownButtonFormField(
                                                                              isExpanded: true,
                                                                              decoration: InputDecoration(label: const Text('Country of Institution', style: TextStyle(color: kGrey)), border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                                                              validator: (title) {
                                                                                if (title != null) {
                                                                                  return "Country of institution";
                                                                                }
                                                                              },
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              hint: Text("${resp.genInfo!.countryName}"),
                                                                              value: selectedCountry2,
                                                                              items: countryS.map((countryDrop) {
                                                                                return DropdownMenuItem(
                                                                                    value: countryDrop.countryId.toString(),
                                                                                    child: Text(
                                                                                      countryDrop.countryName.toString(),
                                                                                      style: TextStyle(color: Colors.black.withOpacity(0.7), fontFamily: "Roboto", fontSize: 13),
                                                                                    ));
                                                                              }).toList(),
                                                                              onChanged: (newValue) {
                                                                                provinceState.clear();
                                                                                selectedCountry2 = newValue as String?;

                                                                                provinceCountry().then((value) => setState(() {}));
                                                                              }),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        DropdownButtonHideUnderline(
                                                                          child: DropdownButtonFormField(
                                                                              isExpanded: true,
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
                                                                              hint: Text('${resp.genInfo!.province}'),
                                                                              value: selectedState,
                                                                              items: provinceState.map((state) {
                                                                                return DropdownMenuItem(
                                                                                    value: state.provinceName.toString(),
                                                                                    child: Text(
                                                                                      state.provinceName.toString(),
                                                                                      style: const TextStyle(color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                                                                                    ));
                                                                              }).toList(),
                                                                              onChanged: (newValue) {
                                                                                selectedState = newValue as String?;
                                                                              }),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        commontextfiled(
                                                                          controller:
                                                                              _city,
                                                                          labelText:
                                                                              Text(
                                                                            'City/Town *',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black.withOpacity(0.2),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        commontextfiled(
                                                                          controller:
                                                                              _pinCode,
                                                                          labelText:
                                                                              Text(
                                                                            'Postal/Zip Code',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black.withOpacity(0.2),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        const Text(
                                                                          'Mailing Address(Current residence address)',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                kNavy,
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                        CheckboxListTile(
                                                                          activeColor:
                                                                              Colors.orange,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                          title:
                                                                              const Text('Same as above'),
                                                                          value:
                                                                              _checkboxListTile,
                                                                          onChanged:
                                                                              (value) {
                                                                            setState(() {
                                                                              _checkboxListTile = !_checkboxListTile;
                                                                            });
                                                                          },
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        commontextfiled(
                                                                          controller:
                                                                              _mailAddress,
                                                                          labelText:
                                                                              Text(
                                                                            'Address',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black.withOpacity(0.2),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        DropdownButtonHideUnderline(
                                                                          child: DropdownButtonFormField(
                                                                              isExpanded: true,
                                                                              decoration: InputDecoration(label: const Text('Country', style: TextStyle(color: kGrey)), border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                                                              validator: (title) {
                                                                                if (title != null) {
                                                                                  return "Country";
                                                                                }
                                                                              },
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              hint: Text("${resp.genInfo!.countryName}"),
                                                                              value: selectedCountry2,
                                                                              items: countryS.map((countryDrop) {
                                                                                return DropdownMenuItem(
                                                                                    value: countryDrop.countryId.toString(),
                                                                                    child: Text(
                                                                                      countryDrop.countryName.toString(),
                                                                                      style: TextStyle(color: Colors.black.withOpacity(0.7), fontFamily: "Roboto", fontSize: 13),
                                                                                    ));
                                                                              }).toList(),
                                                                              onChanged: (newValue) {
                                                                                provinceState.clear();
                                                                                selectedCountry2 = newValue as String?;

                                                                                provinceCountry().then((value) => setState(() {}));
                                                                              }),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        DropdownButtonHideUnderline(
                                                                          child: DropdownButtonFormField(
                                                                              isExpanded: true,
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
                                                                              hint: Text('${resp.genInfo!.province}'),
                                                                              value: selectedState1,
                                                                              items: provinceState.map((state) {
                                                                                return DropdownMenuItem(
                                                                                    value: state.provinceName.toString(),
                                                                                    child: Text(
                                                                                      state.provinceName.toString(),
                                                                                      style: const TextStyle(color: kGrey4, fontFamily: "Roboto", fontSize: 13),
                                                                                    ));
                                                                              }).toList(),
                                                                              onChanged: (newValue) {
                                                                                selectedState1 = newValue as String?;
                                                                              }),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        commontextfiled(
                                                                          controller:
                                                                              _mailCity,
                                                                          labelText:
                                                                              Text(
                                                                            'City/Town',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black.withOpacity(0.2),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        commontextfiled(
                                                                          controller:
                                                                              _mailPinCode,
                                                                          labelText:
                                                                              Text(
                                                                            'Postal/Zip Code',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black.withOpacity(0.2),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                const SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                CircleAvatar(
                                                                                  radius: 10,
                                                                                  backgroundColor: edit == false ? kGreen1 : const Color(0xffAAAAAA),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                CircleAvatar(
                                                                                  radius: 10,
                                                                                  backgroundColor: edit == true ? kGreen1 : const Color(0xffAAAAAA),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        setState(() {
                                                                                          edit = false;
                                                                                        });
                                                                                      },
                                                                                      child: SvgPicture.asset(
                                                                                        'assets/icons/back.svg',
                                                                                        height: 22,
                                                                                        width: 22,
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    const Text(
                                                                                      'Back',
                                                                                      style: TextStyle(color: kGrey5, fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 16),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      edit = true;
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    height: Get.height * 0.05,
                                                                                    width: Get.width * 0.25,
                                                                                    decoration: BoxDecoration(color: kGreen1, borderRadius: BorderRadius.circular(15)),
                                                                                    child: const Center(
                                                                                      child: Text(
                                                                                        'Save',
                                                                                        style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 11),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                });
                                          },
                                          child: Container(
                                            height: Get.height * 0.035,
                                            width: Get.width * 0.07,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight: Radius.circular(7),
                                                  bottomRight:
                                                      Radius.circular(7),
                                                  topLeft: Radius.circular(7),
                                                ),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: const Icon(
                                              Icons.edit,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Stack(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/square_empty_agent.svg'),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${resp.genInfo!.firstName} ${resp.genInfo!.lastName}',
                                      style: const TextStyle(
                                        color: kNavy,
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'MSM ID:',
                                          style: TextStyle(
                                            color: Color(0xff565656),
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                        Text(
                                          '${resp.genInfo!.studentId}',
                                          style: const TextStyle(
                                            color: Color(0xff565656),
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/birthday.svg'),
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              const Text(
                                                'Date Of Birth: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Text(
                                                DateFormat('dd/MM/yyyy').format(
                                                    DateTime.parse(
                                                        '${resp.genInfo!.dateOfBirth}')),
                                                //'${resp.genInfo!.dateOfBirth}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/gender.svg'),
                                              const SizedBox(
                                                width: 23,
                                              ),
                                              const Text(
                                                'Gender: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Text(
                                                '${resp.genInfo!.gender}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/language.svg'),
                                              const SizedBox(
                                                width: 17,
                                              ),
                                              const Text(
                                                'Language: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Text(
                                                '${resp.genInfo!.language}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/citizenship.svg'),
                                              const SizedBox(
                                                width: 11,
                                              ),
                                              const Text(
                                                'Citizenship: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Text(
                                                '${resp.genInfo!.citizenshipName}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/passport.svg'),
                                              const SizedBox(
                                                width: 17,
                                              ),
                                              const Text(
                                                'Passport: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Text(
                                                '${resp.genInfo!.passportNo}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/passport.svg'),
                                              const SizedBox(
                                                width: 17,
                                              ),
                                              const Text(
                                                'Expriry Date: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Text(
                                                DateFormat('dd/MM/yyyy').format(
                                                    DateTime.parse(
                                                        '${resp.genInfo!.passportExpiryDate}')),
                                                //'${resp.genInfo!.passportExpiryDate}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/email1.svg'),
                                              const SizedBox(
                                                width: 17,
                                              ),
                                              Text(
                                                '${resp.genInfo!.email}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/phone.svg'),
                                              const SizedBox(
                                                width: 19,
                                              ),
                                              const Text(
                                                'Contact: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Text(
                                                '${resp.genInfo!.mobileNo}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/agent.svg'),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const Text(
                                                'Agent/Recruiter: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Text(
                                                '${resp.genInfo!.agentName}',
                                                style: const TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/residential.svg'),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              const Text(
                                                'Residential Address: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  '${resp.genInfo!.addres}',
                                                  style: const TextStyle(
                                                    color: kGrey,
                                                    fontSize: 14,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/mailingaddress.svg'),
                                              const SizedBox(
                                                width: 17,
                                              ),
                                              const Text(
                                                'Mailing Address: ',
                                                style: TextStyle(
                                                  color: kGrey,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  '${resp.genInfo!.mailingAddres}',
                                                  style: const TextStyle(
                                                    color: kGrey,
                                                    fontSize: 14,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            emergency = true;
                                          });
                                        },
                                        child: Container(
                                          height: Get.height * 0.045,
                                          width: Get.width * 0.40,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff565656),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Center(
                                            child: Text(
                                              'Emergency Contact ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        emergency == false
                            ? SliverToBoxAdapter(
                                child: TabBar(
                                  controller: _tabController,
                                  isScrollable: true,
                                  unselectedLabelColor: Colors.black,
                                  indicatorColor: Colors.red,
                                  labelColor: Colors.red,
                                  tabs: const [
                                    Tab(
                                      child: Text('Education'),
                                    ),
                                    Tab(
                                      child: Text('Test Scores'),
                                    ),
                                    Tab(
                                      child: Text('Documents'),
                                    ),
                                    Tab(
                                      child: Text('Student Visa'),
                                    ),
                                    // Tab(
                                    //   child: Text('Interest'),
                                    // ),
                                    Tab(
                                      child: Text('Application'),
                                    ),
                                    Tab(
                                      child: Text('Note'),
                                    ),
                                  ],
                                ),
                              )
                            : const SliverToBoxAdapter(
                                child: SizedBox(),
                              ),
                      ];
                    },
                    body: emergency == false
                        ? TabBarView(
                            controller: _tabController,
                            children: [
                              StudentEducationTab(data: resp),
                              const StdTestScoreTab(),
                              StudentEditDocumentTabScreen(data: resp),
                              const StudentVisaTab(),
                              //const StdInterestTab(),
                              StdApplicationScreen(data: resp),
                              StdNoteTab(data: resp),
                            ],
                          )
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              emergency = false;
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            'assets/icons/back.svg',
                                            height: 22,
                                            width: 22,
                                          ),
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
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              shape: ContinuousRectangleBorder(
                                                  side: const BorderSide(
                                                      color: kRed, width: 1.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            'Emergency Contact',
                                                            style: TextStyle(
                                                                color: kNavy,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Get.back();
                                                            },
                                                            child: Container(
                                                              height:
                                                                  Get.height *
                                                                      0.04,
                                                              width: Get.width *
                                                                  0.08,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: kRed,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: const Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      commontextfiled(
                                                        controller: _firstName,
                                                        hintText:
                                                            '${resp.genInfo!.emrgencyName}',
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      commontextfiled(
                                                        controller: _relation,
                                                        hintText:
                                                            '${resp.genInfo!.emergencyRelation}',
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      commontextfiled(
                                                        controller: _email,
                                                        hintText:
                                                            '${resp.genInfo!.emergencyEmail}',
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child:
                                                            DropdownButtonFormField(
                                                                isExpanded:
                                                                    true,
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                ),
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                      null) {
                                                                    return "Country is required";
                                                                  }
                                                                },
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                hint: Text(
                                                                    '${resp.genInfo!.emergencyCellPhoneCountryCode}'),
                                                                value:
                                                                    _selectedCellNo,
                                                                items: countryCode1
                                                                    .map(
                                                                        (country) {
                                                                  return DropdownMenuItem(
                                                                      value: country
                                                                          .countryCode
                                                                          .toString(),
                                                                      child:
                                                                          Text(
                                                                        country
                                                                            .countryName
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
                                                                    _selectedCellNo =
                                                                        newValue
                                                                            as String?;
                                                                  });
                                                                }),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      commontextfiled(
                                                        controller: _cellNo,
                                                        hintText:
                                                            '${resp.genInfo!.emergencyCellPhone}',
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child:
                                                            DropdownButtonFormField(
                                                                isExpanded:
                                                                    true,
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                ),
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                      null) {
                                                                    return "Country is required";
                                                                  }
                                                                },
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                hint: Text(
                                                                    '${resp.genInfo!.emergencyBusinessPhoneCountryCode}'),
                                                                value:
                                                                    _selectedBussnessNo,
                                                                items: countryCode1
                                                                    .map(
                                                                        (country) {
                                                                  return DropdownMenuItem(
                                                                      value: country
                                                                          .countryCode
                                                                          .toString(),
                                                                      child:
                                                                          Text(
                                                                        country
                                                                            .countryName
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
                                                                    _selectedBussnessNo =
                                                                        newValue
                                                                            as String?;
                                                                  });
                                                                }),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      commontextfiled(
                                                        controller: _businessNo,
                                                        hintText:
                                                            '${resp.genInfo!.emergencyBusinessPhone}',
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child:
                                                            DropdownButtonFormField(
                                                                isExpanded:
                                                                    true,
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                ),
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                      null) {
                                                                    return "Country is required";
                                                                  }
                                                                },
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                hint: Text(
                                                                    '${resp.genInfo!.emergencyHomePhoneCountryCode}'),
                                                                value:
                                                                    _selectedHomeNo,
                                                                items: countryCode1
                                                                    .map(
                                                                        (country) {
                                                                  return DropdownMenuItem(
                                                                      value: country
                                                                          .countryCode
                                                                          .toString(),
                                                                      child:
                                                                          Text(
                                                                        country
                                                                            .countryName
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
                                                                    _selectedHomeNo =
                                                                        newValue
                                                                            as String?;
                                                                  });
                                                                }),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      commontextfiled(
                                                        controller: _homePhone,
                                                        hintText:
                                                            '${resp.genInfo!.emergencyHomePhone}',
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          width:
                                                              Get.width * 0.25,
                                                          height:
                                                              Get.height * 0.05,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: const Center(
                                                              child: Text(
                                                            'Update',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Colors
                                                                    .white),
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
                                        height: Get.height * 0.035,
                                        width: Get.width * 0.07,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(7),
                                              bottomRight: Radius.circular(7),
                                              topLeft: Radius.circular(7),
                                            ),
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: Get.height * 0.18,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF4F5F7)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Name',
                                        style: TextStyle(
                                            color: Color(0xff79747E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${resp.genInfo!.emrgencyName}',
                                        style: const TextStyle(
                                            color: Color(0xff192A3E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: Get.height * 0.18,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF4F5F7)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Email ID',
                                        style: TextStyle(
                                            color: Color(0xff79747E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${resp.genInfo!.emergencyEmail}',
                                        style: const TextStyle(
                                            color: Color(0xff192A3E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: Get.height * 0.18,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF4F5F7)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Relation',
                                        style: TextStyle(
                                            color: Color(0xff79747E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${resp.genInfo!.emergencyRelation}',
                                        style: const TextStyle(
                                            color: Color(0xff192A3E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: Get.height * 0.18,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF4F5F7)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Home Phone',
                                        style: TextStyle(
                                            color: Color(0xff79747E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${resp.genInfo!.emergencyHomePhoneCountryCode} ${resp.genInfo!.emergencyHomePhone}',
                                        style: const TextStyle(
                                            color: Color(0xff192A3E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: Get.height * 0.18,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF4F5F7)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Cell Phone',
                                        style: TextStyle(
                                            color: Color(0xff79747E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${resp.genInfo!.emergencyCellPhoneCountryCode} ${resp.genInfo!.emergencyCellPhone}',
                                        style: const TextStyle(
                                            color: Color(0xff192A3E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: Get.height * 0.18,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF4F5F7)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Business Phone',
                                        style: TextStyle(
                                            color: Color(0xff79747E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${resp.genInfo!.emergencyBusinessPhoneCountryCode} ${resp.genInfo!.emergencyBusinessPhone}',
                                        style: const TextStyle(
                                            color: Color(0xff192A3E),
                                            fontSize: 15,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                supportSection(),
                              ],
                            ),
                          ),
                  );
                } else {
                  if (controller.apiResponse.status == Status.ERROR) {
                    return const CircularProgressIndicator();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
      ),
    );
  }
}
