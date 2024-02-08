import 'package:flutter/material.dart';

class SProductTitleText extends StatelessWidget {
  const SProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLine = 3,
    this.textAlign = TextAlign.left,
    this.bold = false, // New parameter for making text bold
  });

  final String title;
  final bool smallSize;
  final int maxLine;
  final TextAlign textAlign;
  final bool bold; // New parameter for making text bold

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: bold // Check if text should be bold
          ? (smallSize
          ? Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)
          : Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold))
          : (smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }
}

