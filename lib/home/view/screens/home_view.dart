import 'package:flutter/material.dart';
import 'package:picscape/configs/utils/extensions.dart';
import 'package:picscape/home/view/widgets/category_row_widget.dart';
import 'package:picscape/home/view/widgets/header_row_widget.dart';
import 'package:picscape/home/view/widgets/image_grid_widget.dart';
import 'package:picscape/home/view/widgets/searchbar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            HeaderRowWidget(),
            SearchbarWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            20.height,
            CategoryRowWidget(),
            15.height,
            Expanded(child: ImageGridWidget()),
          ],
        ),
      ),
    );
  }
}
