import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:tage_boost/data/data.dart';
import 'package:tage_boost/themes/global.dart';



class CustomButtonExercice extends StatelessWidget {
  final Widget customWidgetType;
  final String text;

  CustomButtonExercice({required this.text, required this.customWidgetType});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.3;
    double buttonHeight = 60.0; // Hauteur fixe pour les boutons
    double padding = 8.0; // Ajustez la valeur de la marge extérieure

    return Container(
      width: buttonWidth, // Largeur fixe du container
      height: buttonHeight, // Hauteur fixe du container
      margin: EdgeInsets.all(padding),
      alignment: Alignment.center, 
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => customWidgetType),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: PrimaryColor, // Couleur primaire pour le texte
          padding: EdgeInsets.all(padding), // Marge intérieure uniforme
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: PrimaryColor), // Bordure de couleur primaire
          ),
        ),
        child: Center( // Centre les éléments horizontalement et verticalement
          child: Text(
            text,
            style: TextStyle(fontSize: 12), // Ajustez la taille de police si nécessaire
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class HorizontalScrollExercices extends StatelessWidget {
  HorizontalScrollExercices();

  @override
  Widget build(BuildContext context) {
    final categorieProvider = Provider.of<CategorieProvider>(context);

    // first step: filter exercices by subcategory
    final filteredExercises = listExercicesWithTheorie[categorieProvider.mainCategorie];

    // second step: remove exercices that are not in the subcategory
    final exercisesForSubCategory = filteredExercises.where((exerciceWithTheorie) =>
        exerciceWithTheorie.idSubCategory == categorieProvider.subCategorie).toList();

    // third step: create a list of list of exercices (2 exercices per row)
    final List<List<ExerciceWithTheorie>> dividedExercises = [];

    for (int i = 0; i < exercisesForSubCategory.length; i += 2) {
        ExerciceWithTheorie first = exercisesForSubCategory[i];
        if (i + 1 >= exercisesForSubCategory.length) {
          dividedExercises.add([first]);
          break;
        }

        ExerciceWithTheorie second = exercisesForSubCategory[i + 1];
        dividedExercises.add([first, second]);
    }
    // fourth step: create a list of columns
    final List<Column> columns = [];
    for (int i = 0; i < dividedExercises.length; i++) {
      List<ExerciceWithTheorie> exercices = dividedExercises[i];
      List<Widget> widgets = [];

      for (int j = 0; j < exercices.length; j++) {
        ExerciceWithTheorie exercice = exercices[j];
        widgets.add(CustomButtonExercice(
            text: exercice.text, customWidgetType: exercice.customWidgetExercice));
      }

      columns.add(Column(
        children: widgets,
      ));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < columns.length; i++) 
            columns[i],
        ],
      ),
    );
  }
}
