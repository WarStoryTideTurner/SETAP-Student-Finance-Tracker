class House {
//house number , first line of the address, second line of the address, postcode, number of rooms, num of kitchens, num of bathrooms, petsAllowed boolean,
  int _id;
  int _houseNumber;
  String _firstLineOfAddress;
  String _secondLineOfAddress;
  String _postCode;
  String _description;
  int _numOfBedrooms;
  int _numOfKitchens;
  int _numOfBathrooms;
  bool _isPetsAllowed;
  bool _isParkingSpace;
  bool _garden;

  //List<String> myList;

  //create a List of the type of houses

  House(
      this._id,
      this._houseNumber,
      this._firstLineOfAddress,
      this._secondLineOfAddress,
      this._postCode,
      this._description,
      this._numOfBedrooms,
      this._numOfKitchens,
      this._numOfBathrooms,
      this._isPetsAllowed,
      this._isParkingSpace,
      this._garden);
}

set houseNum(int houseNumber) {
  int _houseNumber = houseNumber;
}

set firstLineAddress(String firstLine) {
  String _firstLineAddress = firstLine;
}

set secondLineAddress(String secondLine) {
  String _secondLineAddress = secondLine;
}

set postCode(String postCode) {
  String _postCode = postCode;
}

set description(String description) {
  String _description = description;
}

set numOfBedrooms(int numOfBedrooms) {
  int _numOfBedrooms = numOfBedrooms;
}

set numOfKitchen(int numOfKitchens) {
  int _numOfKitchen = numOfKitchens;
}

set numOfBathrooms(int numOfBathrooms) {
  int _numOfBathrooms = numOfBathrooms;
}

set petsAllowed(bool petsAllowed) {
  bool _petsAllowed = petsAllowed;
}

set parkingSpace(bool parking) {
  bool _isParkingSpace = parking;
}
