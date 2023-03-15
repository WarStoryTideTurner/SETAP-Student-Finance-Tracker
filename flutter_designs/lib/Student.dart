class Student {
  String _id;
  String _gender;
  String _name;
  String _surname;
  String _email;
  String _addressLineOne;
  String _addressLineTwo;
  String _city;
  String _county;
  String _postCode;

  int _budgetMonth;
  int _dayOfBirth;
  int _monthOfBirth;
  int _yearOfBirth;
  int _countryCode;
  int _phoneNumber;

  bool _hasPet;

  //var dateFormat = DateTime(year);

  Student(
      this._id,
      this._gender,
      this._name,
      this._surname,
      this._dayOfBirth,
      this._monthOfBirth,
      this._yearOfBirth,
      this._hasPet,
      this._budgetMonth,
      this._email,
      this._addressLineOne,
      this._addressLineTwo,
      this._city,
      this._county,
      this._postCode,
      this._countryCode,
      this._phoneNumber);

  String get id => _id;
  String get name => _name;

  set name(String nameVal) {
    _name = nameVal;
  }

  // String toString() {
  //   return 'Student{name: $_name, surname: $_surname, email: $_email, '
  //       'addressLineOne: $_addressLineOne, addressLineTwo: $_addressLineTwo, '
  //       'city: $_city, county: $_county, postCode: $_postCode, '
  //       'dateOfBirth: $_dateOfBirth, countryCode: $_countryCode, '
  //       'phoneNumber: $_phoneNumber}';
  // }
}
