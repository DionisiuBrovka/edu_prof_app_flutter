class Events {
  int? id;
  String? eDate;
  String? title;

  Events({this.id, this.eDate, this.title});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eDate = json['e_date'];
    title = json['title'];
  }
}
