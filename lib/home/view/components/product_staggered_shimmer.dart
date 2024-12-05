import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picscape/home/view/components/product_shimmer.dart';

class ProductStaggeredShimmer extends StatelessWidget {
  const ProductStaggeredShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: const ProductShimmer()),
          ),
        );
      },
    );
  }
}
