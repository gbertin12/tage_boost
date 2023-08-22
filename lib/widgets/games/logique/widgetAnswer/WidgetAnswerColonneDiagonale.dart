import 'package:flutter/material.dart';

Container WidgetAnswerColonneDiagonale(List<int> algo, double padding)
{
    String answer = "";

    for (int i = 0; i < 4; i++)
    {
        String add = "";
        if (algo[i] >= 0) {
            add += "+" + algo[i].toString() + " ";
        } else {
            add += algo[i].toString() + " ";
        }
        answer += add;
    }
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