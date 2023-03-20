class MissionListRequest {
  int id;

  MissionListRequest(this.id);

  Map<String, dynamic> toMap() => {
    'id': id,
  };
}