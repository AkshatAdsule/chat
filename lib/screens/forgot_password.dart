import 'package:chat/screens/reset_password.dart';
import 'package:chat/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _verification_controller = TextEditingController();
  bool _secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _email_controller,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
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
                height: 50,
              ),
              SizedBox(
                width: 260,
                child: FilledButton(
                  onPressed: () => {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            " Verification code sent to email${_email_controller.value.text}")))
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Send Verification Code",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _verification_controller,
                decoration: InputDecoration(
                  labelText: "Verification Code",
                  hintText: " Enter the 6-digit number",
                  labelStyle: const TextStyle(
                    fontSize: 22,
                  ),
                  border: const OutlineInputBorder(
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
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 260,
                child: FilledButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPassword()))
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Confirm Email",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
