class StudentClass {
  final int _id;
  late String _name;
  late String _surname;
  late String _proflePicturePath;
  late String _email;
  late String _phoneNumber;

  StudentClass(this._id);
  StudentClass.copy(this._id, this._name, this._surname,
      this._proflePicturePath, this._email, this._phoneNumber);

  int get getID => _id;
  String get getName => _name;
  String get getSurname => _surname;
  String get getProfilePicture => _proflePicturePath;
  String get getEmail => _email;
  String get getPhoneNumber => _phoneNumber;

  set setName(String value) => _name = value;
  set setSurname(String value) => _surname = value;
  set setProfilePicture(String value) => _proflePicturePath = value;
  set setEmail(String value) => _email = value;
  set setPhoneNumber(String value) => _phoneNumber = value;

  // String toString() {
  //   return 'Student{name: $_name, surname: $_surname, email: $_email, '
  //       'addressLineOne: $_addressLineOne, addressLineTwo: $_addressLineTwo, '
  //       'city: $_city, county: $_county, postCode: $_postCode, '
  //       'dateOfBirth: $_dateOfBirth, countryCode: $_countryCode, '
  //       'phoneNumber: $_phoneNumber}';
  // }
}
