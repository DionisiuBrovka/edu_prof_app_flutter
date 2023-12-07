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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['e_date'] = eDate;
    data['title'] = title;
    return data;
  }
}
