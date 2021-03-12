import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import '../models/note.dart';
import '../database/db_handler.dart';
import '../widgets/note_grid.dart';

class HomeScreen extends StatefulWidget {
  final dbHandler = DbHandler();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> noteData = [];
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    widget.dbHandler.getNotes().then((data) {
      setState(() {
        data.forEach((x) {
          final fetchedNote = Note(
            title: x.title,
            content: x.content,
          );
          noteData.add(fetchedNote);
        });
        isLoading = false;
      });
    });
		print(noteData);
  }

  void _addNote() {
    final faker = Faker();
    final newNote = Note(
      title: faker.person.firstName(),
      content: faker.lorem.sentence(),
    );
    setState(() {
      noteData.add(newNote);
    });
  }

  void _deleteNote(String id) {
    setState(() {
      noteData.removeWhere((note) => note.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : NoteGrid(
              noteData: noteData,
              deleteNote: _deleteNote,
            ),
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
          onPressed: _addNote,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
