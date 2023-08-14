import 'package:flutter/material.dart';
import 'package:tage_boost/widgets/home/CustomTextButtonSubCategory.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:tage_boost/themes/data/data.dart';
import 'package:tage_boost/themes/global.dart';



class CustomButtonExercice extends StatelessWidget {
  final Widget customWidgetType;
  final String text;

  CustomButtonExercice({required this.text, required this.customWidgetType});

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.05;

    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => customWidgetType), // Utilisez customWidgetType comme type
          );
        },
        child: Text(text, style: TextStyle(color: PrimaryColor)),
      ),
    );
  }
}



class HorizontalScrollExercices extends StatelessWidget {
  HorizontalScrollExercices();

  @override
  Widget build(BuildContext context) {
    final categorieProvider = Provider.of<CategorieProvider>(context);
    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
                for (ExerciceWithTheorie exerciceWithTheorie in listExercicesWithTheorie[categorieProvider.mainCategorie])
                    if (exerciceWithTheorie.idSubCategory == categorieProvider.subCategorie)
                        CustomButtonExercice(text: exerciceWithTheorie.text, customWidgetType: exerciceWithTheorie.customWidgetExercice),
            ],
        );
    }
}