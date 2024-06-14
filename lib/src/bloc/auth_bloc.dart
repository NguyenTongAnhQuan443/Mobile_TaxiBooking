import 'dart:async';

class AuthBloc {
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passColtroller = new StreamController();

  Stream get nameStream => _nameController.stream;

  Stream get phoneStream => _phoneController.stream;

  Stream get passStream => _passColtroller.stream;

  Stream get emailStream => _emailController.stream;

  bool isValid(String name, String phone, String email, String pass) {
    if (name == null) {
      _nameController.sink.addError('Tên người dùng không được để trống !');
      return false;
    }
    _nameController.sink.add('');

    if (phone.length < 9 || phone.length > 10 ) {
      _phoneController.sink.addError('Số điện thoại chưa đúng định dạng !');
      return false;
    }
    _phoneController.sink.add('');

    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
      _passColtroller.sink.addError('Mật khẩu ít nhất 8 ký tự, ít nhất 1 chữ hoa, 1 chữ thường, 1 số và 1 ký tự đặc biệt');
      return false;
    }
    _passColtroller.sink.add('');

    return true;
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passColtroller.close();
    _phoneController.close();
  }
}
