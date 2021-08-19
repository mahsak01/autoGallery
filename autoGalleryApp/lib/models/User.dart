// models of user
import 'dart:io';

import 'package:flutter/cupertino.dart';

class User{

  //id of user
  int _id;

  // name of user
  String _name;

  //lastname of user
  String _lastname;

  //username of user
  String _username;

  //email of user
  String _email;

  //passsword of user
  String _password;


  //phone number of user
  String phoneNumber="";

  //national Code of user
  String nationalCode="";

  //image of profile
  File _profile;

  /*
    ************************** constructor **************************
   */
  User(this._id, this._name, this._lastname, this._username, this._email,
      this._password, { this.phoneNumber,this.nationalCode});


  /*
    ************************** getter **************************
   */
  String get password => _password;

  String get email => _email;

  String get username => _username;

  String get lastname => _lastname;

  String get name => _name;

  File get profile => _profile;

  String get phoneNumbers => phoneNumber;

  String get nationalCodes => nationalCode;

  /*
    ************************** setter **************************
   */
  set password(String value) {
    _password = value;
  }

  set email(String value) {
    _email = value;
  }

  set username(String value) {
    _username = value;
  }

  set lastname(String value) {
    _lastname = value;
  }

  set name(String value) {
    _name = value;
  }

  set profile(File value) {
    _profile = value;
  }

  set phoneNumbers(String value) {
    phoneNumber = value;
  }

  set nationalCodes(String value) {
    nationalCode = value;
  }
}