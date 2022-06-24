class LoginModel {
  final String email;
  final String password;
  LoginModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() => 'LoginModel(email: $email, password: $password)';
}
