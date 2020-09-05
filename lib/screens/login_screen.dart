/*
import 'package:chatapp/screens/singup_screen.dart';
import 'package:chatapp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    final data=MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/chatbot.png'),
              SizedBox(height: 10),

              login_signup_textformfield('UserName', TextInputType.text),
              SizedBox(height: 10),

              login_signup_textformfield('Password', TextInputType.text),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                      'Do not have account?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                      ),
                  ),
                  InkWell(
                      child: new Text('Register',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue
                      ),),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Container(
                height: 55,
                width: data.size.width,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(color: Colors.blue)
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {},
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container(
                height: 55,
                width: data.size.width,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(color: Colors.blue)
                  ),
                  color: Colors.white,
                  textColor: Colors.blue,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {},
                  child: Text(
                    "SignIn with Google",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/


import 'package:chatapp/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    final data=MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/chatbot.png'),
                  SizedBox(
                    height: 10.0,
                  ),

                  InputFieldCard(icon:Icons.person,titype: TextInputType.text,htext: 'Full Name',mdata: data,obscureval: false),
                  InputFieldCard(icon:Icons.lock,titype: TextInputType.visiblePassword,htext: 'Password',mdata: data,obscureval: true),

                  SizedBox(height:20.0),

                  Button(data, 'SignIn'),
                  SizedBox(height:20.0),
                  Button(data,'SignIn with Google')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
