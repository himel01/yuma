import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{

  MainProvider(BuildContext context){
    getPermission;
  }
  getPermission() async {
    // AwesomeNotifications().setListeners(
    //     onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
    //     onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
    //     onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
    //     onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    // );
    bool isallowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isallowed) {
      //no permission of local notification
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  showNotification(){
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 123,
          channelKey: 'basic', //set configuration wuth key "basic"
          title: 'Welcome',
          body: 'A simple notification is from Flutter App',
        )
    );
  }
}