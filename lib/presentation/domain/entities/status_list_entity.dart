import 'package:equatable/equatable.dart';

class StatusListEntity extends Equatable {
  final int id;
  final String status;

  const StatusListEntity({
    required this.id,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        status,
      ];
}
