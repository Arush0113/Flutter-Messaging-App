import 'package:flutter/material.dart';

import '../home_page.dart';
import '../screens/chat_home_screen.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    // this.isLoading,
  );

  // final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userName.trim(), _userPassword.trim(),
          _isLogin, context);
    }
  }

  var _isLogin = true;

  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
//                  Container(
//                    height: 130,
//                    width: 130,
////                    color: Colors.white,
//                    child: Image.asset(
//                      'dev_assets/dummy_symbol_adaptive.png'
//                    ),
//                  ),
                  Container(
                    height: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    cursorColor: Color(0XFF5B16D0),
                    style: TextStyle(
                      color: Color(0XFF4563DB),
                    ),
                    key: ValueKey('email'),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                        color: Color(0XFF4563DB),
                      ),
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      labelStyle: TextStyle(
                        color: Color(0XFF4563DB),
                      ),
//                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0XFF4563DB),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        gapPadding: 10,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (!_isLogin)
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Username',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  if (!_isLogin)
                    SizedBox(
                      height: 4,
                    ),
                  if (!_isLogin)
                    TextFormField(
                      cursorColor: Color(0XFF5B16D0),
                      style: TextStyle(
                        color: Color(0XFF4563DB),
                      ),
                      key: ValueKey('Username'),
                      autocorrect: true,
                      textCapitalization: TextCapitalization.words,
                      enableSuggestions: false,
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(
                          color: Color(0XFF4563DB),
                        ),
                        fillColor: Colors.white.withOpacity(0.7),
                        filled: true,
                        labelStyle: TextStyle(
                          color: Color(0XFF4563DB),
                        ),
//                        labelText: 'Username',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Color(0XFF4563DB),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    cursorColor: Color(0XFF5B16D0),
                    style: TextStyle(
                      color: Color(0XFF4563DB),
                    ),
                    key: ValueKey('password'),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'The password must be at least 7 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Color(0XFF4563DB),
                      ),
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      labelStyle: TextStyle(
                        color: Color(0XFF4563DB),
                      ),
//                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0XFF4563DB),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onSaved: (value) {
                      _userPassword = value;
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: 40,
                    width: 240,
                    child: RaisedButton(
                      highlightElevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _isLogin ? 'Login' : 'Sign Up',
                        style:
                            TextStyle(fontSize: 18, color: Color(0XFF4563DB)),
                      ),
//                       onPressed: () {
// //                          Navigator.of(context).pushNamed(HomePage.routeName);
//                         // Navigator.of(context).pushNamed(HomePage.routeName);

//                       },
                      onPressed: _trySubmit,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Or Using',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 15),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Image.asset(
                            'assets/google_edit.png',
                            fit: BoxFit.cover,
                          ),
                          height: 57,
                          width: 57,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Image.asset(
                            'assets/facebook_edit.png',
                            fit: BoxFit.cover,
                          ),
                          height: 70,
                          width: 70,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Or',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 15),
                  ),

                  FlatButton(
                    child: Text(
                      _isLogin
                          ? 'Create new account'
                          : 'I already have an account',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 15),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
