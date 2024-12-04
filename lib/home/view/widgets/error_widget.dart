import 'package:flutter/material.dart';
import 'package:picscape/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../configs/app_configs/app_strings.dart';
import '../../../../configs/components/no_internet_widget.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({super.key, required this.onTap, this.list});
  final void Function() onTap;
  final String? list;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      if (list.toString() == AppStrings.noInternet) {
        return InterNetExceptionWidget(onPress: onTap);
      } else {
        return InkWell(
            onTap: onTap, child: Center(child: Text(list.toString())));
      }
    });
  }
}
