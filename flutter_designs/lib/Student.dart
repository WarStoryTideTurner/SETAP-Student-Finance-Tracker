class Student {
  String _name;
  String _surname;
  String _email;
  String _addressLineOne;
  String _addressLineTwo;
  String _city;
  String _county;
  String _postCode;

  DateTime _dateOfBirth;

  int _countryCode;
  int _phoneNumber;

  //var dateFormat = DateTime(year);

  Student(
      this._name,
      this._surname,
      this._email,
      this._addressLineOne,
      this._addressLineTwo,
      this._city,
      this._county,
      this._postCode,
      this._dateOfBirth,
      this._countryCode,
      this._phoneNumber);

  // String toString() {
  //   return 'Student{name: $_name, surname: $_surname, email: $_email, '
  //       'addressLineOne: $_addressLineOne, addressLineTwo: $_addressLineTwo, '
  //       'city: $_city, county: $_county, postCode: $_postCode, '
  //       'dateOfBirth: $_dateOfBirth, countryCode: $_countryCode, '
  //       'phoneNumber: $_phoneNumber}';
  // }
}
