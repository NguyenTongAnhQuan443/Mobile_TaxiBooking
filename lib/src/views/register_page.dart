import 'package:flutter/material.dart';
import 'package:taxiapp/src/bloc/auth_bloc.dart';
import 'package:taxiapp/src/views/dialog/loading_dialog.dart';
import 'package:taxiapp/src/views/dialog/msg_dialog.dart';
import 'package:taxiapp/src/views/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc = AuthBloc();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _checkShowPass = false;

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  } // METHOD

  void _showPass() {
    setState(() {
      _checkShowPass = !_checkShowPass;
    });
  }

  void onSignUpClick() {
    var isValid = authBloc.isValid(_nameController.text, _phoneController.text,
        _emailController.text, _passController.text);
    if (isValid) {
      //   create User
      // loading dialog
      LoadingDialog.showLoadingDialog(context, 'Loading ...');
      authBloc.signUp(
        _emailController.text,
        _passController.text,
        _phoneController.text,
        _nameController.text,
        () {
          LoadingDialog.hideDialog(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        (msg) {
          // show msg dialog
          LoadingDialog.hideDialog(context);
          MsgDialog.showMsgDialog(context, 'Đăng ký thất bại', msg);
        },
      );
    }
  }

  // METHOD

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 60, right: 60, bottom: 30),
                  child: Image.asset('assets/images/car_red.jpg'),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: [
                      Text(
                        'Welcome Abroad!',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      Text(
                        'Sigup with iCab in simple steps',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: StreamBuilder(
                    stream: authBloc.nameStream,
                    builder: (context, snapshot) => TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        border: const OutlineInputBorder(),
                        labelText: 'Name',
                        labelStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.account_circle_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: StreamBuilder(
                    stream: authBloc.phoneStream,
                    builder: (context, snapshot) => TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        border: const OutlineInputBorder(),
                        labelText: 'Phone',
                        labelStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.phone_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: StreamBuilder(
                      stream: authBloc.emailStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            border: const OutlineInputBorder(),
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      StreamBuilder(
                          stream: authBloc.passStream,
                          builder: (context, snapshot) {
                            return TextField(
                              controller: _passController,
                              obscureText: !_checkShowPass,
                              decoration: InputDecoration(
                                errorText: snapshot.hasError
                                    ? snapshot.error.toString()
                                    : null,
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                labelStyle: const TextStyle(color: Colors.grey),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          child: Text(
                            (!_checkShowPass == true) ? 'SHOW' : 'HIDE',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            _showPass();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      onSignUpClick();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Signup',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Already a User?',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      InkWell(
                        child: const Text(
                          'Login now',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
