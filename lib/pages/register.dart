import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final pseudoController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> postRegister() async {
    const String apiUrl = "http://localhost:8080/user/register";

    var response = await http.post(Uri.parse(apiUrl), body: {'email': emailController.text, 'pseudo': pseudoController.text, 'password' : passwordController.text});
    if (response.statusCode == 200) {
      var content = json.decode(response.body);
      print(content)
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      // print error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.text,
              controller: pseudoController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                filled: true,
                fillColor: Color(0xFFDCDCDC),
                hintText: 'Your pseudo',
              ),
            ),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                filled: true,
                fillColor: Color(0xFFDCDCDC),
                hintText: 'Your email',
              ),
            ),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xFFDCDCDC),
                  hintText: 'Your password'),
            ),
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.fromLTRB(50, 10, 50, 10)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ))),
              onPressed: () async {
                // fetchAlbum()
                postRegister();
              },
              child: const Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.fromLTRB(50, 10, 50, 10)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              onPressed: () async {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
