import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/basic_module/myapp.dart';
import 'package:mprofile/mprofile_module/apps/main_app.dart';

void main() {
  // runApp(ProviderScope(child: MyApp()) );
  runApp(ProviderScope(child: MainApp()));
}

