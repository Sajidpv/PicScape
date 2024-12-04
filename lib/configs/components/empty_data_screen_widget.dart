// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NoDataScreenWidget extends StatelessWidget {
  const NoDataScreenWidget({
    super.key,
    this.message,
    this.onRefresh,
    this.buttonText = 'Refresh',
  });
  final String? message, buttonText;
  final Future<void> Function()? onRefresh;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              message == null ? 'No Images found' : message!,
            ),
          ),
        ],
      ),
    );
  }
}
