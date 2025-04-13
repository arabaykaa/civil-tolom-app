import 'package:first_flutter_app/pages/contacts.dart';
import 'package:first_flutter_app/pages/faq.dart';
import 'package:first_flutter_app/pages/home.dart';
import 'package:first_flutter_app/pages/request_page.dart';
import 'package:first_flutter_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBottomNavigationBar();
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBar();
}

class _CustomBottomNavigationBar extends State<CustomBottomNavigationBar> {
  int _navigationSelectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    RequestPage(),
    Home(),
    Contacts(),
    Faq()
  ];

  void _onItemTap(int index) {
    setState(() {
      _navigationSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TOLOM"),
      ),
      body: CustomContainer(
          child: _widgetOptions.elementAt(_navigationSelectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.car_crash_outlined, color: Colors.black87),
            label: "Search",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black87), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.error_outline, color: Colors.black87),
              label: "FAQ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts_outlined, color: Colors.black87),
              label: "Contacts"),
        ],
        currentIndex: _navigationSelectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTap,
      ),
    );
  }
}
