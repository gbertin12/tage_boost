import 'package:flutter/material.dart';

Container makePossibleAnswers(List<String> options, int indexGoodAnswer, bool show, double sizeFont) {
    String letterIndex = "ABCDE";
    int length = options.length;
    return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < length; i++)
          Text(letterIndex[i] + ") " + options[i] + "    ",
            style: TextStyle(
              fontWeight: i == indexGoodAnswer && show ? FontWeight.bold : FontWeight.normal,
              color: i == indexGoodAnswer && show ? Colors.green : Colors.black,
              fontSize: sizeFont,
            ),
          ),
      ],
    ),
  );
}