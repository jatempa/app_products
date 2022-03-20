import 'dart:developer';

import 'package:app_products/api/api.dart';
import 'package:app_products/di/app.locator.dart';
import 'package:app_products/models/Product.dart';

class ProductService {
  final _api = locator<Api>();

  Future<List<Product>?> fetchProducts() async {
    try {
      final response = await _api.dio.get('products');

      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List)
          .map((p) => Product.fromJson(p))
          .toList();
      }
    } catch (error) {
      log(error.toString());
    }

    return [];
  }
}
