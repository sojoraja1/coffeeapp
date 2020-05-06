import 'package:flutter/material.dart';
import 'package:latest/screens/authentication/register.dart';
import 'package:latest/screens/authentication/signin.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool toogleBetweenSignandRegister = true;
  void toggle(){

    setState(() {
          toogleBetweenSignandRegister =!toogleBetweenSignandRegister;
    });
  }
  @override
  Widget build(BuildContext context) {
    
   if (toogleBetweenSignandRegister) {

    return Container(
      color: Colors.blue,

      child: SignIn(changeToogle:toggle,),

      
      
    );
      
    }else{
    return Container(

      child: Register(changeToogle:toggle),

      
      
    );
    }
  }
}
