import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;

  ProductImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url != null)
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 60,
          minWidth: 60,
          maxHeight: 60,
          maxWidth: 60
        ),
        child: Image.network(url!),
      );

    return SizedBox();
  }
}