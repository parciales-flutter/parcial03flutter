import 'package:flutter/material.dart';
import 'package:parcial3/paginas/home.dart';

void main() {
  runApp(Marvel());
}

class Marvel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(),
    debugShowCheckedModeBanner: false,);
  }
}

