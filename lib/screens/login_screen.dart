import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notetastic/services/auth.dart';

class LoginScreen extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const LoginScreen({
    Key key,
    @required this.auth,
    @required this.firestore,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notetastic"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LinearProgressIndicator(),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: "Email"),
              controller: _emailController,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: "Password"),
              controller: _passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final returnMess = await Auth(auth: widget.auth).signIn(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (returnMess == "Success") {
                  _emailController.clear();
                  _passwordController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(returnMess),
                  ));
                }
              },
              child: const Text("Sign in"),
            ),
            TextButton(
              onPressed: () async {
                final returnMess = await Auth(auth: widget.auth).createAccount(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (returnMess == "Success") {
                  _emailController.clear();
                  _passwordController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(returnMess),
                  ));
                }
              },
              child: const Text("Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
