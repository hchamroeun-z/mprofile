import 'package:flutter_riverpod/legacy.dart';

class _ThemeNotifier extends StateNotifier<bool>{
  _ThemeNotifier(): super(false);

  void toggleDark(){
    state = !state;
  }
}

final themeNotifierProvider = StateNotifierProvider<_ThemeNotifier, bool> ((ref){
  return _ThemeNotifier();
});
