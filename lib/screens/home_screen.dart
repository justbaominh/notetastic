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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoteGrid(noteData),
    );
  }
}
