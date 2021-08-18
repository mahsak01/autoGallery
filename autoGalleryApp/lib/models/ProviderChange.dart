import 'package:flutter/cupertino.dart';

class ProviderChange with ChangeNotifier {

  bool _passwordInSignIn=false;
  int _selectedIndex = 4;


  bool get passwordInSignIn => _passwordInSignIn;

  void setPasswordInSignIn() {
    _passwordInSignIn=!_passwordInSignIn;
     notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int value) {
    _selectedIndex=value;
    notifyListeners();
  }
}