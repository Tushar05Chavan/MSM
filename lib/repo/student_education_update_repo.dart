import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class StudentEduUpdateRepo extends ApiURLService {
  static studentEduUpdateRepo(
      {int? studentId,
      int? countryOfEducation,
      int? highestLevelEdu,
      int? gradeScheme,
      String? gradeAverage}) async {
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Student/UpdateEduInfo",
        apitype: APIType.aPost,
        body: {
          "StudentId": studentId,
          "CountryOfEducation": countryOfEducation,
          "HighestLevelOfEducation": highestLevelEdu,
          "GradingScheme": gradeScheme,
          "GradeAverage": gradeAverage,
          "GraduatedMostRecent": 0,
          "EduYearEnd": "",
          "EduYearStart": ""
        });
  }
}
