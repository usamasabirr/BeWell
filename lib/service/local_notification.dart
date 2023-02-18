import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_stat_healing');

    final InitializationSettings settings =
        InitializationSettings(android: androidInitializationSettings);

    await _localNotificationService.initialize(settings);
  }

  Future<NotificationDetails> _notificationDetails() async {
    tz.initializeTimeZones();
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true);

    return NotificationDetails(android: androidNotificationDetails);
  }

  Future<void> showScheduleNotification(
      {required int id,
      required String title,
      required String body,
      required int seconds}) async {
    final details = await _notificationDetails();
    var zone = tz.getLocation('Asia/Karachi');
    await _localNotificationService.zonedSchedule(
        id,
        title,
        body,
        // tz.TZDateTime.from(
        //     DateTime.now().add(Duration(seconds: seconds)), zone),
        tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
        details,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelScheduledNotification(id) async {
    await _localNotificationService.cancel(id);
  }
}
