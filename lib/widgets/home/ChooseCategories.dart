import 'package:flutter/material.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/themes/global.dart';
import 'package:tage_boost/themes/data/data.dart';

class CustomButtonCategorie extends StatelessWidget {
    final int id;
    final String text;

    CustomButtonCategorie({required this.id, required this.text});
    @override
    Widget build(BuildContext context) {
    final categorieProvider = Provider.of<CategorieProvider>(context);
    double padding = MediaQuery.of(context).size.width * 0.05;
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                TextButton(
                    onPressed: () {
                        if (id != categorieProvider.mainCategorie) {
                            categorieProvider.setSubCategorie(0);
                        }
                        categorieProvider.setMainCategorie(id);
                        
                    },
                    style: TextButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(padding),
                        backgroundColor: (categorieProvider.mainCategorie == id) ? MainCategorieColor :  MainCategorieColorLight,
                    ),
                    child: const Text(""),
                ),
                Padding(
                    padding: EdgeInsets.all(padding),
                    child : Text(text)
                ),
            ],
        );
    }
}

class ChooseCategories extends StatelessWidget {
  ChooseCategories();

  @override
  Widget build(BuildContext context) {

    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
                for (Category mainCategorie in listMainCategories)
                    CustomButtonCategorie(id: mainCategorie.id, text: mainCategorie.text),
            ],
        );
    }
}
