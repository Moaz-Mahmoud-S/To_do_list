import 'package:final_project/todolistscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'TaskList.dart';

class Addtaskscreen extends StatefulWidget {
  @override
  _AddtaskscreenState createState() => _AddtaskscreenState();
}

class _AddtaskscreenState extends State<Addtaskscreen> {
  final c1 = TextEditingController();
  final c2 = TextEditingController();
bool state=true;

  Widget _buildTask(String a, String b) {
    Text t1=new Text(s1,style:TextStyle(color: Colors.black87, fontSize: 25));
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          ListTile(
            leading: Icon(Icons.timer),
            trailing: Icon(Icons.done_outline),
            title:
             Text(
              s1,
              style:state ?
              TextStyle(color: Colors.black87, fontSize: 25)
                  :TextStyle(
                color: Colors.black87,
                fontSize: 25,
                decoration: TextDecoration.underline,
              ),
            ),
            subtitle: Text(
              s2,
              style:TextStyle(color: Colors.black87, fontSize: 20),
            ),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              icon: Icon(
                Icons.done,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  state=!state;
                }
                );
              },
              label: Text(
                "Done ?",
                style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
              )),
          Divider()
        ]));
  }

  String s1 = "", s2 = "";

  TextEditingController task_controller;
  TextEditingController description_controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDoList",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: c1,
                  decoration: InputDecoration(
                      labelText: 'Task',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter task name'),
                ),
                SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: c2,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1940),
                            lastDate: DateTime(3000)
                    )
                        .then((date) async {
                      c2.text = new DateFormat("yyyy-MM-dd").format(date);
                      print(date.toString());
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      labelText: 'Task due date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter task date'),
                ),
                SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blue[900],
                      elevation: 15,
                      shape: CircleBorder(),
                      primary: Colors.blue[900],
                    ),
                    child: Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Text(
                        'ADD TASK',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => todolistscreen()),
                      );
                      s1 = c1.text;
                      s2 = c2.text;
                      if (!s1.isEmpty && !s2.isEmpty) {
                        Widget w1 = _buildTask(s1, s2);
                        setState(() {
                          TaskList.L1.add(w1);
                          print(TaskList.L1.length);
                        });
                      } else {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Warning"),
                            content: Text("you entered an empty values"),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("okay"),
                              ),
                            ],
                          ),
                        );
                      }
                      ;
                    }),
                SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.redAccent,
                      elevation: 15,
                      shape: CircleBorder(),
                      primary: Colors.redAccent,
                    ),
                    child: Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => todolistscreen()),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
