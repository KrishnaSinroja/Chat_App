/*
import 'package:chatapp/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {

    final data= MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Text('Chat App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/chatbot.png'),

            login_signup_textformfield('UserName', TextInputType.text),
            SizedBox(height: 20),
            login_signup_textformfield('Email', TextInputType.text),
            SizedBox(height: 20),
            login_signup_textformfield('Password', TextInputType.text),
            SizedBox(height: 20),
            login_signup_textformfield('Confirm Password', TextInputType.text),
            SizedBox(height: 20),

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
          ],
        ),
      ),
    );;
  }
}
*/

import 'dart:js';

import 'package:chatapp/services/auth.dart';
import 'package:chatapp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';



class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

const Color primarycolor=Colors.blue;
final formkey=GlobalKey<FormState>();
final GlobalKey<NavigatorState> navigatorKey =
new GlobalKey<NavigatorState>();


TextEditingController tecUserName=new TextEditingController();
TextEditingController tecEmail=new TextEditingController();
TextEditingController tecPassword=new TextEditingController();
TextEditingController tecConfirmPassword=new TextEditingController();

AuthMethods authMethods=new AuthMethods();

signMeUp() {
  if(formkey.currentState.validate()){
    authMethods.signUpWithEmailAndPassword(tecEmail.text, tecPassword.text).then((val){
      print("$val");
      //navigatorKey.currentState.pushNamed('Login');
    });
  }
}


class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {

    final data= MediaQuery.of(context);






    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: data.size.height,
        width: data.size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
            child: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/chatbot.png'),
                      SizedBox(
                        height: 10.0,
                      ),

                      InputFieldCard(icon:Icons.person,titype: TextInputType.text,htext: 'Userame',mdata:data,controller: tecUserName,obscureval: false,validmsg: 'Please enter valid Username '),
                      InputFieldCard(icon:Icons.email,titype: TextInputType.emailAddress,htext: 'Email Address',mdata:data,controller: tecEmail,obscureval: false,validmsg: 'Please enter valid Email '),
                      InputFieldCard(icon:Icons.lock,titype: TextInputType.visiblePassword,htext: 'Password',mdata:data,controller: tecPassword,obscureval: true,validmsg: 'Please enter valid Password'),
                      InputFieldCard(icon:Icons.lock,titype: TextInputType.visiblePassword,htext: 'Confirm Password',mdata:data,controller: tecConfirmPassword,obscureval: true,validmsg: 'Password does not matching with above'),
                      SizedBox(
                        height:10.0 ,
                      ),


                      Button(data, 'SignUp'),
                      SizedBox(height:10.0 ),

                      Text(
                        'Already Registerd??',
                        style: TextStyle(
                          fontSize: 19.0,
                          color: primarycolor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height:10.0 ,
                      ),
                      InkWell(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: primarycolor,
                              fontWeight: FontWeight.w700,
                              fontSize: 19.0,
                              decoration: TextDecoration.underline
                          ),
                        ),
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


