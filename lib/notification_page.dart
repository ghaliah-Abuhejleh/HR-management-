import 'package:flutter/material.dart';
import 'notification_card.dart'; // Ensure you have this file

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final notifications = [
      {
        'title': "Points and Awards",
        'description': "55 points were credited to you as manager recognition.",
        'additionalInfo': "Today 10:30 AM 20 Dec. 2023",
        'image': 'assets/images/award.png',
      },
      {
        'title': "Check Out the Poll Outcome",
        'description': "The results of the last poll have appeared, you can take a look!",
        'additionalInfo': "Yesterday 14:00 PM 19 Dec. 2023",
        'image': 'assets/images/tick-circle.png',
      },
      {
        'title': "Performance Review Reminder",
        'description': "This is a reminder that your performance review is scheduled for 19 Dec. 2023.",
        'additionalInfo': "Yesterday 11:00 AM 19 Dec. 2023",
        'image': 'assets/images/task.png',
      },
      {
        'title': "New UX/UI Design Training Available!",
        'description': "Great news! Improve your UX/UI skills with our latest training.",
        'additionalInfo': "Monday 11:30 AM 17 Dec. 2023",
        'image': 'assets/images/award.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Your Notifications",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          "${notifications.length}", // Update to dynamic count
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "unread",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationCard(
                    title: notification['title']!,
                    description: notification['description']!,
                    additionalInfo: notification['additionalInfo']!,
                    image: Image.asset(notification['image']!),
                    borderColor: theme.colorScheme.primary,
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                // Clear Notification action
              },
              child: Text(
                "Clear Notification",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
