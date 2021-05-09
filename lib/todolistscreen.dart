
import 'package:final_project/TaskList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Addtaskscreen.dart';

class todolistscreen extends StatefulWidget {

  @override
  _todolistscreenState createState() => _todolistscreenState();
}

class _todolistscreenState extends State<todolistscreen> {





  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar
          (
          backgroundColor: Colors.blue[900],
          title: Padding(
            padding: const EdgeInsets.fromLTRB(70,0,0,0),
            child: Text("Welcome ",style: TextStyle(fontSize: 25,),),
          ),
        ),
        drawer: Drawer
          (
          child: Column
            (
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                color: Colors.black38,
                height: 170,
                width: double.infinity,
                child: Center
                  (
                  child: Image.network("https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png"),
                )
        ,),

                SizedBox(height: 30,),
                Row
                  (
                  crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.settings),
                    Text ("Setting   ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ],
                ),

              SizedBox(height: 20,),
              Row
                (
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.info_outline),
                  Text ("about   ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                ],
              ),

              SizedBox(height: 20,),
              Row
                (
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.share),
                  Text ("web   ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                ],
              ),

              SizedBox(height: 20,),
              Row
                (
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.star_rate_rounded),
                  Text ("favourite   ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[900],
          child: Icon(Icons.add),

          onPressed:()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Addtaskscreen()),);
          },
        ),
        body: ListView.builder(
            itemCount: TaskList.L1.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: missing_return
                    children: [
                      Text(
                        "My Tasks",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                    ],
                  ),
                );
              }
              return TaskList.L1[index];
            }),
      ),
    );
  }
}
