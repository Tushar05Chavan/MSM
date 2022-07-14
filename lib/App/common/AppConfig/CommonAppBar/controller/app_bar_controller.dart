import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/model/responseModek/destination_response_model.dart';
import 'package:msm_unify/model/responseModek/what_do_you_want_response_model.dart';
import 'package:msm_unify/viewModel/country_view_model.dart';
import 'package:msm_unify/viewModel/destination_view_model.dart';
import 'package:msm_unify/viewModel/what_do_you_want_view_model.dart';

class CommonAppBarController extends GetxController {
  onInit() {
    getCountry();
    getDestination();
  }

  List<CountryResponseModel> countryS = [];
  final CountryViewModel _countryViewModel = Get.put(CountryViewModel());
  Future<void> getCountry() async {
    await _countryViewModel.countryViewModel();
    List<CountryResponseModel> response = _countryViewModel.apiResponse.data;
    response.forEach((element) {
      countryS.add(element);
    });
    update();
  }

  List<WhatDoYouWantResponseModel> studies = [];
  final WhatDoYouWantViewModel _whatViewModel =
      Get.put(WhatDoYouWantViewModel());
  Future<void> getStudies() async {
    await _whatViewModel.whatDoYouWantViewModel();
    List<WhatDoYouWantResponseModel> response = _whatViewModel.apiResponse.data;
    response.forEach((element) {
      studies.add(element);
    });
    update();
  }

  List<DestinationResponseModel> destination = [];
  final DestinationViewModel _destinationViewModel =
      Get.put(DestinationViewModel());
  Future<void> getDestination() async {
    await _destinationViewModel.destinationViewModel();
    List<WhatDoYouWantResponseModel> response = _whatViewModel.apiResponse.data;
    response.forEach((element) {
      destination.add;
    });
    update();
  }
}
