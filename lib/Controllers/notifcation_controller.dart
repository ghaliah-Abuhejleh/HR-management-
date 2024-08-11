import 'package:flutter/material.dart';
import '../Models/notification_model.dart';

class NotificationController extends ChangeNotifier {
  List<NotificationModel> _notifications = [
    NotificationModel(
      title: "Points and Awards",
      description: "55 points were credited to you as manager recognition.",
      additionalInfo: "Today 10:30 AM 20 Dec. 2023",
      image: 'assets/images/award.png',
    ),
    NotificationModel(
      title: "Check Out the Poll Outcome",
      description: "The results of the last poll have appeared, you can take a look!",
      additionalInfo: "Yesterday 14:00 PM 19 Dec. 2023",
      image: 'assets/images/tick-circle.png',
    ),
    NotificationModel(
      title: "Performance Review Reminder",
      description: "This is a reminder that your performance review is scheduled for 19 Dec. 2023.",
      additionalInfo: "Yesterday 11:00 AM 19 Dec. 2023",
      image: 'assets/images/task.png',
    ),
    NotificationModel(
      title: "New UX/UI Design Training Available!",
      description: "Great news! Improve your UX/UI skills with our latest training.",
      additionalInfo: "Monday 11:30 AM 17 Dec. 2023",
      image: 'assets/images/award.png',
    ),

  ];

  List<NotificationModel> get notifications => _notifications;


}
