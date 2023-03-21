class MissionListRequest {
  int userId;

  MissionListRequest(this.userId);

  Map<String, dynamic> toMap() => {
    'userId': userId,
  };
}