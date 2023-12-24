class ApiController {
  static String apiRoot = "eduapp.dionisiubrovka.online";

  ApiController();

  static Uri getRootURL() {
    return Uri.https(apiRoot);
  }

  static Uri getSpecialtyURL() {
    return Uri.https(apiRoot, 'api/v1/speciality/');
  }

  static Uri getSpecialtySSOURL() {
    return Uri.https(apiRoot, 'api/v1/speciality/sso/');
  }

  static Uri getSpecialtyPTOURL() {
    return Uri.https(apiRoot, 'api/v1/speciality/pto/');
  }

  static Uri getSkillURL() {
    return Uri.https(apiRoot, 'api/v1/skill/linked/');
  }

  static Uri getSkillSSOURL() {
    return Uri.https(apiRoot, 'api/v1/skill/linked/sso/');
  }

  static Uri getSkillPTOURL() {
    return Uri.https(apiRoot, 'api/v1/skill/linked/pto/');
  }
}
