import 'package:flutter_riverpod/legacy.dart';

class _GridNotifier extends StateNotifier<int>{
  _GridNotifier():super(0);
  void changeGrid(int value){
    state=value;
  }
}
final gridNotifierProvider=StateNotifierProvider<_GridNotifier,int>((ref){
  return _GridNotifier();
});