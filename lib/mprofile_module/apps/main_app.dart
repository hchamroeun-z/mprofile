import 'package:flutter/material.dart';
import 'package:mprofile/mprofile_module/screens/bus_search.dart';
import 'package:mprofile/mprofile_module/screens/main_screen.dart';
import 'package:mprofile/mprofile_module/screens/search_result_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: DashboardScreen(),
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