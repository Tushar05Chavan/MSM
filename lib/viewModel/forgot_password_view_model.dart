import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';

class ForgotPasswordViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  bool isLoading = false;
  RxBool status = false.obs;
  int data = 0;
  String? resp;
  void changeLoadingState(bool value) {
    isLoading = value;
    data++;
    print('LOADING STATUS :: $isLoading $data');
    update();
  }

  void changeStatus(bool value) {
    status.value = value;
    update();
  }

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   addNewStudentViewModel();
  // }

  forgotPasswordViewModel({String? username}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/User/ForgotPassword",
      apitype: APIType.aPost,
      body: {
        "UserName": username,
      },
    );
    print('response==$response');
    return response;
  }
}
