import 'package:get/get.dart';
import 'package:msm_unify/model/responseModek/country_response_model.dart';
import 'package:msm_unify/viewModel/country_view_model.dart';

class CommonAppBarController extends GetxController {
  onInit() {
    getCountry();
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
}
