import 'package:first_flutter_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

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
