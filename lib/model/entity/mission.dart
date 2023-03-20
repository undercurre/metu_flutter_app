class Mission {
  int id;
  String name;
  String detail;
  String status;
  String userId;
  String deadline;
  String createtime;
  String updatetime;

  Mission(
      {required this.id,
      required this.name,
      required this.detail,
      required this.status,
      required this.userId,
      required this.deadline,
      required this.createtime,
      required this.updatetime});

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
        id: json["id"],
        name: json["name"],
        detail: json["detail"],
        status: json["status"],
        userId: json["userId"],
        deadline: json["deadline"],
        createtime: json["createtime"],
        updatetime: json["updatetime"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "detail": detail,
        "status": status,
        "userId": userId,
        "deadline": deadline,
        "createtime": createtime,
        "updatetime": updatetime
      };
}
