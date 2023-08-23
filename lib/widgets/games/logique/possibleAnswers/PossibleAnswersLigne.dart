import 'package:tage_boost/data/data.dart';
import 'dart:math';
import 'package:tage_boost/widgets/games/logique/utils/checker.dart';

String _ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
String _NUMBERS = "0123456789";

List<String>    makeOptionAnswersLignes(List<itemLogique> row, int indexGoodAnswer, bool isNumber)
{
    int                 max = isNumber ? 9 : 26;
    List<String>        list = [];
    int                 column1 = 0;
    int                 column2 = 0;
    bool                notSet = true;
    // found value of all column
    for (int i = 0; i < 3; i++)
    {
        if (row[i].mark && notSet) {
            notSet = false;
            column1 = i;
        } else if (row[i].mark) {
            column2 = i;
        }
    }
    // found ecart between column1 and column2
    int ecart = row[column2].value - row[column1].value;

    // parcours ma liste d'itemLogique
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
        // sinon je génère des lettres aléatoires et je vérifie si ce n'est pas égale à la bonne réponse
        int valueColumn1 = Random().nextInt(max);
        int valueColumn2 = Random().nextInt(max);

        // si la lettre est égale à la bonne réponse alors je génère une autre lettre
        if ((valueColumn2 - valueColumn1) == ecart) {
            valueColumn1 = checkLetterOrNumber(valueColumn1 + Random().nextInt(ecart) + 1 , isNumber);
        }
        // add letter at good place
        notSet = true;
        for (int i = 0; i < 3; i++)
        {
            if (row[i].mark && notSet) {
                notSet = false;
                add += isNumber ? _NUMBERS[valueColumn1] : _ALPHABET[valueColumn1];
            } else if (row[i].mark) {
                add += isNumber ? _NUMBERS[valueColumn2] : _ALPHABET[valueColumn2];
            } else {
                add += isNumber ? _NUMBERS[Random().nextInt(max)] : _ALPHABET[Random().nextInt(max)];
            }
        }
        list.add(add);
    }
    return list;
}

