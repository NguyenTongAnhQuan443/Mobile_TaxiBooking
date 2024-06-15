import 'dart:async';

import '../fire_base/fire_base_auth.dart';

class AuthBloc {
  var fireBaseAuth = FireBaseAuth();
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passColtroller = new StreamController();

  Stream get nameStream => _nameController.stream;

  Stream get phoneStream => _phoneController.stream;

  Stream get passStream => _passColtroller.stream;

  Stream get emailStream => _emailController.stream;

  bool isValid(String name, String phone, String email, String pass) {
    if (name.length < 1) {
      _nameController.sink.addError('Tên người dùng không được để trống !');
      return false;
    }
    _nameController.sink.add('');

    final bool phonelValid = RegExp(r'^0\d{9}$').hasMatch(phone);
    if (phonelValid == false) {
      _phoneController.sink.addError('Số điện thoại chưa đúng định dạng !');
      return false;
    }
    _phoneController.sink.add('');

    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid == false) {
      _emailController.sink.addError('Email chưa đúng định dạng !');
      return false;
    }
    _emailController.sink.add('');

    final bool passValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(pass);
    if (passValid == false) {
      _passColtroller.sink.addError('Mật khẩu chưa đúng định dạng');
      return false;
    }
    _passColtroller.sink.add('');

    return true;
  }

  void signUp(String email, String pass, String phone, String name,
      Function onSuccess, Function(String) onRegisterError) {
    fireBaseAuth.signUp(email, pass, name, phone, onSuccess, onRegisterError);
  }

  void signIn(String email, String pass, Function onSuccess, Function(String) onSignInError) {
    fireBaseAuth.signIn(email, pass, onSuccess, onSignInError);
  }
  void dispose() {
    _nameController.close();
    _emailController.close();
    _passColtroller.close();
    _phoneController.close();
  }
}
