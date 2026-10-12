import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/screens/home_screen.dart';
import '../../diagnose/screens/diagnose_screen.dart';
import '../../history/screens/history_screen.dart';
import '../../experts/screens/experts_screen.dart';
import '../../profile/screens/profile_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens = [
    HomeScreen(onSelectTab: _selectTab),
    const DiagnoseScreen(),
    const HistoryScreen(),
    const ExpertsScreen(),
    const ProfileScreen(),
  ];

  void _selectTab(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final navBgColor = isDark ? AppColors.background : Colors.white;
    final unselectedColor = isDark ? AppColors.textSecondary : Colors.grey;

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: navBgColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: unselectedColor,
          currentIndex: _currentIndex,
          onTap: _selectTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Diagnose',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: 'Experts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
