//universal files
import 'package:flutter/material.dart';

//my files
import './login_presenter.dart';
import '../../models/user.dart';
import '../../data/db_helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;
  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: Text('Login'),
      color: Colors.green,
    );
    var loginForm = Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Image.asset('assets/generic_logo.png'),
            Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field can\'t be blank';
                          }
                        },
                        onSaved: (value) => _username = value,
                        decoration: InputDecoration(labelText: 'Username'),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field can\'t be blank';
                          }
                        },
                        onSaved: (value) => _password = value,
                        decoration: InputDecoration(labelText: 'Password'),
                      )),
                ],
              ),
            ),
            loginBtn,
          ],
        ));
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        key: scaffoldKey,
        body: Container(
            child: Center(
          child: loginForm,
        )));
  }

  @override
  void onLoginSuccess(User user) async {
    setState(() {
      _isLoading = false;
    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    Navigator.of(context).pushNamed('/home');
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }
}
