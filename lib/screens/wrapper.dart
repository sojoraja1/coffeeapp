import 'package:flutter/material.dart';
import 'package:latest/screens/authentication/authentication.dart';
import 'package:provider/provider.dart';
import 'package:latest/models/user.dart';

import 'package:latest/screens/home/home.dart';
class Mywrapper extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user==null) {

      return Authentication();


      
    }else{
      return Home();
    }

  }
}