import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/ui/home/home_screen.dart';
import 'package:flutter_social_ui/ui/login/widgets/curve_clipper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: CurveClipper(),
                child: Image(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.5,
                  image: AssetImage("assets/images/login_background.jpg"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "FRENZY",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: CupertinoButton(
                  color: Theme.of(context).primaryColor,
                  pressedOpacity: 0.4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Text("Login"),
                  ),
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (_)=> HomeScreen()
                  )),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 80,
                      alignment: Alignment.center,
                      decoration:
                          BoxDecoration(color: Theme.of(context).primaryColor),
                      child: Text(
                        "Don't you hvae an account? Signup",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
