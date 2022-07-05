import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:msm_unify/Api/api_exception.dart';
import 'package:msm_unify/App/AppData/app_data.dart';

enum APIType {
  aPost,
  aGet,
}

class APIService {
  var response;
  var code;
  @override
  Future getResponse(
      {@required String? url,
      @required APIType? apitype,
      Map<String, dynamic>? body,
      // Map<String, dynamic>? params,
      bool fileUpload = false}) async {
    Map<String, String> header = {
      "Referer": "localhost:4200",
      "Authorization": "${Get.find<AppData>().loginResponseModel.token}",
      // "Authorization":
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiIzMTUiLCJVc2VyTmFtZSI6ImluZm9lZHVnbG9iYWwub3JnQGdtYWlsLmNvbSIsIlVQYXNzd29yZCI6IkVMdyswbzBYYnRrcWpuYXpwMUU4SVE9PSIsIlJvbGVJZCI6IjIiLCJSb2xlVHlwZSI6IjAiLCJSZWZJZCI6Ijk3MDEiLCJHZW5lcmF0ZWRPbiI6IjYvMjAvMjAyMiA4OjI2OjAyIEFNIiwiSXNzdWVUbyI6Imh0dHBzOi8vYXBwLm1zbXVuaWZ5LmNvbSIsIlByb3ZpZGVySWQiOiIiLCJQcm92aWRlck5hbWUiOiIiLCJWZXJpZmljYXRpb25TdGF0dXMiOiIxIiwiUGFydG5lclR5cGVJZCI6IjMiLCJuYmYiOjE2NTU3MTM1NjIsImV4cCI6MTY1NTcyNDM2MiwiaWF0IjoxNjU1NzEzNTYyfQ.MjQU7UJwaPsFjKZvCzOxbSWVk4dJKEbRIpHLRxES01c",
      "Content-Type": "application/json"
    };

    try {
      if (apitype == APIType.aGet) {
        final result = await http.get(Uri.parse(url!), headers: header);
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        // log("res : ${result.body}");
      } else if (apitype == APIType.aPost) {
        print('hello');
        final result = await http.post(
          Uri.parse(url!),
          body: json.encode(body),
          headers: header,
        );
        log("resp${result.body}");
        log("statusCode  ${result.statusCode}");
        code = result.statusCode;
        log("code  ${code}");

        response = returnResponse(result.statusCode, result.body);

        print(result.statusCode);
      } else if (fileUpload) {
        dio.FormData formData = dio.FormData.fromMap(body!);
        dio.Response result =
            await dio.Dio().post(url!, data: formData, options: dio.Options());

        response = returnResponse(result.statusCode!, jsonEncode(result.data));
      }
    } on SocketException {
      throw FetchDataException('No Internet access');
    }

    return response;
  }

  returnResponse(int status, String result) {
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 201:
        return jsonDecode(result);
      case 400:
        return jsonDecode(result);
      // throw BadRequestException('Bad Request');
      case 404:
        throw ServerException('Server Error');
      case 401:
        callRefresh();
        break;
      case 500:
      default:
        throw FetchDataException('Internal Server Error');
    }
  }

  void callRefresh() {
    print('HELLO');
  }
}
