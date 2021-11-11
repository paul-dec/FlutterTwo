import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertwo/class/user.dart';
import 'package:fluttertwo/pages/login.dart';
import 'package:fluttertwo/styles.dart';
import 'package:fluttertwo/widgets/custom_button.dart';

class SettingsPage extends StatefulWidget {
  final User user;

  const SettingsPage({Key? key, required this.user}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<SettingsPage> createState() => _SettingsPageState(user: user);
}

class _SettingsPageState extends State<SettingsPage> {
  final User user;

  _SettingsPageState({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.xBlue,
      appBar: AppBar(
        backgroundColor: ThemeColor.xPurple,
        title: Text("Settings " + user.pseudo, style: ThemeText.whiteTextBold,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Text(user.email, style: ThemeText.whiteTextBold,),
              const Spacer(),
              CustomButton(
                buttonColor: ThemeColor.xPurple,
                textValue: "Logout",
                textStyle: ThemeText.whiteTextBold,
                // ignore: void_checks
                function: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()), (Route<dynamic> route) => false
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}