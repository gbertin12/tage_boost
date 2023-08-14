import 'package:flutter/material.dart';
import 'package:tage_boost/themes/data/calculExerciceWithTheorieData.dart';
import 'package:tage_boost/themes/data/logiqueExcerciceWithTheorieData.dart';
import 'package:tage_boost/themes/data/expressionExerciceWithTheorieData.dart';

class Category {
    final int id;
    final String text;

    Category({required this.id, required this.text});
}

class ExerciceWithTheorie {
    final int id;
    final int idSubCategory;
    final Widget customWidgetExercice;
    final Widget customWidgetTheorie;
    final String text;

    ExerciceWithTheorie({required this.id, required this.idSubCategory, required this.text, required this.customWidgetExercice, required this.customWidgetTheorie});
}

List<List<Category>> listSubCategories = [
    [
        Category(id: 0, text: "Calcul Mental"),
        Category(id: 1, text: "Problèmes")
    ],
    [
        Category(id: 0, text: "Nothing Logique")
    ],
    [
        Category(id: 0, text: "Nothing Expression")
    ]
];

List<Category> listMainCategories = [
    Category(id: 0, text: "Calcul"),
    Category(id: 1, text: "Logique"),
    Category(id: 2, text: "Expression")
];

List<List<ExerciceWithTheorie>> listExercicesWithTheorie = [
    // Calcul
    listCalculExercicesWithTheorie,
    // Logique
    listLogiqueExercicesWithTheorie,
    // Expression
    listExpressionExercicesWithTheorie
];