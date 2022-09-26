import 'dart:io';

import 'package:dio/dio.dart';
import 'package:melodistic/config/api.dart';
import 'package:melodistic/models/exception.model.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/widgets/common/popup/error_popup.dart';

class APIClient {
  static final APIClient _instance = APIClient._internal();
  final Dio _dio = Dio();

  factory APIClient() {
    return _instance;
  }

  APIClient._internal();

  Future<Response<T>?> createOperation<T>(String path,
      {required String method,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) async {
    try {
      try {
        Response<T> result = await _dio.request('$apiBaseURL$path',
            data: data,
            options: Options(method: method.toString(), headers: headers));
        return result;
      } on SocketException catch (_) {
        throw MelodisticException('No Internet Connection');
      } on DioError catch (e) {
        if (e.response != null) {
          final String message = e.response?.data['message'].toString() ??
              'Doh!, Something went wrong';
          throw MelodisticException(message);
        }
      }
      return null;
    } on MelodisticException catch (e) {
      Alert.showAlert(ErrorPopup(errorMessage: e.title));
      rethrow;
    }
  }

  Future<Response<T>?> get<T>(String path,
      {Map<String, dynamic>? headers}) async {
    return createOperation<T>(path, method: 'GET', headers: headers);
  }

  Future<Response<T>?> post<T>(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    return createOperation<T>(path,
        method: 'POST', data: data, headers: headers);
  }

  static Map<String, String> getAuthHeaders(String token) {
    return <String, String>{'Authorization': 'Bearer $token'};
  }
}
