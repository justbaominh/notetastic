import 'package:flutter/material.dart';
import 'package:notetastic/screens/note_edit_screen.dart';

import './server/server.dart' as server;
import './screens/home_screen.dart';

void main() {
	server.start();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notetastic',
			debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFF4CE6A),
				accentColor: Color(0xFFFF6666),
      ),
      home: HomeScreen(),
      routes: {
        "/hs": (context) => HomeScreen(),
        "/test": (context) => NoteEditScreen(),
      },
    );
  }
}
