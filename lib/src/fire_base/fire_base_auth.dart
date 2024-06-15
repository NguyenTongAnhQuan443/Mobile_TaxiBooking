import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireBaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      //
      _createUser(user.user!.uid, name, phone, onSuccess, onRegisterError);
    }).catchError((err) {
      _onSignUpErro(err.code, onRegisterError);
    });
  }

  _createUser(String userID, String name, String phone, Function onSuccess, Function(String) onRegisterError) {
    var user = {'name': name, 'phone': phone};
    var ref = FirebaseDatabase.instance.ref().child('users');
    ref.child(userID).set(user).then((user) {
      //   SUCCESS
      onSuccess();
    }).catchError((err) {
      onRegisterError('Đăng ký thất bại, vui lòng thử lại');
    });
  }

  void _onSignUpErro(String code, Function(String) onRegisterError) {
    switch (code) {
      case 'ERROR_INVALID_EMAIL':
      case 'ERROR_INVALID_CREDENTIAL':
        onRegisterError('Email không hợp lệ');
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        onRegisterError('Email đã tồn tại');
        break;
      case 'ERROR_WEAK_PASSWORD':
        onRegisterError("Mật khẩu yếu");
        break;
      default:
        onRegisterError('Đăng ký thất bại, vui lòng thử lại');
        break;
    }
  }

  void signIn(String email, String pass, Function onSuccess, Function(String) onSignInError){
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
          onSuccess();
    }).catchError((err) {
      onSignInError('Đăng nhập thất bại, vui lòng thử lại');
    });
  }
}
