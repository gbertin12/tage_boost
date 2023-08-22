import 'package:flutter/material.dart';
import 'package:tage_boost/data/data.dart';

const String _ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const String _NUMBERS = "0123456789";

TextSpan customTextSpan(itemLogique item, bool showSolution, bool hide, double size, bool isNumber)
{
    return TextSpan(
        text: (hide && !showSolution) ? "?" : isNumber ?  _NUMBERS[item.value] : _ALPHABET[item.value], 
        style : TextStyle(
            fontWeight: (item.mark && showSolution) ? FontWeight.bold  : FontWeight.normal,
            fontSize: size,
            color: (item.mark && showSolution) ? Colors.green : Colors.black,
            ),
    );
}

Text makeHorizontalRow(List<List<itemLogique>> letters, bool showSolution, int indexHideRow, double sizeFont, bool isNumber)
{
    return Text.rich (
            TextSpan(
                children: [
                    customTextSpan(letters[0][0], showSolution, (indexHideRow == 0) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[0][1], showSolution, (indexHideRow == 0) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[0][2], showSolution, (indexHideRow == 0) ? true : false, sizeFont, isNumber),
                    TextSpan(text : "  ", style : TextStyle(fontSize: sizeFont)),
                    customTextSpan(letters[1][0], showSolution, (indexHideRow == 1) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[1][1], showSolution, (indexHideRow == 1) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[1][2], showSolution, (indexHideRow == 1) ? true : false, sizeFont, isNumber),
                    TextSpan(text : "  ", style : TextStyle(fontSize: sizeFont)),
                    customTextSpan(letters[2][0], showSolution, (indexHideRow == 2) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[2][1], showSolution, (indexHideRow == 2) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[2][2], showSolution, (indexHideRow == 2) ? true : false, sizeFont, isNumber),
                    TextSpan(text : "  ", style : TextStyle(fontSize: sizeFont)),
                    customTextSpan(letters[3][0], showSolution, (indexHideRow == 3) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[3][1], showSolution, (indexHideRow == 3) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[3][2], showSolution, (indexHideRow == 3) ? true : false, sizeFont, isNumber),
                    TextSpan(text : "  ", style : TextStyle(fontSize: sizeFont)),
                    customTextSpan(letters[4][0], showSolution, (indexHideRow == 4) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[4][1], showSolution, (indexHideRow == 4) ? true : false, sizeFont, isNumber),
                    customTextSpan(letters[4][2], showSolution, (indexHideRow == 4) ? true : false, sizeFont, isNumber),
                ],
            ),
    );
}

Text itemVertical(List<itemLogique> item, bool showSolution, int index,  int indexHideRow, double sizeFont, bool isNumber)
{
    return Text.rich(
        TextSpan(
            children: [
                customTextSpan(item[0], showSolution, (index == indexHideRow) ? true : false, sizeFont, isNumber),
                customTextSpan(item[1], showSolution, (index == indexHideRow) ? true : false, sizeFont, isNumber),
                customTextSpan(item[2], showSolution, (index == indexHideRow) ? true : false, sizeFont, isNumber)
            ]
        )
    );
}
                       
class QuestionLogiqueWidget extends StatelessWidget {
    final List<List<itemLogique>>   rows;
    final int                       indexHideRow;
    final bool                      vertical;
    final bool                      showSolution;
    final bool                      isNumber;

    QuestionLogiqueWidget(
        {
            required this.rows,
            required this.indexHideRow,
            required this.vertical,
            required this.showSolution, 
            required this.isNumber
        }
    );

    @override
    Widget build(BuildContext context) {
        double padding = MediaQuery.of(context).size.width / 20;

        return Container(
            child : vertical 
            ? Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children : [makeHorizontalRow(rows, showSolution, indexHideRow, padding, isNumber)]
            ) 
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children : [
                    itemVertical(rows[0], showSolution, 0, indexHideRow, padding, isNumber),
                    itemVertical(rows[1], showSolution, 1, indexHideRow, padding, isNumber),
                    itemVertical(rows[2], showSolution, 2, indexHideRow, padding, isNumber),
                    itemVertical(rows[3], showSolution, 3, indexHideRow, padding, isNumber),
                    itemVertical(rows[4], showSolution, 4, indexHideRow, padding, isNumber),
                ],       
            )
        );
    }
}