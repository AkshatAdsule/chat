import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontSize: 22,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 22,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_secure ? Icons.security : Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        _secure = !_secure;
                      });
                    },
                  ),
                ),
                obscureText: _secure,
              ),
              Row(
                children: [
                  Text("Forgot Password?", textAlign: TextAlign.right),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sign Up", textAlign: TextAlign.left),
                ],
              ),
              // Divider(
              //   thickness: 3,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
