import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final String? msg;

  ServerFailure([this.msg]);

  @override
  String toString() {
    return msg ?? 'ERROR';
  }

  @override
  List<Object?> get props => [];
}

class BoxNotFoundFailure extends Failure {
  final String? msg;

  BoxNotFoundFailure([this.msg]);

  @override
  String toString() {
    return msg ?? 'Box não encontrado!';
  }

  @override
  List<Object?> get props => [];
}
