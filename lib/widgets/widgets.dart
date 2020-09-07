import 'package:flutter/material.dart';
import 'package:chatapp/screens/singup_screen.dart';

Card InputFieldCard({IconData icon,TextInputType titype,String htext,MediaQueryData mdata,
  TextEditingController controller,bool obscureval, String validmsg}){
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0)
    ),
    borderOnForeground: false,
    child: Container(
      width: mdata.size.width,
      child: ListTile(

        title: TextFormField(

          keyboardType: titype,
          controller: controller,
          obscureText: obscureval,
          validator: (val){
            return val.isEmpty ? validmsg : null;
          },
          decoration: InputDecoration(
            hintText: htext,
            hintStyle: TextStyle(color: Colors.blue),
            contentPadding: EdgeInsets.all(12),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    ),
  );
}


Container Button(MediaQueryData data, String label){
  return Container(
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
        label,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    ),
  );
}

