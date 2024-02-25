import 'dart:convert';
import '../../domain/entities/user_entity.dart';
import 'package:app_estoque/core/utils/encrypt_password.dart';

// ignore_for_file: must_be_immutable

class UserModel extends UserEntity {
  UserModel({
    super.id,
    super.name,
    super.cpf,
    super.email,
    super.password,
    super.createdAt,
    super.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name ?? '',
      'cpf': cpf ?? '',
      'email': email ?? '',
      'password': password ?? '',
      'createdAt': createdAt ?? DateTime.now().toIso8601String(),
      'updatedAt': updatedAt ?? DateTime.now().toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null
          ? EncryptPassword.decrypt(map['password'] as String)
          : null,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
