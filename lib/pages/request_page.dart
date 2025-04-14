import 'dart:convert'; // Для кодирования и декодирования JSON

import 'package:tolom/components/custom_button.dart';
import 'package:tolom/components/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPage();
}

class _RequestPage extends State<RequestPage> {
  String data = 'Loading...';
  String postedData = "Loading post method...";

  late TextEditingController _userInn;
  List finesArray = [];
  // late TextEditingController _userPlate;

  @override
  void initState() {
    _userInn = TextEditingController();
    super.initState();
    postData();
    // fetchData();
    finesArray.addAll([]);
  }

  @override
  void dispose() {
    _userInn.dispose(); // Освобождаем контроллер
    super.dispose();
  }

  void _function() {
    setState(() {
      finesArray.add(_userInn.text);
    });
  }

  // Future<void> fetchData() async {
  //   final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/11');

  //   try {
  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       final decodedData = jsonDecode(response.body);
  //       setState(() {
  //         data = decodedData['title'];
  //       });
  //     } else {
  //       setState(() {
  //         data = "Failed to fetch! ${response.statusCode}";
  //       });
  //     }
  //   } catch (error) {
  //     data = 'Error $error!';
  //   }
  // }

  Future<void> postData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: jsonEncode({
          "title": _userInn.text,
          "body": 'bar',
          "userId": 11,
        }),
      );

      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);
        setState(() {
          postedData = decode["title"];
        });
      } else {
        setState(() {
          postedData = "Failed";
        });
      }
    } catch (error) {
      postedData = "EERROR";
    }
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomInput(
              controller: _userInn,
              label: "Номер машины",
              valudator: (value) {
                if (value.isEmpty) return "Поле не должно быть пустым";
                if (value.length < 6) {
                  return "Номер машины должен превышать 6 символов";
                }
                if (value.length > 10) {
                  return "Номер машины не должен превышать 10 символов";
                }
                return null;
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CustomInput(
          //     controller: _userPlate,
          //   ),
          // ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                onPressed: () {
                  _function();
                  postData();
                },
                text: 'Найти',
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: finesArray.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(child: Text(finesArray[index].toString()));
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
