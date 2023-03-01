import 'package:chat/screens/sign_In.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _secure_pswd = true;
  bool _secure_confirm = true;
  TextEditingController _password_controller = TextEditingController();
  TextEditingController _password_confirm_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _password_controller,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: " Enter new Password",
                  labelStyle: const TextStyle(
                    fontSize: 22,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _secure_pswd ? Icons.security : Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        _secure_pswd = !_secure_pswd;
                      });
                    },
                  ),
                ),
                obscureText: _secure_pswd,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _password_confirm_controller,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: " Confirm new Password",
                  labelStyle: const TextStyle(
                    fontSize: 22,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_secure_confirm
                        ? Icons.security
                        : Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        _secure_confirm = !_secure_confirm;
                      });
                    },
                  ),
                ),
                obscureText: _secure_confirm,
              ),
              const SizedBox(
                height: 30,
              ),
              FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Set Password",
                      style: TextStyle(fontSize: 18),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
