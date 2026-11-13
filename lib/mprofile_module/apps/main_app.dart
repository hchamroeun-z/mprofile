import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mprofile/basic_module/color_notifier_provider.dart';
import 'package:mprofile/basic_module/theme_notifier_provider.dart';
import 'package:mprofile/mprofile_module/screens/bus_search.dart';
import 'package:mprofile/mprofile_module/screens/main_screen.dart';
import 'package:mprofile/mprofile_module/screens/search_result_screen.dart';

final multiColorList=[
  Colors.blue,
  Colors.indigo,
  Colors.teal,
  Colors.cyan,
  Colors.amber,
  Colors.orangeAccent,
  Colors.deepOrange,
  Colors.red,
];

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool dark=ref.watch(themeNotifierProvider);
    int index=ref.watch(colorNotifierProvider);
    final seedColor=multiColorList[index];
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

      onGenerateRoute: (settings) {
        switch(settings.name){
          case "/":
          return MaterialPageRoute(builder: (_)=>MainScreen());
          case "/bussearch":
          return MaterialPageRoute(builder: (_)=>BusSearch(),settings: settings);
          case "/searchresult":
          return MaterialPageRoute(builder: (_)=>BusSearchResultsScreen(),settings: settings);
          default:
            return MaterialPageRoute(builder: (_)=>Center(child:Text("No Screen")));
        }
      },
    );
  }
}