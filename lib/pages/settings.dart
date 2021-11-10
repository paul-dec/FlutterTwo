import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertwo/pages/login.dart';
import 'package:fluttertwo/styles.dart';

class SettingsPage extends StatefulWidget {
  final String pseudo;
  final String email;
  final String id;

  const SettingsPage({Key? key, required this.pseudo, required this.email, required this.id}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<SettingsPage> createState() => _SettingsPageState(pseudo: pseudo, email: email, id: id);
}

class _SettingsPageState extends State<SettingsPage> {
  final String pseudo;
  final String email;
  final String id;

  _SettingsPageState({required this.pseudo, required this.email, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.xBlue,
      appBar: AppBar(
        backgroundColor: ThemeColor.xPurple,
        title: Text("Settings " + pseudo, style: ThemeText.whiteTextBold,),
      ),
      body: Center(
        child: Column(
          children: [
            Text(email),
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.fromLTRB(50, 10, 50, 10)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  )
              ),
              onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (Route<dynamic> route) => false,),
              child: const Text(
                "Disconnect",
                style: ThemeText.whiteTextBold,
              ),
            ),
          ],
        ),
      )
    );
  }
}