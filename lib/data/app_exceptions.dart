import 'package:flutter/foundation.dart';

import '../configs/app_configs/app_strings.dart';

class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    if (kDebugMode) {
      print(_prefix);
    }
    return '$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, AppStrings.communicationError);
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, AppStrings.invalidRequest);
}

class NoContentException extends AppException {
  NoContentException([String? message]) : super(message, AppStrings.noContent);
}

class InternalServerException extends AppException {
  InternalServerException([String? message])
      : super(message ?? AppStrings.serverError);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, AppStrings.unauthorizedRequest);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, AppStrings.invalidInput);
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, AppStrings.noInternet);
}
