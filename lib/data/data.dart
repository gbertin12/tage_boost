import 'package:flutter/material.dart';
import 'package:tage_boost/data/ExerciceWithTheorieData/calculExerciceWithTheorieData.dart';
import 'package:tage_boost/data/ExerciceWithTheorieData/logiqueExerciceWithTheorieData.dart';

class Category {
    final int id;
    final String text;

    Category({required this.id, required this.text});
}

class itemLogique {
    int _value;
    final bool mark;

    itemLogique({required int value, required this.mark}) : _value = value;

    int get value => _value;

    set value(int newValue) {
        _value = newValue;
    }
}


class ExerciceWithTheorie {
    final int id;
    final int idSubCategory;
    final Widget customWidgetExercice;
    final Widget customWidgetTheorie;
    final String text;

    ExerciceWithTheorie({required this.id, required this.idSubCategory, required this.text, required this.customWidgetExercice, required this.customWidgetTheorie});
}


// liste affiché dans la home Page selon la Main Catégorie sélectionné
List<List<Category>> listSubCategories = [
    [
        // Calcul Mental
        Category(id: 0, text: "Calcul Mental"),
        Category(id: 1, text: "Problèmes"),
    ],
    [
        // Logique
        Category(id: 0, text: "Lettres"),
        Category(id: 1, text: "Chiffres")
    ],
    [
        // Expression
        Category(id: 0, text: "Nothing Expression")
    ]
];

// liste affiché dans la home Page tout en haut
List<Category> listMainCategories = [
    Category(id: 0, text: "Calcul"),
    Category(id: 1, text: "Logique"),
    Category(id: 2, text: "Expression (à venir)")
];

// liste des exercices selon la subCatégorie et la main Catégorie sélectionné
List<List<ExerciceWithTheorie>> listExercicesWithTheorie = [
    // Calcul
    listCalculExercicesWithTheorie,
    // Logique
    listLogiqueExercicesWithTheorie,
];