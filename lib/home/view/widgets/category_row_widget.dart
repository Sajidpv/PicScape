import 'package:flutter/material.dart';
import 'package:picscape/configs/app_themes/colors.dart';
import 'package:picscape/configs/utils/extensions.dart';

class CategoryRowWidget extends StatelessWidget {
  const CategoryRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.homeProvider.categories;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.homeProvider.setNewCategory(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage('assets/${categories[index]}.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: const TextStyle(
                    color: AppPellet.whiteBackground,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
