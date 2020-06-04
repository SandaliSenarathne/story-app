import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyapp/main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Sign Up',
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
        padding: const EdgeInsets.only(top: 100, bottom: 50, left: 40, right: 40),
        children: <Widget>[
          new Container(
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _emailController,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.person),
                      hintText: 'Nickname',
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(5)),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.email),
                      hintText: 'Email',
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10)),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.lock),
                      hintText: 'Password',
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10)),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      icon: new Icon(Icons.lock),
                      hintText: 'Re-enter Password',
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(50)),
                  new RaisedButton(
                    onPressed: (){},
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: startingColor, width: 1),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    child: new Text(
                      'Sign Up',
                      style: new TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.black54
                      ),
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10)),
                ],
              )
          ),
        ],
      ),

    );
  }
}