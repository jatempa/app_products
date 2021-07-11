import 'package:freezed_annotation/freezed_annotation.dart';

part 'Product.freezed.dart';
part 'Product.g.dart';

@freezed
class Product with _$Product {
  Product._();

  factory Product({
    required int id,
    String? category,
    String? description,
    String? image,
    @JsonKey(name: 'title') String? name,
    double? price
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}