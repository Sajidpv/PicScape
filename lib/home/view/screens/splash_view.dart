import 'dart:async';

import 'package:flutter/material.dart';
import 'package:picscape/configs/routes/route_names.dart';
import 'package:picscape/configs/utils/extensions.dart';
import 'package:picscape/home/view/widgets/header_row_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.home, (route) => false));
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/icon.png',
              height: 200,
            ),
          ),
          Positioned.fill(
              top: context.mediaQueryHeight / 3,
              child: const HeaderRowWidget(
                isIcon: false,
              )),
          Positioned(
            top: 60,
            right: 0,
            child: TextButton.icon(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, RoutesName.home, (route) => false),
              icon: const Text(
                "Explore",
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
