import 'package:flutter/material.dart';
import 'package:latest/models/user.dart';
import 'package:latest/screens/services/auth.dart';
import 'package:latest/screens/wrapper.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(value: Authservice().user,
    child: MaterialApp(
      title: 'Material App',
      home: Mywrapper(),
    ),);
  }
}