import 'dart:async';
import 'dart:io';


import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

final _tokenStreamController = new StreamController<String>.broadcast();
final _mensajesStreamController = new StreamController<String>.broadcast();
Stream<String> get mensajes => _mensajesStreamController.stream;
Stream<String> get tokens => _tokenStreamController.stream;
FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

initNotifications(){

  _firebaseMessaging.requestNotificationPermissions();

  _firebaseMessaging.getToken().then((token){

print('=========== FCM token ===========');

_tokenStreamController.add(token);
print(token);
// ccntcZL5xmE:APA91bFUkwx63fzGWKp0L0DS0TtdV32nhVWkLcCXHfyiZd1c3edopZLT5fwfbx8xDWY27jwrOPE8LW-LDhomZdKLVYxF_xTMf2zX8tcG_8CxE4_27NXxwvh6J4wwA-MgEdWLn6mTZOFw
  });
  _firebaseMessaging.configure(

onMessage : (info)async{
  print('=========== onMessage ===========');
print(info);

String argumento ='no-data';

if(Platform.isAndroid){
argumento = info['data']['comida']?? 'no-data';
}
 _mensajesStreamController.sink.add(argumento);
},
onLaunch: (info) async {
  print('=========== onLaunch ===========');
  print(info);
 
},
onResume: (info) async{
  print('=========== onResume ===========');
  print(info);


  final noti = info['data']['comida'];
final nomb =info['data']['nombre']; 
print(')()())(()))))))))))))))(())(())(((((((((((()))))))))))');
print('comida:'+noti +'nombre:'+nomb);


_mensajesStreamController.sink.add(nomb);

}


  );
}


dispose(){
  _mensajesStreamController?.close();
  _tokenStreamController?.close();
}

}
