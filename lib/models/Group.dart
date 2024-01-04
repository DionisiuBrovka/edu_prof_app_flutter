class Group {
  int id;
  String? title;

  Group({required this.id, this.title});

  Group.fromJson(Map<String, dynamic> json) : id = json['id'] {
    title = json['title'];
  }
}
