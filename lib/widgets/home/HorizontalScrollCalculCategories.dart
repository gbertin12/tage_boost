import 'package:flutter/material.dart';
import 'package:tage_boost/widgets/home/CustomTextButton.dart';

class HorizontalScrollCalculCategories extends StatelessWidget {
  HorizontalScrollCalculCategories();

  @override
  Widget build(BuildContext context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
                CustomTextButton(id: 0, text: "Calcul Mental"),
                CustomTextButton(id: 1, text: "Problèmes"),
                CustomTextButton(id: 2, text: "All"),
            ],
        );
    }
}
