import 'package:flutter/material.dart';
import 'package:tage_boost/screens/shopScreen.dart';
import 'package:tage_boost/screens/settingsScreen.dart';
import 'package:tage_boost/main.dart';
import 'package:tage_boost/themes/global.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.shop),
                color: PrimaryColor,
                onPressed: () {
                  Navigator.push(
                		context,
                    	MaterialPageRoute(builder: (context) => const ShopScreen()),
                	);
                },
              ),
              FloatingActionButton(
				child: const Icon(Icons.home),
                backgroundColor: PrimaryColor,
                onPressed: () => {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const App()),
                    ),
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                color: PrimaryColor,
                onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsScreen()),
                    ),
                },
              ),
            ],
        ),
        );
    }
}
