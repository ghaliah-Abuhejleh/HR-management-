// lib/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controllers/bottom_navigation_controller.dart';
import 'notification_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavController(),
      child: Consumer<BottomNavController>(
        builder: (context, bottomNavController, child) {
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
            body: _getCurrentBody(bottomNavController.selectedIndex),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 10),
                  _buildBottomNavItem(
                    context,
                    assetName: 'assets/icons/home.png',
                    label: 'Home',
                    index: 0,
                  ),
                  SizedBox(width: 20),
                  _buildBottomNavItem(
                    context,
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
                    context,
                    assetName: 'assets/icons/percentage-square.png',
                    label: 'Attendance',
                    index: 2,
                  ),
                  SizedBox(width: 5),
                  _buildBottomNavItem(
                    context,
                    assetName: 'assets/icons/notification.png',
                    label: 'Notification',
                    index: 3,
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          );
        },
      ),
    );
  }

  Widget _buildBottomNavItem(
      BuildContext context, {
        required String assetName,
        required String label,
        required int index,
      }) {
    final theme = Theme.of(context);
    final bottomNavController = Provider.of<BottomNavController>(context, listen: false);
    final isSelected = bottomNavController.selectedIndex == index;

    return GestureDetector(
      onTap: () => bottomNavController.selectIndex(index),
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

  Widget _getCurrentBody(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return Center(child: Text('Home Page'));
      case 1:
        return Center(child: Text('Request Page'));
      case 2:
        return Center(child: Text('Attendance Page'));
      case 3:
        return const NotificationPage();;
      default:
        return const NotificationPage();
    }
  }
}
