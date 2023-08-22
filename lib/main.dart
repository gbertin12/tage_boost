
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tage_boost/widgets/CustomBottomNavigationBar.dart';
import 'package:tage_boost/themes/global.dart';
import 'package:tage_boost/screens/HomeScreen.dart';
import 'package:tage_boost/provider/CategorieProvider.dart';
/// Flutter code sample for [Scaffold].
//

void main() {
    runApp(
        ChangeNotifierProvider(
            create: (context) => CategorieProvider(),
            child : const App(),
        )
    );
} 

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScaffoldApp(),
    );
  }
}

class ScaffoldApp extends StatefulWidget {
  const ScaffoldApp({super.key});

  @override
  State<ScaffoldApp> createState() => _ScaffoldAppState();
}

class _ScaffoldAppState extends State<ScaffoldApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: const Text('TAGE Boost'),
      ),

      body: Padding (
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.03),
            child : const BodyHome(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
