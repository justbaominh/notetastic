import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteGrid extends StatelessWidget {
  final List<Note> noteData;
  final Function(String id) deleteNote;

  NoteGrid({this.noteData, this.deleteNote});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: noteData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/test");
          },
          onDoubleTap: () {
						deleteNote(noteData[index].id);
					},
          child: Card(
            elevation: 6,
            color: Colors.amber,
            child: Column(
              children: [
                Text(noteData[index].title),
                Text(noteData[index].content),
              ],
            ),
          ),
        );
      },
    );
  }
}
