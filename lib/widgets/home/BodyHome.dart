import 'package:flutter/material.dart';
import 'package:tage_boost/widgets/home/ChooseCategories.dart';
import 'package:tage_boost/widgets/home/HomeTitle.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:tage_boost/themes/global.dart';
import 'package:tage_boost/widgets/home/HorizontalScrollCalculCategories.dart';
import 'package:tage_boost/widgets/home/HorizontalScrollLogiqueCategories.dart';
import 'package:tage_boost/widgets/home/HorizontalScrollExpressionCategories.dart';

class MakeBodyHome extends StatefulWidget {
  const MakeBodyHome({Key? key}) : super(key: key);
  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<MakeBodyHome> {

  @override
  Widget build(BuildContext context) {
    final categorieProvider = Provider.of<CategorieProvider>(context);
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
                ChooseCategories(),
                if (categorieProvider.mainCategorie == calculIndex)
                    HorizontalScrollCalculCategories(),
                if (categorieProvider.mainCategorie == logiqueIndex)
                    HorizontalScrollLogiqueCategories(),
                if (categorieProvider.mainCategorie == expressionIndex)
                    HorizontalScrollExpressionCategories(),
                const HomeTitle(contentText: "Exercices"),
                const HomeTitle(contentText: "Théorie"),
            ]);
    }
}

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MakeBodyHome(),
      ),
    );
  }
}

