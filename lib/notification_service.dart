import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  //* initialize
  Future<void> initNotification() async {
    final androidSettings = AndroidInitializationSettings(
      // '@mipmap-hdpi/ic_launcher.png',
      '@mipmap/ic_launcher.png',
    );

    final iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await notificationsPlugin.initialize(settings: initSettings);
  }

  NotificationDetails notificationDetails() {
    final androidNotificationDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Channel',
      priority: Priority.max,
      importance: Importance.high,
    );

    final iosNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  Future<void> showNotifications({int id = 0, String? title, String? body}) {
    return notificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: notificationDetails(),
    );
  }

  Future<void> cancelNotification(int id) {
    return notificationsPlugin.cancel(id: id);
  }

  Future<void> cancelAllNotifications() {
    return notificationsPlugin.cancelAll();
  }
}
