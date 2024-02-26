import 'dart:convert';
import '../../domain/entities/product_entity.dart';
// ignore_for_file: must_be_immutable

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.title,
    super.quantityPackaging,
    super.quantity,
    super.barCode,
    super.createdAt,
    super.updatedAt,
    super.stockID,
    super.userID,
    super.expirationDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? '',
      'stockID': stockID ?? '',
      'userID': userID ?? '',
      'title': title ?? '',
      'quantityPackaging': quantityPackaging ?? '',
      'quantity': quantity ?? '',
      'barCode': barCode ?? '',
      'createdAt': createdAt ?? '',
      'updatedAt': updatedAt ?? '',
      'expirationDate': expirationDate ?? '',
    };
  }

  factory ProductModel.fromMap(Map<dynamic, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      stockID: map['stockID'] != null ? map['stockID'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      quantityPackaging: map['quantityPackaging'] != null
          ? map['quantityPackaging'] as String
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as String : null,
      barCode: map['barCode'] != null ? map['barCode'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      expirationDate: map['expirationDate'] != null
          ? map['expirationDate'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
