import 'package:flutter_designs/house_type.dart';
import 'package:flutter_designs/student_class.dart';

class House {
  //House's Personal Details

  final int _id;
  String _housePicturePath;
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

  //Details of People in the House
  late List<StudentClass> residents;

  House(
    this._id,
    this._housePicturePath,
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
  ) {
    residents = List.empty();
  }

  int get getID => _id;
  String get getHousePicturePath => _housePicturePath;
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
    String? housePicturePath,
    EHouseTypes? houseType,
    String? description,
    int? numOfBedrooms,
    int? numOfKitchens,
    int? numOfBathrooms,
    bool? arePetsAllowed,
    bool? hasParkingSpace,
    bool? hasGardenOrPatio,
  }) {
    _housePicturePath = housePicturePath!;
    _houseType = houseType!;
    _description = description!;
    _numOfBedrooms = numOfBedrooms!;
    _numOfKitchens = numOfKitchens!;
    _numOfBathrooms = numOfBathrooms!;
    _arePetsAllowed = arePetsAllowed!;
    _hasParkingSpace = hasParkingSpace!;
    _hasGardenOrPatio = hasGardenOrPatio!;
  }

  void addResident(StudentClass resident) => residents.add(resident);
  StudentClass findResident({String? fName, String? lName}) {
    for (int i = 0; i < residents.length; i++) {
      if (residents.elementAt(i).getName == fName && residents.elementAt(i).getSurname == lName) return residents.elementAt(i);
    }
    throw Exception("Error: Student was not found!");
  }

  void removeResident(StudentClass resident) => residents.remove(resident);
}
