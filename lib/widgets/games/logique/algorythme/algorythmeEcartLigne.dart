import 'dart:math';

List<int> algorythmeEcartligne()
{
    int constant = Random().nextInt(2);
    // int alternate = Random().nextInt(6) == 0 ? 1 : 0;
    int alternate = 0;
    int negative = Random().nextInt(2) == 0 ? 1 : -1;
    negative = 1;

    List<int> algo = [];

    if (constant == 0)
    {
        // constant
        int value = Random().nextInt(5) + 1;
        if (alternate == 0)
        {
            // non alterné
            for (int i = 0; i < 5; i++) {
                algo.add(value * negative);
            }
        } else {
            // alterné
            for (int i = 0; i < 5; i++) {
                algo.add(value * negative);
                negative *= -1;
            }
        }
    } else {
        // non constant
        int value = 1;
        int ecart = value + (Random().nextInt(8) == 0 ? 1 : 0);
        if (ecart == 0) {
            ecart = 1;
        }
        if (alternate == 0)
        {
            // non alterné
            for (int i = 0; i < 5; i++) {
                algo.add(value * negative);
                value += ecart;
            }
        } else {
            // alterné
            for (int i = 0; i < 5; i++) {
                algo.add(value * negative);
                negative *= -1;
                value += ecart;
            }
        }
    }

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
    algo.add(column1);
    algo.add(column2);
    print("current algo : $algo");
    return algo;
}