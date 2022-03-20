import 'package:app_products/api/api.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:app_products/services/ProductService.dart';
import 'package:app_products/ui/product_list_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: ProductListView, initial: true),
  ],
  dependencies: [
    LazySingleton<Api>(classType: Api),
    LazySingleton<ProductService>(classType: ProductService),
  ],
)
class AppSetup {
}