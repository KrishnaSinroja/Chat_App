import 'package:chatapp/screens/singup_screen.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}


class _SearchState extends State<Search> {


  DatabaseMethods databaseMethods=new DatabaseMethods();
  TextEditingController tecSearch = new TextEditingController();
  QuerySnapshot searchSnapShot;

  initiateSearch(){
    databaseMethods.getUserByUsername(tecUserName.text).then(
            (val){
            setState(() {
              searchSnapShot=val;
            });
     });
  }



  Widget searchList(){
    return searchSnapShot !=null ? ListView.builder(

        itemCount: searchSnapShot.documents.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return SearchTile(
            userName: searchSnapShot.documents[index].data["username"],
            );
        }) : Container();
  }

  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Contacts'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  borderOnForeground: false,
                  child: Container(
                    width: data.size.width,
                    child: ListTile(
                      title: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: tecSearch,
                        decoration: InputDecoration(
                          hintText: 'Search User',
                          hintStyle: TextStyle(color: Colors.blue),
                          contentPadding: EdgeInsets.all(12),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none
                        ),
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: (){
                          initiateSearch();
                          },
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
          searchList(),
        ],
      ),
    );
  }
}

class SearchTile extends StatelessWidget {

  final String userName;
  SearchTile({this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0)
        ),
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[800],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    child: Icon(
                      Icons.message,
                      color: Colors.blue[800],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


