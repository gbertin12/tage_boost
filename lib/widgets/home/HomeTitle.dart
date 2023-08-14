import 'package:flutter/material.dart';


class HomeTitle extends StatelessWidget {
    final String contentText;
    
    const HomeTitle({required this.contentText});  

    @override
    Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.05;
      return Container(
            width: double.infinity, // Remplit la largeur de l'écran
            padding: EdgeInsets.symmetric(vertical: padding),
            decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                border : BorderDirectional(
                    bottom: BorderSide(color: Colors.black, width: 1),
                    top: BorderSide(color: Colors.black, width: 1),
                )
            ),
            child: Padding(
                //padding à gauche
                padding: EdgeInsets.only(left: padding),
                child : Text(contentText,
                    style: TextStyle(
                        fontSize: padding,
                        color: Color(0xFF000000),
                    ),
                ),
            ),
        );
    }
}

