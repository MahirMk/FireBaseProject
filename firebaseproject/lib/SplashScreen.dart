import 'package:firebaseproject/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  open() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Navigator.of(context).pop();
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>HomePage())
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 4000), () {
      open();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("img/download.jpg"),
      ),
    );
  }
}
