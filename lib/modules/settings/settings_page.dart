import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class SettingPage extends StatelessWidget {
  
  

  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
                    U.AppBar(havElevation: false,),
                    U.Text('My profile',fontSize: U.TextSize.s34,
                    weight: U.TextWeight.bold,),
                    
        ],
      ) ,
    );
  }
}