import 'dart:math';
import 'package:tage_boost/data/data.dart';

bool algoIsConstant(List<int> algo) {
    for (int i = 1; i < 5; i++)
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

int getMaxSomme(List<int> algo, bool isNumber) {
    int maxEcart = 0;
    int maxSomme = isNumber ? 10 : 26;

    if (algo[0] < 0) {
        maxEcart = algo[0] * -1;
    } else {
        maxEcart = algo[0];
    }
    for (int i = 1; i < 5; i++)
    {
        if (algo[i] < 0) {
            algo[i] = algo[i] * -1;
        }
        if (maxEcart < algo[i]) {
            maxEcart = algo[i];
        }
    }
    return maxSomme - maxEcart;
}

bool isNegatifAlgorithm(List<int> algo) {
    for (int i = 0; i < 5; i++)
    {
        if (algo[i] < 0) {
            return true;
        }
    }
    return false;
}

List<List<itemLogique>> contentQuestionSomme(List<int> algo, bool isNumber) {
    List<List<itemLogique>>     list = [];
    int                         max = isNumber ? 9 : 26;
    List<itemLogique> row = [];

    int     column1      = algo[5];
    int     column2      = algo[6];
    int     column3      = 0;
    bool    fullColumn   = false;
    bool    isConstant   = algoIsConstant(algo);
    int     startSomme   = Random().nextInt(getMaxSomme(algo, isNumber));

    if (isNegatifAlgorithm(algo)) {
        startSomme = max - startSomme;
    }
    // si toutes les colonnes sont sélectionnées
    // sinon je trouve la derniere colonne
    if (algo.length == 8) {
        column3 = algo[7];
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

    itemLogique valueColumn1 = itemLogique(value: 0, mark: false);
    itemLogique valueColumn2 = itemLogique(value: 0, mark: false);
    itemLogique valueColumn3 = itemLogique(value: 0, mark: false);

    int somme = 0;
    // si algo.lenght != 8 column 3 = column will be fill by random int
    for (int i = 0; i < 5; i++)
    { 
        somme = startSomme + algo[i];
        
        // si on utilise les 3 columns
        if (fullColumn) 
        {
            valueColumn1.value = Random().nextInt(max - 2);
            valueColumn2.value = Random().nextInt(max - valueColumn1.value - 1);
            valueColumn3.value = somme - valueColumn1.value - valueColumn2.value;
            // check si ce triple de valeur n'est pas déjà dans la liste
            if (isConstant) {
                while (list.any((element) => element[column1].value == valueColumn1.value && element[column2].value == valueColumn2.value)) {
                    valueColumn1.value = Random().nextInt(max - 2);
                    valueColumn2.value = Random().nextInt(max - valueColumn1.value - 1);
                    valueColumn3.value = somme - valueColumn1.value - valueColumn2.value;
                }
            }
        } else {
            valueColumn1.value = Random().nextInt(max - 1);
            valueColumn2.value = somme - valueColumn1.value;
            // check si cette paire de valeur n'est pas déjà dans la liste
            if (isConstant) {
                while (list.any((element) => element[column1].value == valueColumn1.value)) {
                    valueColumn1.value = Random().nextInt(max - 1);
                    valueColumn2.value = somme - valueColumn1.value;
                }
            }
        }
        row[column1] = itemLogique(value: valueColumn1.value, mark: valueColumn1.mark);
        row[column2] = itemLogique(value: valueColumn2.value, mark: valueColumn2.mark);
        row[column3] = itemLogique(value: valueColumn3.value, mark: valueColumn3.mark);
        list.add(row);
    }
    return list;
}