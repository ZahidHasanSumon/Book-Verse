import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../helpers/helper_func.dart';
import '../helpers/scolors.dart';
import '../screens/downloads.dart';
import '../screens/home_screen.dart';
import '../screens/library.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
            ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? SColors.black : Colors.white,
          indicatorColor: darkMode ? SColors.white.withOpacity(0.1) : SColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home),label: 'Home',),
            NavigationDestination(icon: Icon(Iconsax.shop),label: 'Library',),
            NavigationDestination(icon: Icon(Iconsax.document_download),label: 'Downloads',),

          ],

        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),

    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

 // final screens = [const HomeScreen(), const StoreScreen(), const FavouriteScreen(), const SettingsScreen()];
  final screens = [const HomeScreen(), const Library(), const Downloads()];

}



