import 'dart:math';
import 'package:flutter/services.dart';
import 'package:tage_boost/data/data.dart';
import 'package:tage_boost/widgets/games/logique/utils/Checker.dart';

bool algoIsConstant(List<int> algo) {
    for (int i = 1; i < 4; i++)
    {
        int value1 = algo[i];
        int value2 = algo[i - 1];
        // transforme les valeurs en positif
        if (value1 < 0) {
            value1 = value1 * -1;
        }
        if (value2 < 0) {
            value2 = value2 * -1;
        }
        if (value1 != value2) {
            return false;
        }
    }
    return true;
}

int getMaxSomme(List<int> algo, bool fullColumn, bool isNumber) {
    int maxEcart = 0;
    int maxSomme = isNumber ? 10 : 26;
    int ecart = 0;

    for (int i = 0; i < 4; i++)
    {
        ecart = algo[i];
        if (ecart < 0) {
            ecart = ecart * -1;
        }
        if (maxEcart < ecart) {
            maxEcart = ecart;
        }
    }
    if (fullColumn) {
        maxSomme = maxSomme * 3;
    } else {
        maxSomme = maxSomme * 2;
    } 
    return maxSomme - maxEcart - 6;
}

bool isNegatifAlgorithm(List<int> algo) {
    for (int i = 0; i < 4; i++)
    {
        if (algo[i] < 0) {
            return true;
        }
    }
    return false;
}

int additionnelInt(int rest, bool fullColumn, int whichCol, int max)
{
    int ret = 0;
    int nbRestCol =  0;
    int minRetValue = 0;
    // check combien il reste de column après
    if (fullColumn) {
        nbRestCol = 3 - whichCol;
    } else {
        nbRestCol = 2 - whichCol;
    }
    if (nbRestCol == 0) {
        return rest;
    }
    if (nbRestCol == 1) {
        if (rest > max) {
            minRetValue = rest - max;
            ret = minRetValue + Random().nextInt(max - minRetValue);
        } else {
            ret = Random().nextInt(rest);
        }
    } else {
        if (rest > max * 2) {
            minRetValue = rest - max * 2;
            ret = minRetValue + Random().nextInt(max - minRetValue);
        } else {
            ret = Random().nextInt(rest);
        }
    }
    return ret;
}

List<List<itemLogique>> contentQuestionSomme(List<int> algo, bool isNumber) {
    List<List<itemLogique>>     list = [];
    int                         max = isNumber ? 9 : 26;
    List<itemLogique> row = [];

    // for (int i = 0; i < algo.length; i++)
    // {
    //     print("algo[$i] = ${algo[i]}");
    // }

    int     column1      = algo[4];
    int     column2      = algo[5];
    int     column3      = 0;
    bool    fullColumn   = false;
    bool    isConstant   = algoIsConstant(algo);
    int     startSomme   = 0;

    // si toutes les colonnes sont sélectionnées
    // sinon je trouve la derniere colonne
    if (algo.length == 7) {
        column3 = algo[6];
        fullColumn = true;
    } else {
         // found value of column3
        if (column1 == 0 && column2 == 1) {
            column3 = 2;
        } else if (column1 == 0 && column2 == 2) {
            column3 = 1;
        } else if (column1 == 1 && column2 == 2) {
            column3 = 0;
        } 
    }

    startSomme =  6 + Random().nextInt(getMaxSomme(algo, fullColumn, isNumber));
    if (isNegatifAlgorithm(algo)) {
        if (fullColumn) {
            startSomme = (max * 3) - startSomme;
        } else {
            startSomme = (max * 2) - startSomme;
        }
    }

    itemLogique valueColumn1 = itemLogique(value: 0, mark: false);
    itemLogique valueColumn2 = itemLogique(value: 0, mark: false);
    itemLogique valueColumn3 = itemLogique(value: 0, mark: false);

    int somme = startSomme;

    
    // si algo.lenght != 8 column 3 = column will be fill by random int
    for (int i = 0; i < 5; i++)
    { 
        valueColumn1.value = 0;
        valueColumn2.value = 0;
        valueColumn3.value = 0;
        if (i > 0) {
            somme += algo[i - 1];
        }
        //print("somme = $somme");
        row = [
            itemLogique(value: 0, mark: false),
            itemLogique(value: 0, mark: false),
            itemLogique(value: 0, mark: false),
        ];
        // si on utilise les 3 columns
        if (fullColumn) 
        {
            // check si la somme des 3 est bien égale à Somme
            int rest = somme; 
            valueColumn1.value = additionnelInt(rest, fullColumn, 1, max);
            rest -= valueColumn1.value;
            valueColumn2.value = additionnelInt(rest, fullColumn, 2, max);
            rest -= valueColumn2.value;
            valueColumn3.value = rest;
            // check si ce triple de valeur n'est pas déjà dans la liste
            if (isConstant) {
                while (list.any((element) => element[column1].value == valueColumn1.value && element[column2].value == valueColumn2.value)) {
                    int rest = somme; 
                    valueColumn1.value = additionnelInt(rest, fullColumn, 1, max);
                    rest -= valueColumn1.value;
                    valueColumn2.value = additionnelInt(rest, fullColumn, 2, max);
                    rest -= valueColumn2.value;
                    valueColumn3.value = rest;
                }
            }
        } else {
                int rest = somme;
                valueColumn3.value = Random().nextInt(max);
                valueColumn1.value = additionnelInt(rest, fullColumn, 1, max);
                rest -= valueColumn1.value;
                valueColumn2.value = somme - valueColumn1.value;
            // check si cette paire de valeur n'est pas déjà dans la liste
            if (isConstant) {
                while (list.any((element) => element[column1].value == valueColumn1.value)) {
                    int rest = somme;
                    valueColumn1.value = additionnelInt(rest, fullColumn, 1, max);
                    rest -= valueColumn1.value;
                    valueColumn2.value = somme - valueColumn1.value;
                }
            }
        }

        row[column1] = itemLogique(value: checkLetterOrNumber(valueColumn1.value, isNumber), mark: valueColumn1.mark);
        row[column2] = itemLogique(value: checkLetterOrNumber(valueColumn2.value, isNumber), mark: valueColumn2.mark);
        row[column3] = itemLogique(value: checkLetterOrNumber(valueColumn3.value, isNumber), mark: valueColumn3.mark);

        list.add(row);
    }
    return list;
}