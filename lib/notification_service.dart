import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  NotificationService._();
  static final notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {
    initializeTimeZones();

    setLocalLocation(getLocation('Africa/Lagos'));

    final androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
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

 static NotificationDetails notificationDetails() {
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

  static Future<void> showInstantNotifications({
    int id = 0,
    String? title,
    String? body,
  }) {
    return notificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: notificationDetails(),
    );
  }

  static Future<void> scheduleReminder({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    final now = TZDateTime.now(local);
    final scheduledDate = TZDateTime(
      local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    await notificationsPlugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      notificationDetails: notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> cancelNotification(int id) {
    return notificationsPlugin.cancel(id: id);
  }

  static Future<void> cancelAllNotifications() {
    return notificationsPlugin.cancelAll();
  }
}

// class NotificationService {
//   final notificationsPlugin = FlutterLocalNotificationsPlugin();
//   //* initialize
//   Future<void> initNotification() async {
//     initializeTimeZones();
//     final currentTimezone = FlutterTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(currentTimezone));

//     final androidSettings = AndroidInitializationSettings(
//       // '@mipmap-hdpi/ic_launcher.png',
//       '@mipmap/ic_launcher.png',
//     );

//     final iosSettings = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );

//     final initSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );

//     await notificationsPlugin.initialize(settings: initSettings);
//   }

//   NotificationDetails notificationDetails() {
//     final androidNotificationDetails = AndroidNotificationDetails(
//       'default_channel',
//       'Default Channel',
//       priority: Priority.max,
//       importance: Importance.high,
//     );

//     final iosNotificationDetails = DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     return NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iosNotificationDetails,
//     );
//   }

//   Future<void> showInstantNotifications({
//     int id = 0,
//     String? title,
//     String? body,
//   }) {
//     return notificationsPlugin.show(
//       id: id,
//       title: title,
//       body: body,
//       notificationDetails: notificationDetails(),
//     );
//   }

//   Future<void> scheduleReminder({
//     required int id,
//     required String title,
//     required String body,
//     required int hour,
//     required int minute,
//   }) async {
//     final now = tz.TZDateTime.now(tz.local);
//     final scheduledDate = tz.TZDateTime(
//       tz.local,
//       now.year,
//       now.month,
//       now.day,
//       hour,
//       minute,
//     );

//     await notificationsPlugin.zonedSchedule(
//       id: id,
//       title: title,
//       body: body,
//       scheduledDate: scheduledDate,
//       notificationDetails: notificationDetails(),
//       androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }
//   // Future<void> scheduleReminder({
//   //   required int id,
//   //   required String title,
//   //   String? body,
//   // }) async {
//   //   final now = TZDateTime.now(local);
//   //   final scheduledDate = now.add(Duration(seconds: 3));

//   //   await notificationsPlugin.zonedSchedule(
//   //     id: id,
//   //     scheduledDate: scheduledDate,
//   //     notificationDetails: notificationDetails(),
//   //     androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
//   //     matchDateTimeComponents: DateTimeComponents.time
//   //   );
//   // }

//   Future<void> cancelNotification(int id) {
//     return notificationsPlugin.cancel(id: id);
//   }

//   Future<void> cancelAllNotifications() {
//     return notificationsPlugin.cancelAll();
//   }
// }
