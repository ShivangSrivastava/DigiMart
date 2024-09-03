// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/guest/guest_export.dart';
import 'package:flutter/material.dart';

class CategoryProductWidget extends StatelessWidget {
  final List<ProductCardWidget> products;
  const CategoryProductWidget({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    int crossAxisCount = 2;
    int rowCount = (products.length / crossAxisCount).ceil();

    for (int i = 0; i < rowCount; i++) {
      List<Widget> rowItems = [];
      for (int j = 0; j < crossAxisCount; j++) {
        int index = i * crossAxisCount + j;
        if (index < products.length) {
          rowItems.add(Expanded(child: products[index]));
        } else {
          rowItems.add(const Expanded(child: SizedBox()));
        }
      }
      rows.add(Row(
        children: rowItems,
      ));
    }
    return Column(
      children: rows,
    );
  }
}
