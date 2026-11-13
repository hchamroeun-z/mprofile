import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mprofile/mprofile_module/screens/booking_screen.dart';
import 'package:mprofile/mprofile_module/screens/inbox_screen.dart';
import 'package:mprofile/mprofile_module/screens/profile_screen.dart';
import 'package:mprofile/mprofile_module/screens/setting_screen.dart';
import 'package:mprofile/mprofile_module/screens/dashboard_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activeColor =Theme.of(context).colorScheme.onTertiaryContainer;
    final inActiveColor=Theme.of(context).colorScheme.onPrimary;
    
    return PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: DashboardScreen(),
            item: ItemConfig(
              icon: Icon(Icons.home),
              title: "Home",
              activeForegroundColor: activeColor,
              inactiveForegroundColor: inActiveColor,
            ),
          ),
          PersistentTabConfig(
            screen: BookingsScreen(),
            item: ItemConfig(
              icon: Icon(Icons.directions_bus),
              title: "Bookings",
              activeForegroundColor: activeColor,
              inactiveForegroundColor: inActiveColor,
            
            ),
          ),
          PersistentTabConfig(
            screen: InboxScreen(),
            item: ItemConfig(
              icon: Icon(Icons.inbox),
              title: "Inbox",
              activeForegroundColor: activeColor,
              inactiveForegroundColor: inActiveColor,
            
            ),
          ),
          PersistentTabConfig(
            screen: SettingScreen(),
            item: ItemConfig(
              icon: Icon(Icons.settings),
              title: "Settings",
              activeForegroundColor: activeColor,
              inactiveForegroundColor: inActiveColor,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            // color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
        ),
    
    );
  }
}