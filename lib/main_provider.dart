import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{

  MainProvider(BuildContext context){
    getPermission;
  }
  getPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      //no permission of local notification
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  showNotification(){
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 123,
          channelKey: 'basic',
          title: 'Welcome',
          body: 'A simple notification is from Flutter App',
        )
    );
  }
}