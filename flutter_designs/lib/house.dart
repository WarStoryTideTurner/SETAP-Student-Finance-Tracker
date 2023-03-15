class House {
//house number , first line of the address, second line of the address, postcode, number of rooms, num of kitchens, num of bathrooms, petsAllowed boolean,
  int _houseNum;
  String _firstLineOfAddress;
  String _secondLineOfAddress;
  String _postCode;
  int _numOfRooms;
  int _numOfKitchens;
  int _numOfBathrooms;
  bool _petsAllowed;

  House(
      this._houseNum,
      this._firstLineOfAddress,
      this._secondLineOfAddress,
      this._postCode,
      this._numOfRooms,
      this._numOfKitchens,
      this._numOfBathrooms,
      this._petsAllowed);
}
