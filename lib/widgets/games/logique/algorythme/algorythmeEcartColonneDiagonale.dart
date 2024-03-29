import 'dart:math';

List<int> algorythmeEcartColonneDiagonale(bool isNumber)
{
    int constant = Random().nextInt(2);
    int alternate = Random().nextInt(4) == 0 ? 1 : 0;
    int negative = Random().nextInt(2) == 0 ? 1 : -1;
    
    int nombrePremier = Random().nextInt(10) == 0 ? 1 : 0;

    if (nombrePremier == 1) {
        if (negative == 0) {
            return [-2, -3, -5, -7];
        }
        if (alternate == 0)
        {
            return [2, 3, 5, 7];
        } else {
            return [2, -3, 5, -7];
        }
    }

    List<int> algo = [];

    if (constant == 0)
    {
        alternate = Random().nextInt(10) == 0 ? 1 : 0;
        // constant
        int value = 0;
        if (isNumber) {
            value = Random().nextInt(3) + 1;
        } else {
            value = Random().nextInt(5) + 1;
        }
        if (alternate == 0)
        {
            // non alterné
            for (int i = 0; i < 4; i++) {
                algo.add(value * negative);
            }
        } else {
            // alterné
            for (int i = 0; i < 4; i++) {
                algo.add(value * negative);
                negative *= -1;
            }
        }
    } else {
        // non constant
        int value = (Random().nextInt(6) == 0 ? 0 : 1);
        int ecart = 0;
        if (isNumber) {
            ecart = 1;
        } else {
            ecart = 1 + (Random().nextInt(4) == 0 ? 1 : 0);
        }
        if (alternate == 0)
        {
            // non alterné
            for (int i = 0; i < 4; i++) {
                algo.add(value * negative);
                value += ecart;
            }
        } else {
            // alterné
            for (int i = 0; i < 4; i++) {
                algo.add(value * negative);
                negative *= -1;
                value += ecart;
            }
        }
    }
    return algo;
}