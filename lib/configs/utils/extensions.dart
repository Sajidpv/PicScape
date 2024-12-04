import 'package:flutter/material.dart';
import 'package:picscape/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

extension MediaQueryValues on BuildContext {
  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension Providers on BuildContext {
  HomeProvider get homeProvider =>
      Provider.of<HomeProvider>(this, listen: false);
}
