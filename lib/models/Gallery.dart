class Gallery {
  int? id;
  String? photo;
  String? desc;
  int? est;

  Gallery({this.id, this.photo, this.desc, this.est});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    desc = json['desc'];
    est = json['est'];
  }
}
