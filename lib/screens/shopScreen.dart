import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TAGE Boost'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('return HomePage'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
