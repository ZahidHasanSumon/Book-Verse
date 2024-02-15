import 'package:book_verse/utils/custom_themes/sizes.dart';
import 'package:flutter/material.dart';

class SRoundedImage extends StatelessWidget {
  const SRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
    this.leadingIcon,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(TSizes.md),
            ),
            child: ClipRRect(
              borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
              child: Image(
                image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
                fit: fit,
                width: width, // Ensure the image takes up the width defined by the width property
                height: height, // Optionally, ensure the image takes up the height defined by the height property
              ),
            ),
          ),
          if (leadingIcon != null)
            Positioned(
              top: 0,
              left: 20,
              child: IconButton(
                icon: Icon(
                  leadingIcon,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
        ],
      ),
    );
  }
}

