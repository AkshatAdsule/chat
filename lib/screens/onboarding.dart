import 'package:chat/screens/sign_In.dart';
import 'package:chat/screens/sign_up.dart';
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
      appBar: AppBar(title: const Text("Welcome")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "We are thrilled to have you trying our app. This app is design for you to chat with your friends",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 100),
            const Text(
              "Already had an account?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: 250,
              child: FilledButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()))
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(height: 18),
            const Text(
              "Create new account",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 250,
              child: FilledButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()))
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
