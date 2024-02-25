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
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? '',
      'title': title ?? '',
      'quantityPackaging': quantityPackaging ?? 0,
      'quantity': quantity ?? 0,
      'barCode': barCode ?? '',
      'createdAt': createdAt ?? DateTime.now().toIso8601String(),
      'updatedAt': updatedAt ?? DateTime.now().toIso8601String(),
    };
  }

  factory ProductModel.fromMap(Map<dynamic, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      quantityPackaging: map['quantityPackaging'] != null
          ? map['quantityPackaging'] as int
          : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      barCode: map['barCode'] != null ? map['barCode'] as String : null,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
