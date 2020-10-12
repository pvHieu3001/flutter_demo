import 'package:flutter/material.dart';

import 'src/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)=> MaterialApp(
    home: HomePage(),
    routes: Map.fromEntries(demos.map((d) => MapEntry(d.route, d.builder))),
  );

} 

