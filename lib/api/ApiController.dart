class ApiController {
  String apiRoot = "";

  ApiController({required this.apiRoot});

  static Uri getRootURL() {
    return Uri.https('eduapp.dionisiubrovka.online');
  }

  static Uri getSpecialtyURL() {
    return Uri.https('eduapp.dionisiubrovka.online', 'api/v1/speciality/');
  }

  static Uri getSpecialtySSOURL() {
    return Uri.https('eduapp.dionisiubrovka.online', 'api/v1/speciality/sso/');
  }

  static Uri getSpecialtyPTOURL() {
    return Uri.https('eduapp.dionisiubrovka.online', 'api/v1/speciality/pto/');
  }
}
