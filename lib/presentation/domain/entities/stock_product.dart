import 'product_entity.dart';
import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: must_be_immutable

class StockProductEntity extends Equatable {
  String? id;
  String? userID;
  int? statusID;
  String? unitStore;
  String? date;
  String? createdAt;
  String? updatedAt;
  List<ProductEntity>? product;

  StockProductEntity({
    this.id,
    this.userID,
    this.statusID,
    this.unitStore,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  @override
  List<Object?> get props => [
        id,
        userID,
        statusID,
        unitStore,
        date,
        createdAt,
        updatedAt,
      ];
}
