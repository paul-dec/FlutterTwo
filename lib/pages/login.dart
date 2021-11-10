import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String errorString = "";

  Future<void> postLogin() async {
    const String apiUrl = "http://localhost:8080/user/login";

    try {
      var response = await http.post(Uri.parse(apiUrl), body: {'email': emailController.text, 'password' : passwordController.text});
      print(response);
      if (response.statusCode == 200) {
        var content = json.decode(response.body);
        var _pseudo = content['message']['pseudo'].toString();
        var _email = content['message']['email'].toString();
        var _id = content['message']['_id'].toString();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(pseudo: _pseudo, email: _email, id: _id,)));
      } else {
        setState(() {
          errorString = "Email or password not valid";
        });
        print(response.statusCode);
        print(response.body);
      }
    } catch(e) {
      setState(() {
        errorString = "Invalid internet connexion";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                postLogin();
              },
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: const Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(errorString)
          ],
        ),
      ),
    );
  }
}
