import 'package:flutter/material.dart';
import 'package:tage_boost/widgets/home/CustomTextButton.dart';

class HorizontalScrollExpressionCategories extends StatelessWidget {
  HorizontalScrollExpressionCategories();

  @override
  Widget build(BuildContext context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
                CustomTextButton(id: 0, text: "Nothing Expression")
            ],
        );
    }
}