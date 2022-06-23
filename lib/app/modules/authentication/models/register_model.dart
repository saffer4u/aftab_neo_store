// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterModel {
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String confirm_password;
  final String gender;
  final int phone_no;
  RegisterModel({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.confirm_password,
    required this.gender,
    required this.phone_no,
  });

  RegisterModel copyWith({
    String? first_name,
    String? last_name,
    String? email,
    String? password,
    String? confirm_password,
    String? gender,
    int? phone_no,
  }) {
    return RegisterModel(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirm_password: confirm_password ?? this.confirm_password,
      gender: gender ?? this.gender,
      phone_no: phone_no ?? this.phone_no,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'confirm_password': confirm_password,
      'gender': gender,
      'phone_no': phone_no,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      confirm_password: map['confirm_password'] as String,
      gender: map['gender'] as String,
      phone_no: map['phone_no'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(first_name: $first_name, last_name: $last_name, email: $email, password: $password, confirm_password: $confirm_password, gender: $gender, phone_no: $phone_no)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RegisterModel &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.email == email &&
      other.password == password &&
      other.confirm_password == confirm_password &&
      other.gender == gender &&
      other.phone_no == phone_no;
  }

  @override
  int get hashCode {
    return first_name.hashCode ^
      last_name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      confirm_password.hashCode ^
      gender.hashCode ^
      phone_no.hashCode;
  }
}
