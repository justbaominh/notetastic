import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import '../models/note.dart';
import '../widgets/note_grid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> noteData = [];
  bool isLoading = false;

  void _addNote() {
    const faker = Faker();
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
          ? const Center(child: CircularProgressIndicator())
          : NoteGrid(
              noteData: noteData,
              deleteNote: _deleteNote,
            ),
      floatingActionButton: Container(
        width: 75.0,
        height: 75.0,
        margin: const EdgeInsets.only(bottom: 10),
        child: RawMaterialButton(
          fillColor: const Color(0xFFFF6666),
          shape: const CircleBorder(),
          elevation: 0.0,
          onPressed: _addNote,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
