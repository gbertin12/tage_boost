import 'package:flutter/material.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/themes/global.dart';
import 'package:tage_boost/data/data.dart';
import 'package:tage_boost/screens/GamesScreen.dart';

class CustomButtonCategorie extends StatelessWidget {
  final int id;
  final String text;

  CustomButtonCategorie({required this.id, required this.text});

  @override
  Widget build(BuildContext context) {
    final categorieProvider = Provider.of<CategorieProvider>(context);
    double padding = MediaQuery.of(context).size.width * 0.05;
    padding = 20;
    return Container(
      width: MediaQuery.of(context).size.width * 0.5, // Reprend la largeur du CustomButtonExercice
      height: 60.0,
      margin: EdgeInsets.all(padding),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
            if (id != 2)
            {
                if (id != categorieProvider.mainCategorie) {
                    categorieProvider.setSubCategorie(0);
                }
                categorieProvider.setMainCategorie(id);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Games(title: text)),
                );
            }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: PrimaryColor,
          padding: EdgeInsets.all(padding * 0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: PrimaryColor),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: padding / 1.3),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ChooseCategories extends StatelessWidget {
  ChooseCategories();

  @override
  Widget build(BuildContext context) {
      return Center(

        child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    for (Category mainCategorie in listMainCategories)
                        CustomButtonCategorie(id: mainCategorie.id, text: mainCategorie.text),
                ],
        )
    );
    }
}
