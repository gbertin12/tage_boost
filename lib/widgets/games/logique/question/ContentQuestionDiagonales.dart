import 'dart:math';

// import Algorythme for Diagonales
import 'package:tage_boost/widgets/games/logique/algorythme/algoDiagonales.dart';

// import data
import 'package:tage_boost/data/data.dart';

const int _SMALL = 0;
const int _MEDIUM = 1;
const int _LARGE = 2;

const int _RIGHT = 0;
const int _LEFT = 1;

List<List<itemLogique>> contentQuestionAllDiagonales(List<int> algo, bool isNumber) {
    int typeDiagonale = _LARGE;
    int originalColonne = 0;
    int diagonaleDirection = 0;
    // Choisir le type de diagonale
    int random = Random().nextInt(100);
	if (random < 20) {
		typeDiagonale = _MEDIUM;
    } else if (random < 60) {
		typeDiagonale = _SMALL;
    }
    // Choisir la colonne de départ
	if (typeDiagonale == _LARGE)
	{
		originalColonne = Random().nextInt(2);
		if (originalColonne == 1) {
            originalColonne = 2;
        }
	} else {
		originalColonne = Random().nextInt(3);
	}
    // Choisir la direction de la diagonale
	if (originalColonne == 0) {
		diagonaleDirection = _RIGHT;
    } else if (originalColonne == 2) {
		diagonaleDirection = _LEFT;
    } else {
		diagonaleDirection = Random().nextInt(2) == 0 ? _LEFT : _RIGHT;
    }
    
    // choisir le bon algo
    if (typeDiagonale == _SMALL) {
        return algoSmallDiagonale(diagonaleDirection, originalColonne, algo, isNumber);
    } else if (typeDiagonale == _MEDIUM) {
        return algoMediumDiagonale(diagonaleDirection, originalColonne, algo, isNumber);
    } else {
        return algoLargeDiagonale(diagonaleDirection, originalColonne, algo, isNumber);
    }
}


List<List<itemLogique>> contentQuestionLargeDiagonale(List<int> algo, bool isNumber) {
    int originalColonne = 0;
    int diagonaleDirection = 0;
    // Choisir la colonne de départ

	originalColonne = Random().nextInt(2);
	if (originalColonne == 1) {
        originalColonne = 2;
    }

    // Choisir la direction de la diagonale
	if (originalColonne == 0) {
		diagonaleDirection = _RIGHT;
    } else if (originalColonne == 2) {
		diagonaleDirection = _LEFT;
    }
    return algoLargeDiagonale(diagonaleDirection, originalColonne, algo, isNumber);
}


List<List<itemLogique>> contentQuestionSmallDiagonale(List<int> algo, bool isNumber) {
    int diagonaleDirection = 0;
	int originalColonne = Random().nextInt(3);
    // Choisir la direction de la diagonale
	if (originalColonne == 0) {
		diagonaleDirection = _RIGHT;
    } else if (originalColonne == 2) {
		diagonaleDirection = _LEFT;
    } else {
		diagonaleDirection = Random().nextInt(2) == 0 ? _LEFT : _RIGHT;
    }
    return algoSmallDiagonale(diagonaleDirection, originalColonne, algo, isNumber);
}

List<List<itemLogique>> contentQuestionMediumDiagonale(List<int> algo, bool isNumber) {
    int diagonaleDirection = 0;
	int originalColonne = Random().nextInt(3);
    // Choisir la direction de la diagonale
	if (originalColonne == 0) {
		diagonaleDirection = _RIGHT;
    } else if (originalColonne == 2) {
		diagonaleDirection = _LEFT;
    } else {
		diagonaleDirection = Random().nextInt(2) == 0 ? _LEFT : _RIGHT;
    }
    return algoMediumDiagonale(diagonaleDirection, originalColonne, algo, isNumber);
}