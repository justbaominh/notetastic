import 'package:flutter/material.dart';

import '../widgets/note_grid.dart';

class HomeScreen extends StatelessWidget {
  static const List<Map<String, String>> noteData = [
    {
      "title": "test1",
      "content": "Minh ngu nhu bo y",
    },
    {
      "title": "test2",
      "content": "Choi LOL ngu vl",
    },
    {
      "title": "test2",
      "content": "Choi LOL ngu vl",
    },
    {
      "title": "test2",
      "content": "Choi LOL ngu vl",
    },
    {
      "title": "test2",
      "content": "Choi LOL ngu vl",
    },
    {
      "title": "test2",
      "content": "Choi LOL ngu vl",
    },
    {
      "title": "test2",
      "content": "Choi LOL ngu vl",
    },
    {
      "title": "test2",
      "content": "Choi LOL ngu vl",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoteGrid(noteData),
      // floatingActionButton: FloatingActionButton(

      //   onPressed: null,
      //   child: Icon(Icons.add),
      //   // backgroundColor: Theme.of(context).
      //   backgroundColor: Color(0xFFFF6666),
      // )
      floatingActionButton: Container(
        width: 75.0,
        height: 75.0,
        margin: EdgeInsets.only(bottom: 10),
        child: RawMaterialButton(
          fillColor: Color(0xFFFF6666),
          shape: CircleBorder(),
          elevation: 0.0,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
