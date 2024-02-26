import 'dart:convert';
import '../../domain/entities/stock_product.dart';
import 'package:app_estoque/presentation/data/models/product_model.dart';

// ignore_for_file: must_be_immutable

class StockProductModel extends StockProductEntity {
  StockProductModel({
    super.id,
    super.userID,
    super.statusID,
    super.unitStore,
    super.date,
    super.createdAt,
    super.updatedAt,
    super.product,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? '',
      'userID': userID ?? '',
      'statusID': statusID ?? 0,
      'unitStore': unitStore ?? '',
      'date': date,
      'createdAt': createdAt ?? DateTime.now().toIso8601String(),
      'updatedAt': updatedAt ?? DateTime.now().toIso8601String(),
      'product': product == null ? [] : product!.map((x) => x).toList(),
    };
  }

  factory StockProductModel.fromMap(dynamic map) {
    return StockProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      statusID: map['statusID'] != null ? map['statusID'] as int : null,
      unitStore: map['unitStore'] != null ? map['unitStore'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      product: map['product'] != null
          ? List<ProductModel>.from(
              (map['product'] as List<dynamic>).map<ProductModel?>(
                (x) => ProductModel.fromMap(x as Map<dynamic, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StockProductModel.fromJson(String source) =>
      StockProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
