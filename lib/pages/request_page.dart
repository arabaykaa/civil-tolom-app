import 'dart:convert'; // Для кодирования и декодирования JSON

import 'package:first_flutter_app/components/custom_input.dart';
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
    fetchData();
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

  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/11');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        setState(() {
          data = decodedData['title'];
        });
      } else {
        setState(() {
          data = "Failed to fetch! ${response.statusCode}";
        });
      }
    } catch (error) {
      data = 'Error $error!';
    }
  }

  Future<void> postData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: jsonEncode({
          "title": 'foo',
          "body": 'bar',
          "userId": 11,
        }),
      );

      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);
        setState(() {
          postedData = decode[""];
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
            child: TextButton(
              onPressed: () {
                _function();
              },
              child: const Text('TextButton #4'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300, // Указываем конкретную высоту для ListView
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
