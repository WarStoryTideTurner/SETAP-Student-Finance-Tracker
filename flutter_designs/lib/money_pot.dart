class MoneyPot {
  String _name;
  int _balance;

  MoneyPot(this._name, this._balance);

  String get getName => _name;
  int get getBal => _balance;

  set changeName(String value) => _name = value;
  set setBal(int value) => _balance += value;
}
