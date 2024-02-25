import 'package:equatable/equatable.dart';
// ignore_for_file: must_be_immutable


class UserEntity extends Equatable {
  String? id;
  String? name;
  String? cpf;
  String? email;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserEntity({
    this.id,
    this.name,
    this.cpf,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        cpf,
        email,
        password,
        createdAt,
        updatedAt,
      ];
}
