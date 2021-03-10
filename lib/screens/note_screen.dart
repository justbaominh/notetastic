import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Screen'),
      ),
      body: Container(
        child: TextField(
          maxLines: null,
          expands: true,
        ),
      ),
    );
  }
}
