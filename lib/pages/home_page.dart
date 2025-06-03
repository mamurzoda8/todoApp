import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todos = ["IThill", "JNR"];
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Todo+",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:
                todos.map((todoApp) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          todoApp,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              todos.remove(todoApp);
                            });
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: TextField(controller: textEditingController),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text("Cancel", style: TextStyle(color: Colors.blue)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todos.add(textEditingController.text);
                      });
                      Navigator.pop(context);
                      textEditingController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
