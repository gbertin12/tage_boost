import 'package:flutter/material.dart';

// si tous les éléments de algo ne sont pas identique alors les sommes sont différentes
bool isConstantAlgo(List<int> algo)
{
    for (int i = 0; i < 4; i++)
    {
        if (algo[i] != 0) {
            return false;
        }
    }
    return true;
}


Container WidgetAnswerSomme(List<int> algo, double padding)
{
    bool constAlgo = isConstantAlgo(algo);
    String answerEcart = "";
    String answerWhichCol = "";

    if (constAlgo) {
        answerEcart = "Somme égale";
    } else {
        answerEcart = "Somme avec écart : ";
        
        for (int i = 0; i < 4; i++)
        {
            //print(algo[i]);
            String add = "";
            if (algo[i] >= 0) {
                add += "+" + algo[i].toString() + " ";
            } else {
                add += algo[i].toString() + " ";
            }
            answerEcart += add;
        }
    }

    if (algo.length == 7) {
        answerWhichCol += "On additionne toutes les colonnes";
    } else {
        int col1 = algo[4];
        int col2 = algo[5];

        if (col1 > col2)
        {
            int tmp = col1;
            col1 = col2;
            col2 = tmp;
        }
        if (col1 == 0)
            answerWhichCol += "On additionne la 1";
        else {
            answerWhichCol += "On additionne la " + (col1 + 1).toString();
        }
        answerWhichCol += " et la " + (col2 + 1).toString();
    }

    return Container(

        child : Column (
            children: [
                Text(
                    answerWhichCol,
                    style: TextStyle(
                        fontSize: padding / 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                    ),  
                ),
                Text(
                    answerEcart,
                    style: TextStyle(
                        fontSize: padding / 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                    ),  
                ),
            ],
        )
    );
}