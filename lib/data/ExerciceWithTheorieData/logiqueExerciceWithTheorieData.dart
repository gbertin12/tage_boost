import 'package:flutter/material.dart';
import 'package:tage_boost/data/data.dart';

// import template
import 'package:tage_boost/screens/games/logique/TemplateLogique.dart';

// import content of Question
import 'package:tage_boost/widgets/games/logique/question/ContentQuestionColonne.dart';
import 'package:tage_boost/widgets/games/logique/question/ContentQuestionDiagonales.dart';

// import content of Possibilities answers
import 'package:tage_boost/widgets/games/logique/possibleAnswers/PossibleAnswersDiagonalesColonnes.dart';

// import Algo
import 'package:tage_boost/widgets/games/logique/algorythme/algorythmeEcart.dart';

// import widget Answer
import 'package:tage_boost/widgets/games/logique/widgetAnswer/WidgetAnswerColonneDiagonale.dart';


const int LettreCategory = 0;
const int ChiffreCategory = 1;

List<ExerciceWithTheorie> listLogiqueExercicesWithTheorie = [
    ExerciceWithTheorie(
        id: 0,
        idSubCategory: LettreCategory,
        text: "Les Colonnes",
        customWidgetExercice: const TemplateLogique(
            title : "Les Colonnes",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionColonne,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: false,
        ),
         customWidgetTheorie: Container()
    ),
    ExerciceWithTheorie(
        id: 1,
        idSubCategory: LettreCategory,
        text: "Les Petites Diagonales",
        customWidgetExercice: const TemplateLogique(
            title : "Les Petites Diagonales",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionSmallDiagonale,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: false,
        ),
         customWidgetTheorie: Container()
    ),
    ExerciceWithTheorie(
        id: 2,
        idSubCategory: LettreCategory,
        text: "Les Moyennes Diagonales",
        customWidgetExercice: const TemplateLogique(
            title : "Les Moyennes Diagonales",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionMediumDiagonale,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: false,
        ),
         customWidgetTheorie: Container()
    ),
     ExerciceWithTheorie(
        id: 3,
        idSubCategory: LettreCategory,
        text: "Les Grandes Diagonales",
        customWidgetExercice: const TemplateLogique(
            title : "Les Grandes Diagonales",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionLargeDiagonale,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: false,
        ),
         customWidgetTheorie: Container()
    ),
     ExerciceWithTheorie(
        id: 4,
        idSubCategory: LettreCategory,
        text: "Les Diagonales",
        customWidgetExercice: const TemplateLogique(
            title : "Les Diagonales",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionAllDiagonales,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: false,
        ),
         customWidgetTheorie: Container()
    ),
    ExerciceWithTheorie(
        id: 5,
        idSubCategory: ChiffreCategory,
        text: "Les Colonnes",
        customWidgetExercice: const TemplateLogique(
            title : "Les Colonnes",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionColonne,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: true,
        ),
         customWidgetTheorie: Container()
    ),
    ExerciceWithTheorie(
        id: 6,
        idSubCategory: ChiffreCategory,
        text: "Les Petites Diagonales",
        customWidgetExercice: const TemplateLogique(
            title : "Les Petites Diagonales",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionSmallDiagonale,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: true,
        ),
         customWidgetTheorie: Container()
    ),
    ExerciceWithTheorie(
        id: 7,
        idSubCategory: ChiffreCategory,
        text: "Les Moyennes Diagonales",
        customWidgetExercice: const TemplateLogique(
            title : "Les Moyennes Diagonales",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionMediumDiagonale,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: true,
        ),
         customWidgetTheorie: Container()
    ),
     ExerciceWithTheorie(
        id: 8,
        idSubCategory: ChiffreCategory,
        text: "Les Grandes Diagonales",
        customWidgetExercice: const TemplateLogique(
            title : "Les Grandes Diagonales",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionLargeDiagonale,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: true,
        ),
         customWidgetTheorie: Container()
    ),
     ExerciceWithTheorie(
        id: 9,
        idSubCategory: ChiffreCategory,
        text: "Les Diagonales",
        customWidgetExercice: const TemplateLogique(
            title : "Les Diagonales",
            createContentPossibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
            createContentQuestion: contentQuestionAllDiagonales,
            algo : algorythmeEcart,
            widgetAnswer: WidgetAnswerColonneDiagonale,
            isNumber: true,
        ),
         customWidgetTheorie: Container()
    ),
];
