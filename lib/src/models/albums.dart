class Albums {
  int? userId;
  int? id;
  String? title;

  Albums({this.id, this.title, this.userId});

  factory Albums.fromJson(Map<String, dynamic> json) {
    final userId = json["userId"];
    final id = json["id"];
    final title = json["title"];

    return Albums(id: id, userId: userId, title: title);
  }

  Albums.toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['title'] = title;
  }
}
