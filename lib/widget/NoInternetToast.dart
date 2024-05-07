import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/downloads.dart';

class NoInternetToast {
  static void show(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('No active internet connection. Tap to download.'),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'Download',
        onPressed: () {
          // Redirect the user to the download screen when they tap the SnackBar action
          Get.off(() => const Downloads());
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
