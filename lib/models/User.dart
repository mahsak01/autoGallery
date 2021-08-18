// models of user
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

  /*
    ************************** constructor **************************
   */
  User(this._id, this._name, this._lastname, this._username, this._email,
      this._password);


  /*
    ************************** getter **************************
   */
  String get password => _password;

  String get email => _email;

  String get username => _username;

  String get lastname => _lastname;

  String get name => _name;


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



}