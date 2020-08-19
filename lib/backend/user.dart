class User {
  bool _valid;
  String _name;
  String _email;

  User({String name, String email, bool valid}) {
    this._valid = valid != null ? valid : false;
    this._name = this._valid ? name : 'Test User';
    this._email = this._valid ? email : 'test_user@email.com';
  }

  String getName() { return this._name; }

  String getEmail() { return this._email; }

  String toString() {
    return 'name: ' + this._name + 'email: ' + this._email;
  }
}