class ResponseMessage {
  static const String success = "success"; // success with data
  static const String noContent = "error_noContent"; // success with no data (no content)
  static const String badRequest = "error_bad_request"; // failure, API rejected request
  static const String unauthorized = "error_unauthorized"; // failure, user is not authorized
  static const String forbidden = "error_forbidden"; // failure, API rejected request
  static const String internalServerError = "error_internalServerError"; // failure, crash on the server side
  static const String notFound = "error_notFound"; // failure, not found

  // local status codes
  static const String connectTimeout = "error_timeout";
  static const String cancel = "error_timeout";
  static const String receiveTimeout = "error_timeout";
  static const String sendTimeout = "error_timeout";
  static const String cacheError = "error_cache";
  static const String noInternetConnection = "error_noInternetConnection";
  static const String defaultStatus = "error_default";

}