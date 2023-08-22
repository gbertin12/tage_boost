import 'dart:math';
import 'package:tage_boost/data/data.dart'; 
import 'package:tage_boost/widgets/games/logique/utils/Checker.dart';

const int _SMALL = 0;
const int _MEDIUM = 1;
const int _LARGE = 2;

const int _RIGHT = 0;
const int _LEFT = 1;

List<List<itemLogique>> algoLargeDiagonale(int diagonaleDirection, int originalColonne, List<int> algo, bool isNumber)
{
    int max = isNumber ? 9 : 26;
    List<List<itemLogique>> list = [];
    int lastPositionDiagonale = originalColonne;
    bool letterFound = false;
    // création de la premiere ligne de lettre
    List<itemLogique> row = [
        itemLogique(value: Random().nextInt(max), mark : originalColonne == 0 ? true : false),
        itemLogique(value: Random().nextInt(max), mark : originalColonne == 1 ? true : false),
        itemLogique(value: Random().nextInt(max), mark : originalColonne == 2 ? true : false),
    ];
    // ajout à la liste
    list.add(row);

    for (int i = 1; i < 5; i++)
    {
        row = [];
        int num = 0;
        letterFound = false;
        for (int y = 0; y < 3; y++)
        {
            if (lastPositionDiagonale == 0 && y == 2 && letterFound == false)
			{
				num = checkLetterOrNumber(list[i - 1][0].value + algo[i - 1], isNumber);
                row.add(itemLogique(value: num, mark : true));
				lastPositionDiagonale = 2;
                letterFound = true;
			}
			else if (lastPositionDiagonale == 2 && y == 0 && letterFound == false)
			{
				num = checkLetterOrNumber(list[i - 1][2].value + algo[i - 1], isNumber);
                row.add(itemLogique(value: num, mark : true));
				lastPositionDiagonale = 0;
                letterFound = true;
			} else {
				num = Random().nextInt(max);
                row.add(itemLogique(value: num, mark : false));
            }
        }
        list.add(row);
    }
    return list;
}

List<List<itemLogique>> algoMediumDiagonale(int diagonaleDirection, int originalColonne, List<int> algo, bool isNumber)
{
    int max = isNumber ? 9 : 26;
    List<List<itemLogique>> list = [];
    int lastPositionDiagonale = originalColonne;
    bool letterFound = false;

    // création de la premiere ligne de lettre
    List<itemLogique> row = [
        itemLogique(value: Random().nextInt(max), mark : originalColonne == 0 ? true : false),
        itemLogique(value: Random().nextInt(max), mark : originalColonne == 1 ? true : false),
        itemLogique(value: Random().nextInt(max), mark : originalColonne == 2 ? true : false),
    ];
    // ajout à la liste
    list.add(row);

    for (int i = 1; i < 5; i++)
    {
        row = [];
        int num = 0;
        letterFound = false;
        for (int y = 0; y < 3; y++)
        {
            if ((diagonaleDirection == _LEFT && 
				((lastPositionDiagonale == 2 && y == 1) || 
                (lastPositionDiagonale == 1 && y == 0))) && 
                letterFound == false)
			{
				num = checkLetterOrNumber(list[i - 1][lastPositionDiagonale].value + algo[i - 1], isNumber);
                row.add(itemLogique(value: num, mark: true));
				lastPositionDiagonale = y;
                letterFound = true;
				if (y == 0) {
					diagonaleDirection = _RIGHT;
                }
			} else if (diagonaleDirection == _RIGHT && 
				((lastPositionDiagonale == 0 && y == 1) || 
                (lastPositionDiagonale == 1 && y == 2)) &&
                letterFound == false)
			{
				num = checkLetterOrNumber(list[i - 1][lastPositionDiagonale].value + algo[i - 1], isNumber);
                row.add(itemLogique(value: num, mark: true));
				lastPositionDiagonale = y;
                letterFound = true;
				if (y == 2) {
					diagonaleDirection = _LEFT;
                }
			} else {
				num = Random().nextInt(max);
                row.add(itemLogique(value: num, mark: false));
			}
        }
        list.add(row);
    }
    return list;
}

List<List<itemLogique>> algoSmallDiagonale(int diagonaleDirection, int originalColonne, List<int> algo, bool isNumber)
{
    int max = isNumber ? 9 : 26;
    List<List<itemLogique>> list = [];
    // création de la premiere ligne de lettre
    List<itemLogique> row = [
        itemLogique(value: Random().nextInt(max), mark : originalColonne == 0 ? true : false),
        itemLogique(value: Random().nextInt(max), mark : originalColonne == 1 ? true : false),
        itemLogique(value: Random().nextInt(max), mark : originalColonne == 2 ? true : false),
    ];
    bool letterFound = false;
    // ajout à la liste
    list.add(row);
    for (int i = 1; i < 5; i++)
    {
        row = [];
        int num = 0;
        for (int y = 0; y < 3; y++)
        {
            if (diagonaleDirection == _LEFT)
			{
                // si i est impair (donc la 1, 3 et 5eme colonne)
                // cela veut dire que la lettre à modifier sera sur la meme colonne que la lettre d'origine
				if (i % 2 == 1)
				{
					if (y == originalColonne - 1) {
                        // on récupère la valeur de la lettre d'origine et on lui ajoute l'algo
						num = checkLetterOrNumber(list[i - 1][originalColonne].value + algo[i - 1], isNumber);
                        letterFound = true;
                        row.add(itemLogique(value: num, mark: true));
                    } else {
						num = Random().nextInt(max);
                        row.add(itemLogique(value: num, mark: false));
                    }
				} else {
					if (y == originalColonne) {
                        num = checkLetterOrNumber(list[i - 1][originalColonne - 1].value + algo[i - 1], isNumber);
                        letterFound = true;
                        row.add(itemLogique(value: num, mark: true));
                    } else {
						num = Random().nextInt(max);
                        row.add(itemLogique(value: num, mark: false));
                    }
				}
			} else if (diagonaleDirection == _RIGHT) {
				if (i % 2 == 1)
				{
					if (y == originalColonne + 1) {
						num = checkLetterOrNumber(list[i - 1][originalColonne].value + algo[i - 1], isNumber);
                        letterFound = true;
                        row.add(itemLogique(value: num, mark: true));
                    } else {
						num = Random().nextInt(max);
                        row.add(itemLogique(value: num, mark: false));
                    }
				} else {
					if (y == originalColonne) {
						num = checkLetterOrNumber(list[i - 1][originalColonne + 1].value + algo[i - 1], isNumber);
                        letterFound = true;
                        row.add(itemLogique(value: num, mark: true));
                    } else {
						num = Random().nextInt(max);
                        row.add(itemLogique(value: num, mark: false));
                    }
				}
			}
        }
        list.add(row);
    }
    return list;
}
