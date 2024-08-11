import 'package:flutter/material.dart';
import 'notification_page.dart'; // Import NotificationPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget _currentBody = const NotificationPage();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _currentBody = const NotificationPage();
          break;
        case 1:
          _currentBody = Center(child: Text('Request Page'));
          break;
        case 2:
          break;
        case 3:
          _currentBody = Center(child: Text('Settings Page'));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
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
                  'assets/images/profile.png',
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
      body: _currentBody,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 10),
            _buildBottomNavItem(
              assetName: 'assets/icons/home.png',
              label: 'Home',
              index: 0,
            ),
            SizedBox(width: 20),
            _buildBottomNavItem(
              assetName: 'assets/icons/task-square.png',
              label: 'Request',
              index: 1,
            ),
            SizedBox(width: 10),
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
              assetName: 'assets/icons/percentage-square.png',
              label: 'Attendance',
              index: 2,
            ),
            SizedBox(width: 5),
            _buildBottomNavItem(
              assetName: 'assets/icons/notification.png',
              label: 'Notification',
              index: 3,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
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
}
