import 'package:flutter_designs/house_type.dart';

class House {
  final int _id;
  String _houseNumberOrName;
  String _addressLineOne;
  String _addressLineTwo;
  String _postCode;
  EHouseTypes _houseType; // Enum containing different house types.
  String _description;
  int _numOfBedrooms;
  int _numOfKitchens;
  int _numOfBathrooms;
  bool _arePetsAllowed;
  bool _hasParkingSpace;
  bool _hasGardenOrPatio;

  House(
    this._id,
    this._houseNumberOrName,
    this._addressLineOne,
    this._addressLineTwo,
    this._postCode,
    this._houseType,
    this._description,
    this._numOfBedrooms,
    this._numOfKitchens,
    this._numOfBathrooms,
    this._arePetsAllowed,
    this._hasParkingSpace,
    this._hasGardenOrPatio,
  );

  int get getID => _id;
  String get getHouseNumber => _houseNumberOrName;
  String get getAddressLineOne => _addressLineOne;
  String get getAddressLineTwo => _addressLineTwo;
  String get getPostCode => _postCode;
  EHouseTypes get getHouseType => _houseType; // Enum containing different house types.
  String get getDescription => _description;
  int get getNumOfBedrooms => _numOfBedrooms;
  int get getNumOfKitchens => _numOfKitchens;
  int get getNumOfBathrooms => _numOfBathrooms;
  bool get arePetsAllowed => _arePetsAllowed;
  bool get hasParkingSpace => _hasParkingSpace;
  bool get hasGardenOrPatio => _hasGardenOrPatio;

  void setAddress(String houseNoOrName, String addressLineOne, String addressLineTwo, String postCode) {
    _houseNumberOrName = houseNoOrName;
    _addressLineOne = addressLineOne;
    _addressLineTwo = addressLineTwo;
    _postCode = postCode;
  }

  void editHouseDetails({
    EHouseTypes? houseType,
    String? description,
    int? numOfBedrooms,
    int? numOfKitchens,
    int? numOfBathrooms,
    bool? arePetsAllowed,
    bool? hasParkingSpace,
    bool? hasGardenOrPatio,
  }) {
    _houseType = houseType!;
    _description = description!;
    _numOfBedrooms = numOfBedrooms!;
    _numOfKitchens = numOfKitchens!;
    _numOfBathrooms = numOfBathrooms!;
    _arePetsAllowed = arePetsAllowed!;
    _hasParkingSpace = hasParkingSpace!;
    _hasGardenOrPatio = hasGardenOrPatio!;
  }
}
