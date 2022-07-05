import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class TestScoreUpdateRepo extends ApiURLService {
  static testScoreUpdateRepo(
      {int? applicationId,
      int? studentId,
      double? listing,
      double? reading,
      double? writing,
      double? speaking,
      double? overAll}) async {
    Map<String, dynamic> body = {
      "ApplicationId": applicationId,
      "EnglishExamName": null,
      "EnglishExamType": 1,
      "EnglishExamDate": "2022-06-01T00:00:00.000Z",
      "EnglishScoreL": listing,
      "EnglishScoreR": reading,
      "EnglishScoreW": writing,
      "EnglishScoreS": speaking,
      "GREExamDate": "",
      "GREScoreV": 0,
      "GREScoreQ": 0,
      "GREScoreW": 0,
      "GMATExamDate": "",
      "GMATScoreA": 0,
      "GMATScoreI": 0,
      "GMATScoreQ": 0,
      "GMATScoreV": 0,
      "GREExam": 0,
      "GMATExam": 0,
      "GMATExamName": null,
      "EnglishScoreOverall": overAll,
      "EnglishExamUser": "",
      "EnglishExamPswd": "",
      "EnglishExamRemark": "",
      "SATScoreTotal": 0,
      "SATScoreMath": 0,
      "SATScoreEBRW": 0,
      "ACTScoreTotal": 0,
      "ACTScoreEnglish": 0,
      "ACTScoreMath": 0,
      "ACTScoreReading": 0,
      "ACTScoreScience": 0,
      "ACTScoreWriting": 0,
      "EnglishExamDocPath": "",
      "OtherExamDocPath": null,
      "StudentId": studentId
    };

    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Application/UpdateTestScore",
        apitype: APIType.aPost,
        body: body);
    print('response>>>>> $response');
    print('BODY>>>>> $body');
  }
}
