import 'package:flutter/material.dart';
import 'package:tage_boost/data/data.dart';

import 'package:tage_boost/screens/games/calcul/TemplateCalcul.dart';


import 'package:tage_boost/widgets/games/calcul/question/ContentQuestionSimpleCalcul.dart';


const int calculMentalCategory = 0;
const int problemesCategory = 1;

class ContentOfExerciceWithTheorie {
    final String                    title;
    final CreateContentQuestion     question;
    final CreateAnswer              createAnswer;
    final int                       min; 
    final int                       max; 

    const ContentOfExerciceWithTheorie({
        required this.title,
        required this.question,
        required this.createAnswer,
        required this.min,
        required this.max,
    });
}

List<ContentOfExerciceWithTheorie> basiqueCalculMental = [
    const ContentOfExerciceWithTheorie(
        title: "Multiplication de 6 à 10", 
        question: QuestionMultiplication, 
        createAnswer: AnswerMultiplication, 
        min: 6, 
        max: 10,  
    ),
    const ContentOfExerciceWithTheorie(
        title: "Multiplication de 10 à 20", 
        question: QuestionMultiplication, 
        createAnswer: AnswerMultiplication, 
        min: 10, 
        max: 20,  
    ),
    const ContentOfExerciceWithTheorie(
        title: "Multiplication de 6 à 20", 
        question: QuestionMultiplication, 
        createAnswer: AnswerMultiplication, 
        min: 6, 
        max: 20,  
    ),
    const ContentOfExerciceWithTheorie(
        title: "Soustraction max 100", 
        question: QuestionSoustraction, 
        createAnswer: AnswerSoustraction, 
        min: 20, 
        max: 100,   
    ),
    const ContentOfExerciceWithTheorie(
        title: "Soustraction max 1000", 
        question: QuestionSoustraction, 
        createAnswer: AnswerSoustraction, 
        min: 20, 
        max: 1000,  
    ),
    const ContentOfExerciceWithTheorie(
        title: "Addition max 100", 
        question: QuestionAddition, 
        createAnswer: AnswerAddition, 
        min: 20, 
        max: 100,  
    ),
    const ContentOfExerciceWithTheorie(
        title: "Addition max 1000", 
        question: QuestionAddition, 
        createAnswer: AnswerAddition, 
        min: 20, 
        max: 1000,   
    ),
    const ContentOfExerciceWithTheorie(
        title: "Carrés de 1 à 10", 
        question: QuestionCarre, 
        createAnswer: AnswerCarre, 
        min: 1, 
        max: 10,   
    ),
    const ContentOfExerciceWithTheorie(
        title: "Carrés de 10 à 20", 
        question: QuestionCarre, 
        createAnswer: AnswerCarre, 
        min: 10, 
        max: 20,   
    ),
    const ContentOfExerciceWithTheorie(
        title: "Carrés de 1 à 20", 
        question: QuestionCarre, 
        createAnswer: AnswerCarre, 
        min: 10, 
        max: 20,   
    ),
    const ContentOfExerciceWithTheorie(
        title: "Cubes de 1 à 10", 
        question: QuestionCube, 
        createAnswer: AnswerCube, 
        min: 1, 
        max: 10, 
    ),
    const ContentOfExerciceWithTheorie(
        title: "Cubes de 10 à 20", 
        question: QuestionCube, 
        createAnswer: AnswerCube, 
        min: 10, 
        max: 20,
    ),
    const ContentOfExerciceWithTheorie(
        title: "Cubes de 1 à 20", 
        question: QuestionCube, 
        createAnswer: AnswerCube, 
        min: 1, 
        max: 20,
    ),
];

List<ExerciceWithTheorie> createBasiqueCalculMental()
{
    List<ExerciceWithTheorie> list = [];
    for (int i = 0; i < basiqueCalculMental.length; i++)
    {
       list.add(ExerciceWithTheorie(
            id: i, 
            idSubCategory: 
            calculMentalCategory, 
            text: basiqueCalculMental[i].title, 
            customWidgetExercice: TemplateCalcul(
                text: basiqueCalculMental[i].title,
                min: basiqueCalculMental[i].min, 
                max: basiqueCalculMental[i].max, 
                createContentQuestion: basiqueCalculMental[i].question, 
                createAnswer: basiqueCalculMental[i].createAnswer,
            ),
            customWidgetTheorie: Container()
       ));
    }
    return list;
}


List<ExerciceWithTheorie> listCalculExercicesWithTheorie = [
    ...createBasiqueCalculMental(),
];