class User {
  String email;
  String phone;
  String roleIds;
  int userId;
  String username;

  User({required this.email, required this.phone, required this.roleIds, required this.username, required this.userId});

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    phone: json["phone"],
    roleIds: json["roleIds"],
    userId: json["userId"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() =>
      {
        "email": email,
        "phone": phone,
        "roleIds": roleIds,
        "userId": userId,
        "username": username
      };
}