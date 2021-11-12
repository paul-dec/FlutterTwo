import 'dart:async';

import 'package:fluttertwo/BLoC/validators.dart';

class Bloc extends Object with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  final _nameController = StreamController<String>.broadcast();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<String> get name => _nameController.stream.transform(validateName);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeName => _nameController.sink.add;

  void dispose() {
    _emailController.close();
    _passwordController.close();
    _nameController.close();
  }
}

final bloc = Bloc();