import 'package:flutter/material.dart';
import 'package:picscape/configs/app_themes/colors.dart';
import 'package:picscape/configs/utils/extensions.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: context.homeProvider.searchImage,
                decoration: InputDecoration(
                  hintText: 'Search images (nature, animals)...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.search),
              color: AppPellet.primaryColor,
              iconSize: 30,
              onPressed: context.homeProvider.searchImages),
        ],
      ),
    );
  }
}
