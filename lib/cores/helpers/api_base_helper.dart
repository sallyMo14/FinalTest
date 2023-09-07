import 'dart:convert';
import 'dart:io';

import 'package:gsg_final_project_rgs/cores/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'app_exception.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url, Map<String, String> header) async {
    var responseJson;
    try {
      final response =
          await http.get(Uri.parse(baseUrl + url), headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    responseJson;
  }

  Future<dynamic> post(String url, bool isAuth, Map<String, String>? header,
      Map<String, dynamic> body) async {
    var responseJson;
    try {
      final response = isAuth
          ? await http.post(Uri.parse(baseUrl + url), body: body)
          : await http.post(Uri.parse(baseUrl + url),
              headers: header, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(
      String url, Map<String, String> header, Map<String, String> body) async {
    var responseJson;
    try {
      final response =
          await http.put(Uri.parse(baseUrl + url), headers: header, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    responseJson;
  }

  Future<dynamic> delete(String url, Map<String, String> header) async {
    var responseJson;
    try {
      final response =
          await http.delete(Uri.parse(baseUrl + url), headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
