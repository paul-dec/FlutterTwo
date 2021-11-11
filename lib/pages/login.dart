import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertwo/class/auth.dart';
import 'package:fluttertwo/class/user.dart';
import 'package:fluttertwo/widgets/custom_button.dart';
import 'package:fluttertwo/widgets/custom_spacer.dart';
import 'package:fluttertwo/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../styles.dart';
import 'home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String errorString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.xBlue,
      appBar: AppBar(
        backgroundColor: ThemeColor.xPurple,
        title: const Text("Login", style: ThemeText.whiteTextBold,),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                myController: emailController,
                myTextInputType: TextInputType.emailAddress,
                myHintText: 'Your email',
                obscureText: false,
              ),
              const CustomSpacer(),
              CustomTextField(
                myController: passwordController,
                myTextInputType: TextInputType.visiblePassword,
                myHintText: 'Your password',
                obscureText: true,
              ),
              const CustomSpacer(),
              CustomButton(
                buttonColor: ThemeColor.xPurple,
                textValue: 'Sign In',
                textStyle: ThemeText.whiteTextBold,
                function: () async {
                  postLogin(emailController.text, passwordController.text);
                },
              ),
              const CustomSpacer(),
              CustomButton(
                buttonColor: Colors.transparent,
                textValue: 'Register',
                textStyle: ThemeText.whiteTextItalic,
                function: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                },
              ),
              const CustomSpacer(),
              Text(errorString, style: ThemeText.xPurpleTextItalic,)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postLogin(email, password) async {
    try {
      User? tmp = await getUser(email, password);
      if (tmp == null) {
        setState(() {
          errorString = "Email or password not valid";
        });
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(user: tmp,)));
      }
    } catch(e) {
      setState(() {
        errorString = e.toString().replaceAll('Exception: ', '');
      });
    }
  }
}
