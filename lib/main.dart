import 'package:flutter/material.dart';
import 'package:avmilvil_p2/views/main_view.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'P2 IHM',
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}