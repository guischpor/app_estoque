import 'package:equatable/equatable.dart';
// ignore_for_file: must_be_immutable



class ProductEntity extends Equatable {
  String? id;
  String? title;
  int? quantityPackaging;
  int? quantity;
  String? barCode;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductEntity({
    this.id,
    this.title,
    this.quantityPackaging,
    this.quantity,
    this.barCode,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        quantityPackaging,
        quantity,
        barCode,
        createdAt,
        updatedAt,
      ];
}
