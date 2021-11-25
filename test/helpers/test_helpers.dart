
import 'package:app_products/di/app.locator.dart';
import 'package:app_products/services/ProductService.dart';
import 'package:mockito/annotations.dart';

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<ProductService>(returnNullOnMissingStub: true),
])
MockProductService getAndRegisterProductService() {
  _removeRegistrationIfExists<ProductService>();
  final service = MockProductService();

  locator.registerSingleton<ProductService>(service);
  return service;
}

void registerServices() {
  getAndRegisterProductService();
}

void unregisterServices() {
  locator.unregister<ProductService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}