import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:storyapp/splashScreen.dart';
import 'package:storyapp/login.dart';
import 'package:storyapp/home.dart';

final Color startingColor = Color.fromARGB(255, 133, 30, 62);
final Color endingColor = Color.fromARGB(255, 5, 30, 62);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MaterialApp(
    title: "Story App",
    home: new LaunchScreen(),
  ));
}



class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new LaunchScreen2(),
        body: new Scaffold(
          bottomNavigationBar: new InkWell(
            child: new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [startingColor, endingColor]
                        ),
                    ),
                  ),
                  new Image.asset(
                    'images/logo.png',
                    width: 200,
                    height: 200,
                  ),
                ],
            ),
          ),
        )
    );
  }
}



class LaunchScreen2 extends StatefulWidget {
  @override
  _LaunchScreen2State createState() => _LaunchScreen2State();
}

class _LaunchScreen2State extends State<LaunchScreen2> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: _redirect(),
        body: new Scaffold(
          extendBody: true,
          bottomNavigationBar: new InkWell(
            child: new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [startingColor, endingColor]
                    ),
                  ),
                ),
                new Image.asset(
                  'images/cover.png',
                ),
                new Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: 100),
                  child: new Image.asset(
                        'images/app_name.png',
                        width: 350,
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }

  Widget _redirect() {

      // if shared preference found, return homa, else return login
      return new Login();
  }
  
}


//  Future _writeUser(int userId, String userEmail, int userLoginStatus) async{
//    // obtain shared preferences
//    final prefs = await SharedPreferences.getInstance();
//
//    // set value
//    prefs.setInt('userId', userId);
//    prefs.setString('userEmail', userEmail);
//    prefs.setInt('userLoginStatus', userLoginStatus);
//  }

//  Future _readUser() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//
//    if(prefs.getInt('userId').toString().isNotEmpty){
//      int _userId = (prefs.getInt('userId') ?? -1);
//      String _userEmail = (prefs.getString('userEmail') ?? '');
//      int _userLoginStatus = (prefs.getInt('userLoginStatus') ?? -1);
//
//        data = {'userId':_userId, 'userEmail':_userEmail, 'userLoginStatus':_userLoginStatus};
//
//    }
//
//  }

//Widget _redirect() {
  //if(data['userId'] != -1){
//    if(data != null){
//      if(data['userLoginStatus'] == 1){
//        loggedEmail = data['userEmail'];
//        return new Home();
//      }else if(data['userLoginStatus'] == 0){
//        return new Login();
//      }
//    }else{
//      debugPrint(data.toString());
//      return new Login();
//    }
//}


