class ApiController {
  static const String apiRoot = "eduapp.dionisiubrovka.online";
  static const String apiRootUristring = "https://eduapp.dionisiubrovka.online";
  static const String apiVersion = "api/v1/";

  ApiController();

  static Uri getAPIUri(String url) {
    return Uri.https(apiRoot, "$apiVersion$url");
  }
}
