
import 'package:flutter/material.dart';
import 'package:push_notifications/src/providers/push_notifications_provider.dart';

class HomePage extends StatelessWidget {
  @override
   final pushProvider = new  PushNotificationProvider();
 
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text('Home Page'),
      ) ,
      body: Center(child: Text('Hola Mundo'),),
    );
  }
}