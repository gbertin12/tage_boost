import 'package:flutter/material.dart';
import 'package:tage_boost/widgets/home/CustomTextButtonSubCategory.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:tage_boost/themes/data/data.dart';

class HorizontalScrollSubCategories extends StatelessWidget {
  HorizontalScrollSubCategories();


  @override
  Widget build(BuildContext context) {
    
    final categorieProvider = Provider.of<CategorieProvider>(context);
    final padding = MediaQuery.of(context).size.width * 0.05;

    return Padding (
            padding: EdgeInsets.only(bottom: padding),
            child: Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                    for (Category subCategorie in listSubCategories[categorieProvider.mainCategorie])
                        CustomTextButtonSubCategory(id: subCategorie.id, text: subCategorie.text),
                ],
            )
    );
    }
}