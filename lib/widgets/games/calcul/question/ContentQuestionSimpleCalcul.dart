import 'dart:math';

// Multiplication 
String QuestionMultiplication(int q1, int q2) {
    return '$q1 x $q2';
}

int AnswerMultiplication(int q1, int q2) {
    return q1 * q2;
}

// Division
String QuestionDivision(int q1, int q2) {
    return '$q1 / $q2';
}

int AnswerDivision(int q1, int q2) {
    return q1 ~/ q2;
}

// Addition
String QuestionAddition(int q1, int q2) {
    return '$q1 + $q2';
}

int AnswerAddition(int q1, int q2) {
    return q1 + q2;
}

// Soustraction
String QuestionSoustraction(int q1, int q2) {
    if (q1 < q2) return QuestionSoustraction(q2, q1);
    return '$q1 - $q2';
}

int AnswerSoustraction(int q1, int q2) {
    if (q1 < q2) return AnswerSoustraction(q2, q1);
    return q1 - q2;
}

// Carré
String QuestionCarre(int q1, int q2) {
    return '$q1 ^ 2';
}

int AnswerCarre(int q1, int q2) {
    return pow(q1, 2).toInt();
}

// Cube
String QuestionCube(int q1, int q2) {
    return '$q1 ^ 3';
}

int AnswerCube(int q1, int q2) {
    return pow(q1, 3).toInt();
}