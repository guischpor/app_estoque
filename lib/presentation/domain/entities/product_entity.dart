import 'package:equatable/equatable.dart';
// ignore_for_file: must_be_immutable

class ProductEntity extends Equatable {
  String? id;
  String? stockID;
  String? userID;
  String? title;
  String? quantityPackaging;
  String? expirationDate;
  String? quantity;
  String? barCode;
  String? createdAt;
  String? updatedAt;

  ProductEntity({
    this.id,
    this.title,
    this.quantityPackaging,
    this.quantity,
    this.barCode,
    this.createdAt,
    this.updatedAt,
    this.stockID,
    this.userID,
    this.expirationDate,
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
        stockID,
        userID,
        expirationDate,
      ];
}
