import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mprofile/basic_module/color_notifier_provider.dart';
import 'package:mprofile/basic_module/grid_notifier_provider.dart';
import 'package:mprofile/basic_module/myapp.dart';
import 'package:mprofile/basic_module/theme_notifier_provider.dart';
import 'package:mprofile/mprofile_module/screens/profile_screen.dart';

final gridStyles=[
  Icons.list,
  Icons.grid_view,
  Icons.grid_3x3,
  Icons.grid_4x4,
];

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    _dark = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person,size: 32,),
            tooltip: 'Profile',
            padding: const EdgeInsets.all(8.0), 
            splashRadius: 20.0, 
            constraints: const BoxConstraints(
              minWidth: 40.0,
              minHeight: 40.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                    );
                  },
                ),
              ],
            ),
      body: ListView(padding: .all(8), children: [
        _buildDarkSwitch(),
        _buildColorGridView(),
        // _buildGridStyle(),
        ]),
    );
  }

  Widget _buildDarkSwitch() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.dark_mode_outlined),
        title: Text("Night Mode"),
        trailing: Switch(
          value: _dark,
          onChanged: (value) {
            // setState(() {
            //   _dark=value;
            // });
            ref.read(themeNotifierProvider.notifier).toggleDark();
          },
        ),
      ),
    );
  }

  Widget _buildColorGridView(){
    int colorIndex=ref.watch(colorNotifierProvider);

    return Card(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: colorList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 50), 
        itemBuilder: (context,index){
          final clr=colorList[index];
          return IconButton(onPressed: (){
            ref.read(colorNotifierProvider.notifier).changeColorIndex(index);
          },
          icon: ClipOval(
            child: Container(color: clr,
            alignment: .center,
            child: colorIndex==index?_buildWhiteOval():SizedBox(),
            )));
        }),
    );
  }

  Widget _buildWhiteOval(){
    return ClipOval(
      child: Container(
        alignment: .center,
        width: 20,
        height: 20,
        color: Colors.white,
      ),
    );
  }

  Widget _buildGridStyle(){
    int gridIndex=ref.watch(gridNotifierProvider);
    
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: gridStyles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
      itemBuilder: (context,index){
        final icon=gridStyles[index];
        return Card(
          color: gridIndex==index
            ?Theme.of(context).colorScheme.tertiaryContainer
            :null,
          shape: CircleBorder(),
          child: IconButton(onPressed: ()
          {
            ref.read(gridNotifierProvider.notifier).changeGrid(index);
          }, 
          icon: Icon(icon)),
        );
    });
  }

}
