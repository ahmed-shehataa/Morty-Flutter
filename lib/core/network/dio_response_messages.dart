class ResponseMessage {
  static const String success = "AppStrings.success"; // success with data
  static const String noContent = "AppStrings.success"; // success with no data (no content)
  static const String badRequest = "AppStrings.strBadRequestError"; // failure, API rejected request
  static const String unauthorized = "AppStrings.strUnauthorizedError"; // failure, user is not authorized
  static const String forbidden = "AppStrings.strForbiddenError"; // failure, API rejected request
  static const String internalServerError = "AppStrings.strInternalServerError"; // failure, crash on the server side
  static const String notFound = "AppStrings.strNotFoundError"; // failure, not found

// local status codes
  static const String connectTimeout = "AppStrings.strTimeoutError";
  static const String cancel = "AppStrings.strDefaultError";
  static const String receiveTimeout = "AppStrings.strTimeoutError";
  static const String sendTimeout = "AppStrings.strTimeoutError";
  static const String cacheError = "AppStrings.strCacheError";
  static const String noInternetConnection = "AppStrings.strNoInternetError";
  static const String defaultStatus = "AppStrings.strDefaultError";

}