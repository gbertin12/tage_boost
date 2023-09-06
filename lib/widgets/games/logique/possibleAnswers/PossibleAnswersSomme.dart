import 'package:tage_boost/data/data.dart';
import 'dart:math';

import 'package:tage_boost/widgets/games/logique/utils/Checker.dart';

String _ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
String _NUMBERS = "0123456789";



int getSomme(List<itemLogique> row)
{
    int somme = 0;
    for (int i = 0; i < 3; i++)
    {
        if (row[i].mark) {
            somme += row[i].value;
        } 
    }
    return somme;
}

List<String>    makeOptionAnswersSomme(List<itemLogique> row, int indexGoodAnswer, bool isNumber)
{
    print("makeOptionAnswersSomme");
    int                 max = isNumber ? 9 : 26;
    List<String>        list = [];
    int                 column1 = 0;
    int                 column2 = 0;
    int                 column3 = 0;
    bool                notSet = true;
    bool                notSet2 = true;
    int                 somme = getSomme(row);
    bool                fullColumn = true;

    // found place of all column
    for (int i = 0; i < 3; i++)
    {
        if (row[i].mark) {
            if (notSet) {
                column1 = i;
                notSet = false;
            } else if (notSet2) {
                column2 = i;
                notSet2 = false;
            } else {
                column3 = i;
            }
        } else {
            column3 = i;
        }
    }

    // check if all column is used
    for (int i = 0; i < 3; i++)
    {
        if (!row[i].mark) {
            fullColumn = false;
        }
    }

    // boucle de création des possibilités de réponses
    for (int i = 0; i < 5; i++)
    {
        String add = "";
        // si l'index est égal à l'index de la bonne réponse alors je l'ajoute à ma liste de possibilité
        if (i == indexGoodAnswer) {
            add += isNumber ? _NUMBERS[row[0].value] : _ALPHABET[row[0].value];
            add += isNumber ? _NUMBERS[row[1].value] : _ALPHABET[row[1].value];
            add += isNumber ? _NUMBERS[row[2].value] : _ALPHABET[row[2].value];
            list.add(add);
            continue ;
        }
        int valueColumn1 = Random().nextInt(max);
        int valueColumn2 = Random().nextInt(max);
        int valueColumn3 = Random().nextInt(max);
       
        
        if (fullColumn) {
            // check si ce triple est égale à la bonne réponse
            while (valueColumn1 + valueColumn2 + valueColumn3 == somme) {
                valueColumn1 = Random().nextInt(max);
                valueColumn2 = Random().nextInt(max);
                valueColumn3 = Random().nextInt(max);
            }
        } else {
            // check si ce double est égale à la bonne réponse
            while (valueColumn1 + valueColumn2 == somme) {
                valueColumn1 = Random().nextInt(max);
                valueColumn2 = Random().nextInt(max);
            }
        }
        // met les lettre à la bonne place
        add = "";
        List<int> column = [column1, column2, column3];
        column[column1] = checkLetterOrNumber(valueColumn1, isNumber);
        column[column2] = checkLetterOrNumber(valueColumn2, isNumber);
        column[column3] = checkLetterOrNumber(valueColumn3, isNumber);
        add += isNumber ? _NUMBERS[column[0]] : _ALPHABET[column[0]];
        add += isNumber ? _NUMBERS[column[1]] : _ALPHABET[column[1]];
        add += isNumber ? _NUMBERS[column[2]] : _ALPHABET[column[2]];

        list.add(add);
    }
    print('return list');
    return list;
}

