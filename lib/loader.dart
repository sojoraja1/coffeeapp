import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
),
      
    );
  }
}