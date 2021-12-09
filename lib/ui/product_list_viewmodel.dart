import 'package:stacked/stacked.dart';

import 'package:app_products/di/app.locator.dart';
import 'package:app_products/models/Product.dart';
import 'package:app_products/services/ProductService.dart';

class ProductListViewModel extends BaseViewModel {
  String title = 'Products';
  final _productsService = locator<ProductService>();
  late List<Product>? _products = [];
  List<Product>? get products => _products;

  Future<void> fetchProducts() async {
    try {
      setBusy(true);
      _products = await _productsService.fetchProducts();
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      setBusy(false);
    }
  }
}