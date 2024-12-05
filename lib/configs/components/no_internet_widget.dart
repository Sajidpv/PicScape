import 'package:flutter/material.dart';

import '../app_configs/app_strings.dart';

class InterNetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InterNetExceptionWidget({super.key, required this.onPress});

  @override
  State<InterNetExceptionWidget> createState() =>
      _InterNetExceptionWidgetState();
}

class _InterNetExceptionWidgetState extends State<InterNetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Icon(
            Icons.cloud_off,
            color: Colors.red,
            size: 50,
          ),
          Center(
            child: Text(AppStrings.netWorkError,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 14)),
          ),
          ElevatedButton(
            onPressed: widget.onPress,
            child: Center(
              child: Text(
                AppStrings.retry,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
