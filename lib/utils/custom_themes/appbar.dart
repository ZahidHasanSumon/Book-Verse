import 'package:book_verse/utils/custom_themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../helpers/helper_func.dart';
import '../../helpers/scolors.dart';
import 'device_utility.dart';

class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SAppBar({
    super.key,
    this.title,
    this.action,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.centerTitle,
    this.trailingIcon,
    this.trailingOnPressed,
    this.showTrailingIcon = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final List<Widget>? action;
  final bool? centerTitle;

  final bool showTrailingIcon;
  final IconData? trailingIcon;
  final VoidCallback? trailingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Iconsax.arrow_left_2, color: dark ? SColors.white : SColors.black),)
            : leadingIcon != null
            ? IconButton(
            onPressed: leadingOnPressed,
            icon: const Icon(Iconsax.arrow_left_2))
            : null,
        title: title,
        actions: action,
        centerTitle: centerTitle,

      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SDeviceUtils.getAppBarHeight());
}
