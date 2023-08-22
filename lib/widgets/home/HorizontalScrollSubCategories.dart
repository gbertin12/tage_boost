import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:tage_boost/data/data.dart';
import 'package:tage_boost/themes/global.dart';



class CustomTextButtonSubCategory extends StatelessWidget {
  final int id;
  final String text;

  CustomTextButtonSubCategory({required this.id, required this.text});

  @override
  Widget build(BuildContext context) {
    final categorieProvider = Provider.of<CategorieProvider>(context);
    double padding = MediaQuery.of(context).size.width * 0.05;

    return Container(
        margin: EdgeInsets.only(left: padding), 
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

class HorizontalScrollSubCategories extends StatelessWidget {
  HorizontalScrollSubCategories();

  @override
  Widget build(BuildContext context) {
    final categorieProvider = Provider.of<CategorieProvider>(context);
    final padding = MediaQuery.of(context).size.width * 0.05;

    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: SingleChildScrollView( // Ajout du SingleChildScrollView ici
        scrollDirection: Axis.horizontal, // Définir la direction du défilement
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (Category subCategorie in listSubCategories[categorieProvider.mainCategorie])
              CustomTextButtonSubCategory(id: subCategorie.id, text: subCategorie.text),
          ],
        ),
      ),
    );
  }
}
