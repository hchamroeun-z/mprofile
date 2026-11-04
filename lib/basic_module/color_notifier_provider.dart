import 'package:flutter_riverpod/legacy.dart';

class _ColorNotifier extends StateNotifier<int>{
  _ColorNotifier():super(0);

  void changeColorIndex(int value){
    state=value;
  }
}

final colorNotifierProvider=StateNotifierProvider<_ColorNotifier,int>((ref){
return _ColorNotifier();
}
  
);