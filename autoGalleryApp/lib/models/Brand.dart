//Brand Models
class Brand{
  // name of brand
  String _nameOfBrand;

  //car list
  List<String> _cars=[];



/*
    ************************** constructor **************************
   */
  Brand(this._nameOfBrand);

/*
    ************************** getter **************************
   */


  List<String> get cars => _cars;

  String get nameOfBrand => _nameOfBrand;



/*
    ************************** setter **************************
   */
  set setCars(String value) {
    _cars.add(value) ;
  }



}