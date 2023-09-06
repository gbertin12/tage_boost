import 'dart:math';
import 'package:tage_boost/widgets/games/logique/utils/Checker.dart';
import 'package:tage_boost/data/data.dart';

List<List<itemLogique>> contentQuestionColonne(List<int> algo, bool isNumber) {
    List<List<itemLogique>>     list = [];
    int                         max = isNumber ? 9 : 26;
    int                         whatColonne = Random().nextInt(3);
    List<itemLogique> row = [
        itemLogique(value: Random().nextInt(max), mark : whatColonne == 0 ? true : false),
        itemLogique(value: Random().nextInt(max), mark : whatColonne == 1 ? true : false),
        itemLogique(value: Random().nextInt(max), mark : whatColonne == 2 ? true : false),
    ];
    if (isNumber) {
        // additionné toutes les valeurs de algo
        int somme = 0;
        for (int i = 0; i < 4; i++) {
            somme += algo[i];
        }
        if (somme == 12) {
            row[whatColonne].value = Random().nextInt(3);
        } else if (somme == -12) {
            row[whatColonne].value = max - Random().nextInt(3);
        } else if (somme == 10 || somme == -10) {
            row[whatColonne].value = Random().nextInt(2);
        } else if (somme < -9) {
            row[whatColonne].value = max - Random().nextInt(max - somme.abs());
        } else {
            row[whatColonne].value = Random().nextInt(max - somme.abs());
        }
    }

    int lettre = row[whatColonne].value;
    list.add(row);
    for (int i = 1; i < 5; i++)
    {
        lettre += algo[i - 1];
        row = [];
        for (int j = 0; j < 3; j++)
        {
            if (j == whatColonne) {
                row.add(itemLogique(value: checkLetterOrNumber(lettre, isNumber), mark: true));
            } else {
                row.add(itemLogique(value: Random().nextInt(max), mark: false));
            }
        }
        list.add(row);
    }
    return list;
}