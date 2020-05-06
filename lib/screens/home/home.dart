import 'package:flutter/material.dart';
import 'package:latest/screens/services/auth.dart';

class Home extends StatelessWidget {
final Authservice auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      actions: <Widget>[

        FlatButton.icon(onPressed: ()async{
        
try {

  
        return await auth.signout();
  
} catch (e) {

  print(e.toString());
  return null;
}




        }, icon:Icon(Icons.person),label: Text("Logout"),),
      ],
      ),


    );
  }
}