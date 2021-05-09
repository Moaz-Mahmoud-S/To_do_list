import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskList {

  static List<Widget> L1 = [
    Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          ListTile(

            leading: Icon(Icons.timer),
            title: Text("new task", style: TextStyle(color: Colors.black87),),
            subtitle: Text("new date", style: TextStyle(color: Colors.black87),),
          ),
          ElevatedButton(onPressed: (){},child: Text("Done ?",style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),)),
          Divider()
        ]))
  ];
}
