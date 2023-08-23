import 'package:tage_boost/data/data.dart';
import 'dart:math';
import 'package:tage_boost/widgets/games/logique/utils/checker.dart';

String _ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
String _NUMBERS = "0123456789";

List<String>    makeOptionAnswersDiagonalesAndColonnes(List<itemLogique> row, int indexGoodAnswer, bool isNumber)
{
    int                 max = isNumber ? 9 : 26;
    List<String>        list = [];

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
        for (int y = 0; y < 3; y++)
        {
            int newLetter = Random().nextInt(max);
            if (row[y].mark)
            {
                // si la lettre est égale à la bonne réponse alors je génère une autre lettre
                if (newLetter == row[y].value) {
                    newLetter = checkLetterOrNumber(newLetter + Random().nextInt(5), isNumber);
                }
            }
            add += isNumber ? _NUMBERS[newLetter] : _ALPHABET[newLetter];
        }
        list.add(add);
    }
    return list;
}

