import 'package:flutter/material.dart';
import 'dart:math';

// import Global Theme
import 'package:tage_boost/themes/global.dart';
import 'package:tage_boost/data/data.dart';

// import Template Module
import 'package:tage_boost/widgets/games/logique/template/QuestionLogiqueWidget.dart';
import 'package:tage_boost/widgets/games/logique/template/MakeLogiquePossibilities.dart';
import 'package:tage_boost/widgets/CustomBottomNavigationBar.dart';


typedef CreateContentPossibleAnswers    =  List<String>                Function(List<itemLogique> row, int indexGoodAnswerInPossibilities, bool isNumber);
typedef CreateContentQuestion           =  List<List<itemLogique>>     Function(List<int> algo, bool isNumber);
typedef Algorythme                      =  List<int>                   Function();
typedef WidgetAnswer                    =  Widget                      Function(List<int> algo, double padding);

class TemplateLogiqueGame extends StatefulWidget {
    final CreateContentPossibleAnswers  createContentPossibleAnswers;
    final CreateContentQuestion         createContentQuestion;
    final Algorythme                    algo;
    final WidgetAnswer                  widgetAnswer;
    final bool                          isNumber;

    const TemplateLogiqueGame(
        {Key? key,
            required this.createContentPossibleAnswers,
            required this.createContentQuestion,
            required this.algo,
            required this.widgetAnswer,
            required this.isNumber
        }) : super(key: key
    );
  @override
  TemplateLogiqueGameState createState() => TemplateLogiqueGameState();
}

class TemplateLogiqueGameState extends State<TemplateLogiqueGame> {

    bool                        _reset = true;
    bool                        _show = true;
    int                         _hideRow = 0;
    int                         _indexGoodAnswerInPossibilities = 0;
    bool                        _vertical = false;

    Widget                      _question = Container();
    Widget                      _possibilities = Container();
    Widget                      _answer = Container();

    List<List<itemLogique>>     rows = [];
    List<int>                   algo = [];
    List<String>                _optionsAnswers = [];

    void _generateQuestion(double padding) {
      setState(() {
            _reset = false;
            _show = false;
            _vertical = !_vertical;
            // Which answer will be good in the _possibilities Widget
            _indexGoodAnswerInPossibilities = Random().nextInt(5);
            // Which row will be hide in the Question 
            _hideRow = Random().nextInt(5);
            // create algo for create the content of new Question
            algo = widget.algo();
            // create the content of new Question
            rows = widget.createContentQuestion(algo, widget.isNumber);
            // create widget of new Question
            _question = QuestionLogiqueWidget(rows : rows, indexHideRow: _hideRow, showSolution : _show, vertical : _vertical, isNumber: widget.isNumber);
            // create list of String for displaying Answers
            _optionsAnswers = widget.createContentPossibleAnswers(rows[_hideRow], _indexGoodAnswerInPossibilities, widget.isNumber);
            // create widget to display answers
            _possibilities = makePossibleAnswers(_optionsAnswers, _indexGoodAnswerInPossibilities, _show, padding / 1.5);
            _answer = Container();           
        });
    }

    void _displayAnswer(double padding) {
        setState(() {
            _reset = true;
            _show = true;
            _question = QuestionLogiqueWidget(rows : rows, indexHideRow: _hideRow, showSolution : _show, vertical : _vertical, isNumber: widget.isNumber);
            _possibilities = makePossibleAnswers(_optionsAnswers, _indexGoodAnswerInPossibilities, _show, padding / 1.5);       
            _answer = widget.widgetAnswer(algo, padding);     
        });
    }

    @override
    Widget build(BuildContext context) {
        double padding = MediaQuery.of(context).size.width * 0.05;
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
                    height: padding * 10,
                    child : _question,
                ),
                SizedBox(height: padding / 2),
                // display possibilty
                _possibilities,
                SizedBox(height: padding * 2),
                Container(child: _answer, height: padding * 2,),// show Response
                SizedBox(height: padding * 7),
                ElevatedButton(
                    onPressed: () {
                        if (_reset == false) { 
                            _displayAnswer(padding);
                        } else {
                            _generateQuestion(padding);
                        }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: padding, vertical: padding / 2),
                        primary: PrimaryColor,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(padding / 2),
                        ),
                    ),
                    child: Text(
                        _reset ? "Nouvelle Question" : "Voir la Réponse",
                        style : TextStyle(
                            fontSize: padding / 2,
                        )
                    )
                ),
            ],
        );
    }
}


class TemplateLogique extends StatelessWidget {
    final String                        title;
    final CreateContentPossibleAnswers  createContentPossibleAnswers;
    final CreateContentQuestion         createContentQuestion;
    final Algorythme                    algo;
    final WidgetAnswer                  widgetAnswer;
    final bool                          isNumber;

    const TemplateLogique({
        Key? key,
        required this.title,
        required this.createContentPossibleAnswers,
        required this.createContentQuestion,
        required this.algo,
        required this.widgetAnswer,
        required this.isNumber
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold
        (
            appBar: AppBar(
                title: Text(title),
                backgroundColor: PrimaryColor,
            ),
            body: Center(
                child: TemplateLogiqueGame(
                    createContentPossibleAnswers: createContentPossibleAnswers, 
                    createContentQuestion: createContentQuestion,
                    algo: algo,
                    widgetAnswer: widgetAnswer,
                    isNumber: isNumber,
                ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(),
        );
    }
}
