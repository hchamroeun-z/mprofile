import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:mprofile/basic_module/color_notifier_provider.dart';
import 'package:mprofile/basic_module/mainscreen.dart';
import 'package:mprofile/basic_module/mealdetail_screen.dart';
import 'theme_notifier_provider.dart';

final colorList=[
  Colors.blue,
  Colors.indigo,
  Colors.teal,
  Colors.cyan,
  Colors.amber,
  Colors.orangeAccent,
  Colors.deepOrange,
  Colors.red,
];

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool dark=ref.watch(themeNotifierProvider);
    int index=ref.watch(colorNotifierProvider);
    
    final seedColor=colorList[index];

    return MaterialApp(
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor)
        ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue,
        brightness: Brightness.dark)),
      debugShowCheckedModeBanner: false,
      // home: Foodscreen(),
      onGenerateRoute: (settings) {
        switch(settings.name){
          case "/":
          // return MaterialPageRoute(builder: (_)=>Foodscreen());
          // return MaterialPageRoute(builder: (_)=>NavScreen());
          return MaterialPageRoute(builder: (_)=>Mainscreen());
          case "/detail":
          return MaterialPageRoute(builder: (_)=>MealdDetailScreen(),settings: settings);
          default:
            return MaterialPageRoute(builder: (_)=>Center(child:Text("No Screen")));
        }
      },
    );
  }
}