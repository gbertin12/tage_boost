import 'package:flutter/material.dart';
import 'package:tage_boost/widgets/home/CustomTextButton.dart';

class HorizontalScrollLogiqueCategories extends StatelessWidget {
  HorizontalScrollLogiqueCategories();

  @override
  Widget build(BuildContext context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
                CustomTextButton(id: 0, text: "Nothing Logique")
            ],
        );
    }
}