import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyapp/home.dart';

import 'package:storyapp/main.dart';
import 'package:storyapp/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Login',
          style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 133, 30, 62),
      ),
      body: new ListView(
          padding: const EdgeInsets.only(top: 80, bottom: 50, left: 40, right: 40),
          children: <Widget>[
            new Container(
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _emailController,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.email),
                      hintText: 'Email',
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(5)),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.lock),
                      hintText: 'Password',
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(2)),
                  new FlatButton(
                      onPressed: (){},
                      child: new Text("Fogot Password?")
                  ),
                  new Padding(padding: const EdgeInsets.all(5)),
                  new RaisedButton(
                    onPressed: _navigateHome,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: startingColor, width: 1),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    child: new Text(
                      'Login',
                      style: new TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54
                      ),
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10)),
                  new ListTile(
                    title: new Text(
                      'Or',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10)),
                  new RaisedButton(
                    onPressed: (){},
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: startingColor, width: 1),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          'Continue with Google',
                           style: new TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.w900,
                             color: Colors.black54
                           ),
                        ),
                        new Padding(padding: const EdgeInsets.only(left: 30)),
                        new Image.asset(
                          'images/google.png',
                          width: 50,
                          height: 50,

                        )
                      ],
                    )
                  ),
                  new Padding(padding: const EdgeInsets.all(10)),
                  new RaisedButton(
                    onPressed: (){},
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: startingColor, width: 1),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          'Continue with Facebook',
                          style: new TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black54
                          ),
                        ),
                        new Padding(padding: const EdgeInsets.only(left: 30)),
                        new Image.asset(
                          'images/facebook.png',
                          width: 50,
                          height: 50,

                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(10)),

          ],
      ),
      bottomNavigationBar: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(padding: const EdgeInsets.only(bottom: 100)),
            new Text("Don't have an acoount?"),
            new FlatButton(
                onPressed: _navigateSignUp,
                child: new Text("Create Account")
            )
          ],
        ),
    );
  }

  void _navigateSignUp(){
    var router = new MaterialPageRoute(
        builder: (BuildContext context){
          return new SignUp();
        }
    );
    Navigator.of(context).push(router);
  }

  void _navigateHome(){
    var router = new MaterialPageRoute(
        builder: (BuildContext context){
          return new Home();
        }
    );
    Navigator.of(context).push(router);
  }

  Future _writeUser(int userId, String userEmail, int userLoginStatus) async{
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

    // set value
    prefs.setInt('userId', userId);
    prefs.setString('userEmail', userEmail);
    prefs.setInt('userLoginStatus', userLoginStatus);
  }

//  void _login(){
//    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
//      _writeUser(1, _emailController.text, 1);
//      _navigateHome();
//    }
//  }

}