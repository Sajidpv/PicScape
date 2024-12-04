// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'app_strings.dart';

class AppConfig {
  static String app_name = AppStrings.appTitle;

  static const bool HTTPS = true;

  static const DOMAIN_PATH = "api.unsplash.com/";

  static const String UNSPLASH_ACCESS_KEY =
      "9rRbkWa5R9bx_VUbAFhx0AAM2y2r5o-JyYmtLlDMmLc";
  static const String UNSPLASH_SECRET_KEY =
      "R6NgtCVe4Vza4JTy5cXClFegKQ7Vx8usZFq6MYpmZUY";

  static const String API_ENDPATH = "search/photos/";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "$PROTOCOL$DOMAIN_PATH";
  static const String BASE_URL =
      "$RAW_BASE_URL$API_ENDPATH?client_id=$UNSPLASH_ACCESS_KEY";

  @override
  String toString() {
    return super.toString();
  }
}
