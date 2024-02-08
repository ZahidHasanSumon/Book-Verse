import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../utils/navbar_item.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Uncomment the following code to navigate to HomeScreen after a delay
    Future.delayed(const Duration(milliseconds: 1500), () {
      // exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);


      // navigate to home
      Get.off(() => const NavigationMenu());

    });
  }

  @override
  Widget build(BuildContext context) {
    // Initializing media query (for getting device screen size)

    // Getting dark mode status from Pref class
    final dark = SHelperFunctions.isDarkMode(context);


    return Theme(
      data: ThemeData(
       // brightness: dark ? Brightness.dark : Brightness.light,
        // Add any other theme configurations as needed
      ),
      child: Scaffold(

        // Uncomment the following line if you want to set background color based on dark mode
        backgroundColor: dark ? SColors.dark : SColors.white,


        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(

              child: Lottie.asset(
                'assets/animations/lottie_book.json',
                height: 300,
                width: double.infinity,
               // fit: BoxFit.cover,
                repeat: true,
                reverse: true,
              ),
            ),
            Text(
              'Dive into endless stories with our book app!', // Add your text here
              style: TextStyle(
                fontSize: 15, // Adjust font size as needed
                color: dark ? SColors.white : SColors.dark, // Adjust text color based on dark mode
              ),
            ),
          ],

        ),
      ),
    );
  }
}
