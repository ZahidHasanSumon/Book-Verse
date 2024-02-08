import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String message;
  final IconData? icon;

  const CustomAlert({
    super.key,
    required this.title,
    required this.message,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlertController>(
      init: AlertController(),
      builder: (controller) => Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              controller.showAlert(
                title: title,
                message: message,
                icon: icon,
              );
            },
            child: const Text('Show Alert'),
          ),
        ),
      ),
    );
  }
}

class AlertController extends GetxController {
  void showAlert({required String title, required String message, IconData? icon}) {
    Get.snackbar(
      title,
      message,
      icon: icon != null ? Icon(icon) : null,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      borderWidth: 2.0,
      borderColor: Colors.blueAccent,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      shouldIconPulse: true,
      barBlur: 20.0,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}


