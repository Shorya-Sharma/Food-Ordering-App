class UserReq {
  final String username;
  final String password;
  final String fullname;
  final String role;

  UserReq(
      {required this.username,
      required this.password,
      required this.fullname,
      required this.role});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'fullname': fullname,
        'role': role
      };
}
