import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? name;
  final String? cpf;
  final String? email;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserEntity({
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
