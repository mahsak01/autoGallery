import 'package:flutter/cupertino.dart';

class ProviderChange with ChangeNotifier {

  bool _passwordInSignIn=false;

  bool get passwordInSignIn => _passwordInSignIn;

  void setPasswordInSignIn() {
    _passwordInSignIn=!_passwordInSignIn;
     notifyListeners();
  }
}