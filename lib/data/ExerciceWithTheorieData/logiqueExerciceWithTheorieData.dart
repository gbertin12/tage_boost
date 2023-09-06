import 'package:flutter/material.dart';

// import data
import 'package:tage_boost/data/data.dart';

// import template
import 'package:tage_boost/screens/games/logique/TemplateLogique.dart';
// import 'package:tage_boost/screens/games/logique/TemplateTestLogique.dart';


// import content of Question
import 'package:tage_boost/widgets/games/logique/question/ContentQuestionColonne.dart';
import 'package:tage_boost/widgets/games/logique/question/ContentQuestionDiagonales.dart';
import 'package:tage_boost/widgets/games/logique/question/ContentQuestionLignes.dart';
import 'package:tage_boost/widgets/games/logique/question/ContentQuestionSomme.dart';

// import content of Possibilities answers
import 'package:tage_boost/widgets/games/logique/possibleAnswers/PossibleAnswersDiagonalesColonnes.dart';
import 'package:tage_boost/widgets/games/logique/possibleAnswers/PossibleAnswersLigne.dart';
import 'package:tage_boost/widgets/games/logique/possibleAnswers/PossibleAnswersSomme.dart';


// import Algo
import 'package:tage_boost/widgets/games/logique/algorythme/algorythmeEcartColonneDiagonale.dart';
import 'package:tage_boost/widgets/games/logique/algorythme/algorythmeEcartLigne.dart';
// import 'package:tage_boost/widgets/games/logique/algorythme/algoSomme.dart';

// import widget Answer
import 'package:tage_boost/widgets/games/logique/widgetAnswer/WidgetAnswerColonneDiagonale.dart';
import 'package:tage_boost/widgets/games/logique/widgetAnswer/WidgetAnswerLigne.dart';
// import 'package:tage_boost/widgets/games/logique/widgetAnswer/WidgetAnswerSomme.dart';



const int lettreCategory = 0;
const int chiffreCategory = 1;
const int mixteCategory = 2;


class ContentOfExerciceWithTheorie {
    final String title;
    final CreateContentPossibleAnswers possibleAnswers;
    final CreateContentQuestion question;
    final Algorythme algo;
    final WidgetAnswer widgetAnswer;

    const ContentOfExerciceWithTheorie({
        required this.title,
        required this.possibleAnswers,
        required this.question,
        required this.algo,
        required this.widgetAnswer,
    });
}

List<ContentOfExerciceWithTheorie> communExerciceLetterNumber = [
    const ContentOfExerciceWithTheorie(
        title: "Les Colonnes", 
        possibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
        question: contentQuestionColonne, 
        algo: algorythmeEcartColonneDiagonale, 
        widgetAnswer: WidgetAnswerColonneDiagonale,
    ),
    const ContentOfExerciceWithTheorie(
        title: "Les Petites Diagonales", 
        possibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
        question: contentQuestionSmallDiagonale, 
        algo: algorythmeEcartColonneDiagonale, 
        widgetAnswer: WidgetAnswerColonneDiagonale,
    ),
    const ContentOfExerciceWithTheorie(
        title: "Les Diagonales Moyennes", 
        possibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
        question: contentQuestionMediumDiagonale, 
        algo: algorythmeEcartColonneDiagonale, 
        widgetAnswer: WidgetAnswerColonneDiagonale,
    ),
    const ContentOfExerciceWithTheorie(
        title: "Les Grandes Diagonales", 
        possibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
        question: contentQuestionLargeDiagonale, 
        algo: algorythmeEcartColonneDiagonale, 
        widgetAnswer: WidgetAnswerColonneDiagonale,
    ),
    const ContentOfExerciceWithTheorie(
        title: "Les Diagonales", 
        possibleAnswers: makeOptionAnswersDiagonalesAndColonnes, 
        question: contentQuestionAllDiagonales, 
        algo: algorythmeEcartColonneDiagonale, 
        widgetAnswer: WidgetAnswerColonneDiagonale,
    ),
    const ContentOfExerciceWithTheorie(
        title: "Les Lignes", 
        possibleAnswers: makeOptionAnswersLignes, 
        question: contentQuestionLignes, 
        algo: algorythmeEcartligne,
        widgetAnswer: WidgetAnswerLigne,
    ),
    // const ContentOfExerciceWithTheorie(
    //     title: "Les Sommes", 
    //     possibleAnswers: makeOptionAnswersSomme, 
    //     question: contentQuestionSomme, 
    //     algo: algoSomme,
    //     widgetAnswer: WidgetAnswerSomme,
    // ),
];

List<ExerciceWithTheorie> createCommunExerciceLetterNumber() {
    List<ExerciceWithTheorie> listExerciceWithTheorie = [];
    int subcategorie = lettreCategory;
    bool isNumber = false;
    for (int i = 0; i < 2; i++)
    {
        if (i == 1) {
            subcategorie = chiffreCategory;
            isNumber = true;
        }
        for (int y = 0; y < communExerciceLetterNumber.length; y++)
        {
            listExerciceWithTheorie.add(
                ExerciceWithTheorie(
                    id: y,
                    idSubCategory: subcategorie,
                    text: communExerciceLetterNumber[y].title,
                    customWidgetExercice: TemplateLogique(
                        title: communExerciceLetterNumber[y].title,
                        createContentPossibleAnswers: communExerciceLetterNumber[y].possibleAnswers,
                        createContentQuestion: communExerciceLetterNumber[y].question,
                        algo: communExerciceLetterNumber[y].algo,
                        widgetAnswer: communExerciceLetterNumber[y].widgetAnswer,
                        isNumber: isNumber,
                    ),
                    customWidgetTheorie: Container(),
                )
            );
        }
    }

    return listExerciceWithTheorie;
}

List<ExerciceWithTheorie> listLogiqueExercicesWithTheorie = [
    ...createCommunExerciceLetterNumber(),
];
