import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'PubilcValue.dart';
import 'User.dart';

/*
************************** ProviderChange **************************
 */
class ProviderChange with ChangeNotifier {
  /*
    ************************** user profile  **************************
   */
  User _users=user;

  User get users => _users;

  void setProfile(File input) {
    _users.profile=input;
    notifyListeners();
  }


  /*
    ************************** password **************************
   */
  bool _passwordInSignIn=false;

  bool get passwordInSignIn => _passwordInSignIn;

  void setPasswordInSignIn() {
    _passwordInSignIn=!_passwordInSignIn;
    notifyListeners();
  }


  /*
   ************************** BottomNavigationBar **************************
   */
  int _selectedIndex = 4;



  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int value) {
    _selectedIndex=value;
    notifyListeners();
  }
}