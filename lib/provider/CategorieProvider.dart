import 'package:flutter/material.dart';

class CategorieProvider with ChangeNotifier {
    int _mainCategorie = 0;
    int _subCategorie = 0;

    int get mainCategorie => _mainCategorie;
    int get subCategorie => _subCategorie;

    void setMainCategorie(int value) {
        _mainCategorie = value;
        notifyListeners();
    }
    
    void setSubCategorie(int value) {
        _subCategorie = value;
        notifyListeners();
    }
}