class Student {
  late String _name;
  late String _surname;
  late String _email;
  late String _addressLineOne;
  late String _addressLineTwo;
  late String _city;
  late String _county;
  late String _postCode;

  late DateTime _dateOfBirth;
  late int _countryCode;
  late int _phoneNumber;

  Student(
      String name,
      String surname,
      String email,
      String addressLineOne,
      String addressLineTwo,
      String city,
      String county,
      String postCode,
      DateTime dateOfBirth,
      int countryCode,
      int phoneNumber) {
    _name = name;
    _surname = surname;
    _email = email;
    _addressLineOne = addressLineOne;
    _addressLineTwo = addressLineTwo;
    _city = city;
    _county = county;
    _postCode = postCode;
    _dateOfBirth = dateOfBirth;
    _countryCode = countryCode;
    _phoneNumber = phoneNumber;
  }
}
