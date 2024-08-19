import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _userToDo;
  List todoCount = [];

  @override
  void initState() {
    super.initState();
    todoCount.addAll(['HELLO', 'NIGGA', 'WWO']);
  }

  // void _menuOpen() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (BuildContext context) {
  //     return Scaffold(
  //       backgroundColor: Colors.blue[300],
  //       appBar: AppBar(
  //         title: const Text('menu'),
  //       ),
  //       body: const Text('open'),
  //     );
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green[800],
      //   title: const Text(
      //     'To-Do list',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //         icon: const Icon(Icons.menu_open_rounded), onPressed: _menuOpen)
      //   ],
      // ),
      body: ListView.builder(
          itemCount: todoCount.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoCount[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoCount[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[800],
                    ),
                    onPressed: () {
                      setState(() {
                        todoCount.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direcrion) {
                setState(() {
                  todoCount.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[800],
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add text'),
                  content: TextField(
                    onChanged: (String value) {
                      _userToDo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todoCount.add(_userToDo);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('add'))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add_task_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
