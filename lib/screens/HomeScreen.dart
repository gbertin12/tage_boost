import 'package:flutter/material.dart';
import 'package:tage_boost/widgets/home/ChooseCategories.dart';
import 'package:tage_boost/widgets/home/HomeTitle.dart';
import 'package:tage_boost/widgets/home/HorizontalScrollSubCategories.dart';
import 'package:tage_boost/widgets/home/HorizontalScrollExercices.dart';

class MakeBodyHome extends StatefulWidget {
  const MakeBodyHome({Key? key}) : super(key: key);
  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<MakeBodyHome> {

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
                ChooseCategories(),
                HorizontalScrollSubCategories(),
                const HomeTitle(contentText: "Exercices"),
                HorizontalScrollExercices(),
                const HomeTitle(contentText: "Théorie"),
            ]);
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

