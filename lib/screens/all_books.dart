import 'package:flutter/material.dart';
import '../utils/custom_themes/appbar.dart';
import '../utils/custom_themes/sizes.dart';
import '../widget/grid_layout.dart';
import '../widget/productcard_vertical.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        title: Text('All Books'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SGridLayout(itemCount: 30, itemBuilder: (_, index) => const SProductCardVertical()),
      ),
    );
  }
}


