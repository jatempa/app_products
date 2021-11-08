// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/product_list_view.dart';

class Routes {
  static const String productListView = '/';
  static const all = <String>{
    productListView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.productListView, page: ProductListView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    ProductListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProductListView(),
        settings: data,
      );
    },
  };
}
