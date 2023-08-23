import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:tage_boost/widgets/home/ChooseCategories.dart';

class MakeBodyHome extends StatefulWidget {
  const MakeBodyHome({Key? key}) : super(key: key);
  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<MakeBodyHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategorieProvider>(
      builder: (context, categorieProvider, _) {
        return Container(
            child: ChooseCategories(),
        );
      },
    );
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MakeBodyHome(),
      ),
    );
  }
}

