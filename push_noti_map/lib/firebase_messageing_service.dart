import 'package:firebase_messaging/firebase_messaging.dart';
class FirebaseMessagingService{

 final FirebaseMessaging  _firebaseMessaging =  FirebaseMessaging.instance;
 Future<void> requestPermission() async{
   _firebaseMessaging.requestPermission(
     sound: true,
     alert: true,
     announcement: false,
     carPlay: false,
     criticalAlert: false,
     provisional: false
   );
 }

 Future<void> initialize() async {
   await requestPermission();
   FirebaseMessaging.onMessage.listen((event) {
    print(event.notification?.title);
    print(event.notification?.body);
    print(event.data);

   });

   FirebaseMessaging.onMessageOpenedApp.listen((event) {

   });

   FirebaseMessaging.onBackgroundMessage(handelBackgroundNotification);
 }
}

Future<void> handelBackgroundNotification(RemoteMessage message) async {}