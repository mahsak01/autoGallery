import 'package:flutter/cupertino.dart';

import 'Car.dart';
import 'PubilcValue.dart';

/*
************************** ProviderChange **************************
 */
class ProviderChange with ChangeNotifier {

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