import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:picscape/configs/components/notification_handler.dart';

class Utils {
  static void flushBarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  final NotificationService notificationService = NotificationService();

  Future<bool> requestNotificationPermission() async {
    final permission = await Permission.notification.request();
    if (permission.isDenied) {
      return false;
    } else if (permission.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    } else if (permission.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> downloadImage(String url, context) async {
    final nPermission = await requestNotificationPermission();
    if (nPermission) {
      const downloadId = 1;

      try {
        final directory = await getDownloadsDirectory();
        if (directory == null) {
          throw 'Could not get download directory.';
        }

        String sanitizedFileName =
            url.split('/').last.replaceAll(RegExp(r'[^\w\.-]'), '_');
        final filePath = '${directory.path}/$sanitizedFileName';

        notificationService.showProgressNotification(
          id: downloadId,
          title: 'Downloading Image',
          progress: 0,
        );
        await Dio().download(
          url,
          filePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              final progress = (received / total * 100).toInt();
              notificationService.showProgressNotification(
                id: downloadId,
                title: 'Downloading Image',
                progress: progress,
              );
              debugPrint(
                  'Downloading: ${(received / total * 100).toStringAsFixed(0)}%');
            }
          },
        );

        notificationService.showCompletedNotification(
          id: downloadId,
          title: 'Download Complete',
          body: 'Image has been downloaded successfully!\n$filePath',
        );
      } catch (e) {
        notificationService.showCompletedNotification(
          id: downloadId,
          title: 'Download Failed',
          body: 'An error occurred while downloading the image.',
        );
        if (kDebugMode) debugPrint('Download error: $e');
      }
    } else {
      Utils.flushBarMessage('Please enable necessory permission!', context);
      await openAppSettings();
    }
  }
}
