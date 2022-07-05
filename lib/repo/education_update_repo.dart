import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class EducationUpdateRepo extends ApiURLService {
  static educationUpdateRepo(
      {int? applicationId,
      int? countryOfEducation,
      int? highestLevelEdu,
      int? gradeScheme,
      String? gradeAverage}) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Application/UpdateEduInfo",
      apitype: APIType.aPost,
      body: {
        "ApplicationId": applicationId,
        "CountryOfEducation": countryOfEducation,
        "HighestLevelOfEducation": highestLevelEdu,
        "GradingScheme": gradeScheme,
        "GradeAverage": gradeAverage,
        "GraduatedMostRecent": 0,
        "EduYearStart": "",
        "EduYearEnd": "",
        "GradingSchemeName": null,
        "HighestLevelOfEducationName": null,
        "CountryOfEducationName": null
      },
    );
  }
}
