import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertwo/pages/login.dart';
import 'package:fluttertwo/widgets/custom_button.dart';

void main() {

  testWidgets('Login is good', (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: LoginPage())
    );
    await tester.pumpWidget(testWidget);

    final appBarTitle = find.text('Login');
    final buttonText = find.text('Sign In');
    final registerText = find.text('Register');

    expect(appBarTitle, findsOneWidget);
    expect(buttonText, findsOneWidget);
    expect(registerText, findsOneWidget);
  });

  testWidgets('Custom button is good', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: CustomButton(buttonColor: Colors.white, textValue: "Hello", textStyle: const TextStyle(color: Colors.white), function: () {},))
    );
    await tester.pumpWidget(testWidget);

    final buttonText = find.text('Hello');

    expect(buttonText, findsOneWidget);
  });
}