import 'package:book_verse/screens/splash_screen.dart';
import 'package:book_verse/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/connectivity_controller.dart';
import 'firebase_options.dart';
import 'internet_check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ConnectivityController connectivityController = Get.put(ConnectivityController());

    return Obx(
          () => GetMaterialApp(
        title: 'Book Verse',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: SAppTheme.lightTheme,
        darkTheme: SAppTheme.darkTheme,
        home: connectivityController.isConnected.value ? const SplashScreen() : const InternetCheck(child: Placeholder()),
      ),
    );
  }
}
