import 'dart:io';
import 'package:flutter/material.dart';
import 'package:picscape/configs/app_themes/colors.dart';

class WillPopScopWidget extends StatelessWidget {
  const WillPopScopWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) {
            return;
          }
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                title: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                        'Are you sure to exit?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => exit(0),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppPellet.primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                                child: Text(
                              'Leave',
                              style: TextStyle(
                                  color: AppPellet.whiteBackground,
                                  fontSize: 14),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          );
        },
        child: child);
  }
}
