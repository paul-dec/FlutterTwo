import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertwo/BLoC/bloc.dart';
import 'package:fluttertwo/styles.dart';
import 'package:fluttertwo/widgets/custom_button.dart';
import 'package:fluttertwo/widgets/custom_spacer.dart';
import 'package:fluttertwo/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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

  String errorString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.xBlue,
      appBar: AppBar(
        backgroundColor: ThemeColor.xPurple,
        title: const Text("Register", style: ThemeText.whiteTextBold,),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                stream: bloc.name,
                builder: (context, snapshot) {
                  return CustomTextField(
                    myController: pseudoController,
                    myTextInputType: TextInputType.name,
                    myHintText: 'Your name',
                    obscureText: false,
                    onChangedFunction: bloc.changeName,
                    errorText: snapshot.error.toString() == 'null' ? '' : snapshot.error.toString(),
                  );
                },
              ),
              const CustomSpacer(),
              StreamBuilder(
                stream: bloc.email,
                builder: (context, snapshot) {
                  return CustomTextField(
                    myController: emailController,
                    myTextInputType: TextInputType.emailAddress,
                    myHintText: 'Your email',
                    obscureText: false,
                    onChangedFunction: bloc.changeEmail,
                    errorText: snapshot.error.toString() == 'null' ? '' : snapshot.error.toString(),
                  );
                },
              ),
              const CustomSpacer(),
              StreamBuilder(
                stream: bloc.password,
                builder: (context, snapshot) {
                  return CustomTextField(
                    myController: passwordController,
                    myTextInputType: TextInputType.visiblePassword,
                    myHintText: 'Your name',
                    obscureText: true,
                    onChangedFunction: bloc.changePassword,
                    errorText: snapshot.error.toString() == 'null' ? '' : snapshot.error.toString(),
                  );
                },
              ),
              const CustomSpacer(),
              CustomButton(
                buttonColor: ThemeColor.xPurple,
                textValue: 'Register',
                textStyle: ThemeText.whiteTextBold,
                function: () async {
                  postRegister();
                },
              ),
              const CustomSpacer(),
              Text(errorString, style: ThemeText.xPurpleTextItalic,),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postRegister() async {
    const String apiUrl = "http://localhost:8080/user/register";

    try {
      var response = await http.post(Uri.parse(apiUrl), body: {'email': emailController.text, 'pseudo': pseudoController.text, 'password' : passwordController.text});
      if (response.statusCode == 200) {
        var content = json.decode(response.body);
        print(content);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (Route<dynamic> route) => false);
      } else {
        setState(() {
          errorString = "Email invalid or already use";
        });
      }
    } catch(e) {
      setState(() {
        errorString = "Invalid internet connexion or API is down";
      });
    }
  }
}
