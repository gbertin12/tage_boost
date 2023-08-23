import 'package:flutter/material.dart';
import 'package:tage_boost/data/data.dart';
import 'package:tage_boost/screens/games/calcul/Multiplication.dart';


const int calculMentalCategory = 0;
const int problemesCategory = 1;

List<ExerciceWithTheorie> listCalculExercicesWithTheorie = [
    ExerciceWithTheorie(
        id: 0, 
        idSubCategory: calculMentalCategory, 
        text: "Multiplication de 1 à 10", 
        customWidgetExercice: const Multiplication(text: "Multiplication de 1 à 10", min: 1, max: 10), 
        customWidgetTheorie: Container()
    ),
    ExerciceWithTheorie(
        id: 1, 
        idSubCategory: calculMentalCategory, 
        text: "Multiplication de 10 à 20", 
        customWidgetExercice: const Multiplication(text: "Multiplication de 10 à 20", min: 10, max: 20), 
        customWidgetTheorie: Container()
    ),
    ExerciceWithTheorie(
        id: 2, 
        idSubCategory: problemesCategory, 
        text: "Multiplication de 1 à 20", 
        customWidgetExercice: const Multiplication(text: "Multiplication de 1 à 20", min: 1, max: 20), 
        customWidgetTheorie: Container()
    ),
];