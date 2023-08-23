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

List<List<itemLogique>> contentQuestionLignes(List<int> algo, bool isNumber) {
    List<List<itemLogique>>     list = [];
    int                         max = isNumber ? 9 : 26;
    List<itemLogique> row = [];

    int     column1      = algo[5];
    int     column2      = algo[6];
    int     column3      = 0;
    bool    isConstant   = algoIsConstant(algo);
    int     ecart        = 0;

    // found value of column3
    if (column1 == 0 && column2 == 1) {
        column3 = 2;
    } else if (column1 == 0 && column2 == 2) {
        column3 = 1;
    } else if (column1 == 1 && column2 == 2) {
        column3 = 0;
    } 
    // column 3 = column will be fill by random int
    for (int i = 0; i < 5; i++)
    {
        row = [
            itemLogique(value: 0, mark: false),
            itemLogique(value: 0, mark: false),
            itemLogique(value: 0, mark: false),
        ];
        ecart = algo[i];
        if (ecart < 0) {
            ecart = ecart * -1;
        }
        int valueColumn1 = Random().nextInt(max - ecart);
        int valueColumn2 = valueColumn1 + ecart;
        if (isConstant) {
            // check si cette paire de valeur n'est pas déjà dans la liste
            while (list.any((element) => element[column1].value == valueColumn1)) {
                valueColumn1 = Random().nextInt(max - ecart);
                valueColumn2 = valueColumn1 + ecart;
            }
        }
        row[column1] = itemLogique(value: valueColumn1, mark: true);
        row[column2] = itemLogique(value: valueColumn2, mark: true);
        row[column3] = itemLogique(value: Random().nextInt(max), mark: false);
        list.add(row);
    }
    return list;
}