import 'package:flutter/material.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/themes/global.dart';



class CustomTextButton extends StatelessWidget {
  final int id;
  final String text;

  CustomTextButton({required this.id, required this.text});

  @override
  Widget build(BuildContext context) {
    final categorieProvider = Provider.of<CategorieProvider>(context);
    double padding = MediaQuery.of(context).size.width * 0.05;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(padding),
        border: (categorieProvider.subCategorie != id)
            ? Border.all(
                color: SecondaryColor,
                width: 1.0,
              )
            : null,
      ),
      child: TextButton(
        onPressed: () {
          categorieProvider.setSubCategorie(id);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
            top: padding / 2.5,
            bottom: padding / 2.5),
          backgroundColor: (categorieProvider.subCategorie == id)
              ? SecondaryColor
              : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(padding),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: (categorieProvider.subCategorie == id)
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}