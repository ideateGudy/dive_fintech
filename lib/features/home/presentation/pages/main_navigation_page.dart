import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/app_navigation.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/navigation/app_router.dart';

class MainNavigationPage extends StatefulWidget {
  final Widget child;

  const MainNavigationPage({
    super.key,
    required this.child,
  });

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<AppBottomNavItem> _navItems = [
    const AppBottomNavItem(
      label: AppStrings.home,
      activeIcon: Icons.home,
      inactiveIcon: Icons.home_outlined,
    ),
    const AppBottomNavItem(
      label: AppStrings.search,
      activeIcon: Icons.search,
      inactiveIcon: Icons.search_outlined,
    ),
    const AppBottomNavItem(
      label: AppStrings.messages,
      activeIcon: Icons.message,
      inactiveIcon: Icons.message_outlined,
    ),
    const AppBottomNavItem(
      label: AppStrings.settings,
      activeIcon: Icons.settings,
      inactiveIcon: Icons.settings_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        items: _navItems,
        onTap: _onNavItemTapped,
      ),
    );
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        context.go(AppRoutes.home);
        break;
      case 1:
        context.go(AppRoutes.search);
        break;
      case 2:
        context.go(AppRoutes.messages);
        break;
      case 3:
        context.go(AppRoutes.settings);
        break;
    }
  }
}