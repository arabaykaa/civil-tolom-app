import 'package:flutter/material.dart';
import 'package:tolom/widgets/bottom_navigation.dart';

void main() => runApp(const Tolom());

class Tolom extends StatelessWidget {
  const Tolom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: const CustomBottomNavigation(),
    );
  }
}
