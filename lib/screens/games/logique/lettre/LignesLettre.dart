// import 'package:flutter/material.dart';
// import 'package:tage_boost/themes/global.dart';
// import 'package:tage_boost/widgets/CustomBottomNavigationBar.dart';
// import 'package:tage_boost/widgets/games/logique/algorythme/algorythmeEcart.dart';
// import 'package:tage_boost/widgets/games/logique/template/QuestionLogiqueWidget.dart';
// import 'package:tage_boost/data/data.dart';
// import 'dart:math';
// import 'package:tage_boost/widgets/games/logique/utils/Checker.dart';
// import 'package:tage_boost/widgets/games/logique/template/MakeLogiquePossibilities.dart';
// import 'package:tage_boost/widgets/games/logique/possibleAnswers/PossibleAnswersDiagonalesColonnes.dart';

// const String _ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

// List<List<itemLogique>> makeListColonne(List<int> algo, int whatColonne) {
//     List<List<itemLogique>> list = [];
//     //int maxSum = 

//     List<itemLogique> row = [
//         itemLogique(value: Random().nextInt(26), mark : whatColonne == 0 ? true : false),
//         itemLogique(value: Random().nextInt(26), mark : whatColonne == 1 ? true : false),
//         itemLogique(value: Random().nextInt(26), mark : whatColonne == 2 ? true : false),
//     ];

//     list.add(row);

//     for (int i = 1; i < 5; i++)
//     {
//         for (int j = 0; j < 3; j++)
//         {
            
//         }
//         list.add(row);
//     }
//     return list;
// }

// class LignesLettreGame extends StatefulWidget {
//   const LignesLettreGame({Key? key});
//   @override
//   _LignesLettreGameState createState() => _LignesLettreGameState();
// }

// class _LignesLettreGameState extends State<LignesLettreGame> {

//     bool                        _reset = true;
//     bool                        _show = true;
//     int                         _hideRow = 0;
//     int                         _indexGoodAnswerInPossibilities = 0;
//     bool                        _vertical = false;

//     Widget                      _question = Container();
//     Widget                      _possibilities = Container();
//     Widget                      _answer = Container();

//     List<List<itemLogique>>     rows = [];
//     List<int>                   algo = [];
//     List<String>                _optionsAnswers = [];

//     void _generateQuestion(double padding) {
//       setState(() {
//             _reset = false;
//             _show = false;
//             _vertical = !_vertical;
//             // Which answer will be good in the _possibilities Widget
//             _indexGoodAnswerInPossibilities = Random().nextInt(5);
//             // Which row will be hide in the Question 
//             _hideRow = Random().nextInt(5);
//             // create algo for create the content of new Question
//             algo = makeAlgorythmeLettre();
//             // create the content of new Question
//             rows = makeListColonne(algo, Random().nextInt(3));
//             // create widget of new Question
//             _question = QuestionLogiqueWidget(rows : rows, indexHideRow: _hideRow, showSolution : _show, vertical : _vertical);
//             // create list of String for displaying Answers
//             _optionsAnswers = makeOptionAnswersDiagonalesAndColonnes(rows[_hideRow], _indexGoodAnswerInPossibilities);
//             // create widget to display answers
//             _possibilities = makeLogiquePossibilities(_optionsAnswers, _indexGoodAnswerInPossibilities, _show, padding / 1.5);
//             _answer = Container();           
//         });
//     }

//     void _displayAnswer(double padding) {
//         setState(() {
//             _reset = true;
//             _show = true;
//             _question = QuestionLogiqueWidget(rows : rows, indexHideRow: _hideRow, showSolution : _show, vertical : _vertical);
//             _possibilities = makeLogiquePossibilities(_optionsAnswers, _indexGoodAnswerInPossibilities, _show, padding / 1.5);       
//             _answer = makeAnswer(algo, padding);     
//         });
//     }

//     @override
//     Widget build(BuildContext context) {
//         double padding = MediaQuery.of(context).size.width * 0.05;
//         return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//                 Container(
//                     height: padding * 10,
//                     child : _question,
//                 ),
//                 SizedBox(height: padding),
//                 // display possibilty
//                 _possibilities,
//                 SizedBox(height: padding),
//                 ElevatedButton(
//                     onPressed: () {
//                         if (_reset == false) { 
//                             _displayAnswer(padding);
//                         } else {
//                             _generateQuestion(padding);
//                         }
//                     },
//                     style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: padding, vertical: padding / 2),
//                         primary: PrimaryColor,
//                         shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(padding / 2),
//                         ),
//                     ),
//                     child: Text(
//                         _reset ? "Nouvelle Question" : "Voir la Réponse",
//                         style : TextStyle(
//                             fontSize: padding / 2,
//                         )
//                     )
//                 ),
//                 SizedBox(height: padding),
//                 Container(child: _answer, height: padding * 2,)// show Response
//             ],
//         );
//     }
// }

// class LignesLettre extends StatelessWidget {

//     const LignesLettre(
//         {Key? key})
//         : super(key: key);
//     @override
//     Widget build(BuildContext context) {
//         return Scaffold
//         (
//             appBar: AppBar(
//                 title: const Text("Les Lignes"),
//                 backgroundColor: PrimaryColor,
//             ),
//             body: const Center(
//                 child: LignesLettreGame(),
//             ),
//             bottomNavigationBar: CustomBottomNavigationBar(),
//         );
//     }
// }
