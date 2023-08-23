import 'package:flutter/material.dart';
import 'package:tage_boost/themes/global.dart';

// import provider
import 'package:tage_boost/provider/CategorieProvider.dart';
import 'package:provider/provider.dart';

// scrollbar
import 'package:tage_boost/widgets/home/HorizontalScrollSubCategories.dart';
import 'package:tage_boost/widgets/home/HorizontalScrollExercices.dart';

// import title widget
import 'package:tage_boost/widgets/home/HomeTitle.dart';

// import widget template
import 'package:tage_boost/widgets/CustomBottomNavigationBar.dart';

class MakeGames extends StatefulWidget {
  const MakeGames({Key? key}) : super(key: key);
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<MakeGames> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategorieProvider>(
      builder: (context, categorieProvider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalScrollSubCategories(),
            const HomeTitle(contentText: "Exercices"),
            HorizontalScrollExercices(),
            const HomeTitle(contentText: "Théorie (à venir)"),
          ],
        );
      },
    );
  }
}


class Games extends StatelessWidget {

    final String title;

    const Games({
        required this.title,
        Key? key
    }) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: PrimaryColor,
                title: Text(title),
            ),
            body: const Center(
                child: MakeGames(),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(),
        );
    }
}

