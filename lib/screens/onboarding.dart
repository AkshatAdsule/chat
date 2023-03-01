import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "We are thrilled to have you trying our app. This app is design for you to chat with your friends",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 100),
            Text(
              "Already had an account?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: 250,
              child: FloatingActionButton.extended(
                onPressed: () => {},
                icon: Icon(Icons.add),
                label: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(
              thickness: 3,
            ),
            SizedBox(height: 18),
            Text(
              "Create new account",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 250,
              child: FloatingActionButton.extended(
                onPressed: () => {},
                icon: Icon(Icons.add),
                label: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
