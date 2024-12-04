import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:picscape/configs/app_configs/app_strings.dart';
import 'package:picscape/data/app_exceptions.dart';
import 'package:picscape/data/network/base_api_services.dart';

class NetworkApiService implements BaseApiServices {
  late Dio dio;

  NetworkApiService() {
    dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    ));
  }

  @override
  Future getGetApiResponse(
    String url,
  ) async {
    if (kDebugMode) {
      print('Request URL: $url');
    }
    dynamic responseJson;
    try {
      final response = await dio.get(
        url,
      );
      responseJson = returnResponse(response);
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        throw FetchDataException(AppStrings.timeoutError);
      } else if (dioError.error is SocketException) {
        throw NoInternetException(AppStrings.noInternet);
      } else {
        throw FetchDataException(dioError.message);
      }
    } catch (e) {
      throw FetchDataException(e.toString());
    }

    if (kDebugMode) {
      print('API Response: $responseJson');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    if (kDebugMode) {
      print('Response Status Code: ${response.statusCode}');
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 204:
        throw NoContentException(response.data.toString());
      case 400:
        throw BadRequestException(response.data.toString());
      case 500:
        throw InternalServerException(AppStrings.serverError);
      case 404:
      case 401:
        throw UnauthorisedException(response.data.toString());
      default:
        throw FetchDataException(AppStrings.serverError);
    }
  }
}
