import 'package:flutter/material.dart';

Container WidgetAnswerLigne(List<int> algo, double padding)
{
    String answer = "Ecart de : ";

    String add = "";
    for (int i = 0; i < 5; i++)
    {
        add = "";
        if (algo[i] >= 0) {
            add += "+" + algo[i].toString() + " ";
        } else {
            add += algo[i].toString() + " ";
        }
        answer += add;
    }
    int col1 = algo[5];
    int col2 = algo[6];
    if (col1 > col2)
    {
        int tmp = col1;
        col1 = col2;
        col2 = tmp;
    }
    if (col1 == 0)
        answer += "Entre la 1";
    else
        answer += "Entre la " + (col1 + 1).toString();
    answer += " et la " + (col2 + 1).toString();
    return Container(
        child : Text(
            "Réponse : " + answer,
            style: TextStyle(
                fontSize: padding / 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.green
            ),  
        ),
    );
}