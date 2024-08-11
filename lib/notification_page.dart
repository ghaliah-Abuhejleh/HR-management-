import 'package:flutter/material.dart';
import 'notification_card.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        break;
      case 2:
        Navigator.pushNamed(context, '/profile');
        break;
      case 3:
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }


  Widget _buildBottomNavItem({
    required String assetName,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            assetName,
            width: 24,
            height: 24,
            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.secondary,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? theme.colorScheme.primary : theme.colorScheme.secondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Check in",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: 14,
              ),
            ),
            Text(
              "09:00 AM",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: theme.iconTheme.color),
            onPressed: () {},
          ),
          SizedBox(width: 16),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF0A9952),
                width: 2.0,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Color(0xFF2e3e4e),
              radius: 18,
              child: ClipOval(
                child: Image.asset(
                  'images/profile.png',
                  width: 32,
                  height: 32,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
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
                          "2",
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
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  NotificationCard(
                    title: "Points and Awards",
                    description: "55 points were credited to you as manager recognition.",
                    additionalInfo: "Today 10:30 AM 20 Dec. 2023",
                    image: Image.asset('images/award.png'),
                    borderColor: theme.colorScheme.primary,
                  ),
                  NotificationCard(
                    title: "Check Out the Poll Outcome",
                    description: "The results of the last poll have appeared, you can take a look!",
                    additionalInfo: "Yesterday 14:00 PM 19 Dec. 2023",
                    image: Image.asset('images/tick-circle.png'),
                    borderColor: theme.colorScheme.primary,
                  ),
                  NotificationCard(
                    title: "Performance Review Reminder",
                    description: "This is a reminder that your performance review is scheduled for 19 Dec. 2023.",
                    additionalInfo: "Yesterday 11:00 AM 19 Dec. 2023",
                    image: Image.asset('images/task.png'),
                    borderColor: theme.colorScheme.primary,
                  ),
                  NotificationCard(
                    title: "New UX/UI Design Training Available!",
                    description: "Great news! Improve your UX/UI skills with our latest training.",
                    additionalInfo: "Monday 11:30 AM 17 Dec. 2023",
                    image: Image.asset('images/award.png'),
                    borderColor: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {

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
      bottomNavigationBar: BottomAppBar(

        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width:10),
            _buildBottomNavItem(
              assetName: 'images/icons/home.png',
              label: 'Home',
              index: 0,
            ),
            SizedBox(width:20),
            _buildBottomNavItem(
              assetName: 'images/icons/task-square.png',
              label: 'Request',
              index: 1,
            ),
             SizedBox(width:10),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.add, color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                shape: const CircleBorder(),
                padding: EdgeInsets.all(15),
              ),
            ),
            _buildBottomNavItem(
              assetName: 'images/icons/percentage-square.png',
              label: 'Attendance',
              index: 2,
            ), SizedBox(width:5),
            _buildBottomNavItem(
              assetName: 'images/icons/notification.png',
              label: 'Notification',
              index: 3,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
