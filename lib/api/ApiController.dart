class ApiController {
  static const String apiRoot = "xn----7sbdqoacqqid3aufel.xn--90ais";
  static const String apiRootUristring =
      "https://xn----7sbdqoacqqid3aufel.xn--90ais/";
  static const String apiVersion = "api/v1/";

  ApiController();

  static Uri getAPIUri(String url) {
    return Uri.https(apiRoot, "$apiVersion$url");
  }
}
