import 'package:flutter/material.dart';

// import '../models/note.dart';

class NoteGrid extends StatefulWidget {
  final List<Map<String, String>> noteData;

  NoteGrid(this.noteData);

  @override
  _NoteGridState createState() => _NoteGridState();
}

class _NoteGridState extends State<NoteGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: widget.noteData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/test");
          },
          child: Card(
            elevation: 6,
            color: Colors.amber,
            child: Column(
              children: [
                Text(widget.noteData[index]["title"]),
                Text(widget.noteData[index]["content"]),
              ],
            ),
          ),
        );
      },
    );
  }
}
