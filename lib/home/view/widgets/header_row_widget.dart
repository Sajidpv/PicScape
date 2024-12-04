import 'package:flutter/material.dart';
import 'package:picscape/configs/app_themes/colors.dart';
import 'package:picscape/configs/utils/extensions.dart';

class HeaderRowWidget extends StatelessWidget {
  const HeaderRowWidget({super.key, this.isIcon = true});
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isIcon ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        if (isIcon)
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/icon.png',
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              )),
        if (isIcon) 10.width,
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'Pic',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppPellet.primaryColor,
            ),
          ),
          TextSpan(
            text: 'Scape',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ])),
      ],
    );
  }
}
