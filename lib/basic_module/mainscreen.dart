import 'package:flutter/material.dart';
import 'package:mprofile/basic_module/foodscreen.dart';
import 'package:mprofile/basic_module/myhome.dart';
import 'package:mprofile/basic_module/settingscreen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activeColor =Theme.of(context).colorScheme.onTertiaryContainer;
    final inActiveColor=Theme.of(context).colorScheme.onPrimary;

    return PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: Foodscreen(),
            item: ItemConfig(
              icon: Icon(Icons.home),
              title: "Home",
              activeForegroundColor: activeColor,
              inactiveForegroundColor: inActiveColor,
            ),
          ),
          PersistentTabConfig(
            screen: MyHomePage(),
            item: ItemConfig(
              icon: Icon(Icons.message),
              title: "Messages",
              activeForegroundColor: activeColor,
              inactiveForegroundColor: inActiveColor,
            
            ),
          ),
          PersistentTabConfig(
            screen: SettingsScreen(),
            item: ItemConfig(
              icon: Icon(Icons.settings),
              title: "Settings",
              activeForegroundColor: activeColor,
              inactiveForegroundColor: inActiveColor,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style6BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
        ),
    
    );
  }
}