import 'package:flutter/material.dart';
import 'package:tage_boost/themes/data/data.dart';
import 'package:tage_boost/widgets/games/calcul/multiplication.dart';

const int calculMentalCategory = 0;
const int problemesCategory = 1;

List<ExerciceWithTheorie> listCalculExercicesWithTheorie = [
    ExerciceWithTheorie(id: 0, idSubCategory: calculMentalCategory, text: "Multiplication", customWidgetExercice: const Multiplication(), customWidgetTheorie: Container()),
];