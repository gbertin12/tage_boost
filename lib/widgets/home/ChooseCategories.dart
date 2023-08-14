import 'package:flutter/material.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/themes/global.dart';

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
                        categorieProvider.setMainCategorie(id);
                        categorieProvider.setSubCategorie(0);
                    },
                    style: TextButton.styleFrom(
                        shape: CircleBorder(),
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

    final categorieProvider = Provider.of<CategorieProvider>(context);
    double padding = MediaQuery.of(context).size.width * 0.05;

    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            CustomButtonCategorie(id: 0, text: "Calcul"),
            CustomButtonCategorie(id: 1, text: "Logique"),
            CustomButtonCategorie(id: 2, text: "Expression")       
        ]);
    }
}
