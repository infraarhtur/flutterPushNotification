import 'package:flutter/material.dart';
import 'package:push_notifications/src/pages/home_page.dart';
import 'package:push_notifications/src/pages/mensaje_page.dart';
import 'package:push_notifications/src/providers/push_notifications_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState>navigatorKey = new GlobalKey<NavigatorState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   final pushProvider = new  PushNotificationProvider();
   pushProvider.initNotifications();

   pushProvider.mensajes.listen((data) {
//Navigator.pushNamed(context, 'mensaje');
 print( '&&&&&&&&&&&&&&&&&&&&&&&&&&&&& argumento &&&&&&&&&&&&&&&&&&&&&&&');
 print( data);
 navigatorKey.currentState.pushNamed('mensaje', arguments:data );
   });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'push local;',
     initialRoute: 'home',
     routes: {
       'mensaje':(BuildContext context) => MensajePage(),
       'home':(BuildContext context) => HomePage(),
     },
    );
  }
}