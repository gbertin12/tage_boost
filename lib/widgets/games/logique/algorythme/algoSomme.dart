import 'dart:math';

const int _CONSTANT = 0;
const int _PROGRESSIF = 1;
const int _REGRESSIF = 2;
const int _IDENTIQUE = 3;

// Si allColumn est à true, alors on prendra les colonnes 0, 1 et 2
// Sinon on prendra les colonnes 0 et 1 ou 1 et 2 ou 0 et 2
List<int> chooseColumn(bool allColumn)
{
    if (allColumn == true) {
        return [0, 1, 2];
    }
    List<int> column = [0, 0];
    int column1 = Random().nextInt(3);
    int column2 = Random().nextInt(3);
    if (column1 == column2) {
        column2 = (column2 + 1) % 3;
    }
    if (column1 > column2){
        int tmp = column1;
        column1 = column2;
        column2 = tmp;
    }
    column[0] = column1;
    column[1] = column2;
    return column;
}

List<int>   algoIdentique(bool allColumn, List<int> column) {
    List<int> algo = [0, 0, 0, 0, 0];
    for (int i = 0; i < column.length; i++) {
        algo.add(column[i]);
    }
    return algo;
}

List<int>  algoConstant(bool allColumn, List<int> column, int negatif) {
    List<int> algo = [];
    int value = Random().nextInt(5) + 1;
    for (int i = 0; i < 5; i++) {
        algo.add(value * negatif);
    }
    for (int i = 0; i < column.length; i++) {
        algo.add(column[i]);
    }
    return algo;
}

// si _DEGRESSIF alors on reverse la liste
List<int>  algoProgressifRegressif(bool allColumn, List<int> column, int negatif, int algoType) {
    List<int> algo = [];
    int value = 1;
    int ecart = value + (Random().nextInt(8) == 0 ? 1 : 0);
    
    for (int i = 0; i < 5; i++) {
        algo.add(value * negatif);
        value += ecart;
    }
    if (algoType == _REGRESSIF) {
        algo = algo.reversed.toList();
    }
    for (int i = 0; i < column.length; i++) {
        algo.add(column[i]);
    }
    return algo;
}

// renvoi une List<int> de 5 int + 2 ou 3 int pour les colonnes
List<int> algoSomme()
{
    int algoType = Random().nextInt(4);
    bool allColumn = Random().nextInt(3) == 0 ? false : true;
    int negatif = Random().nextInt(2) == 0 ? 1 : -1;
    List<int> column = chooseColumn(allColumn);

    // use case _IDENTIQUE
    if (algoType == _IDENTIQUE) {
        return algoIdentique(allColumn, column);
    }
    // use case _CONSTANT
    if (algoType == _CONSTANT) {
        return algoConstant(allColumn, column, negatif);
    }
    // use case _PROGRESSIF or _REGRESSIF
    return algoProgressifRegressif(allColumn, column, negatif, algoType);
}