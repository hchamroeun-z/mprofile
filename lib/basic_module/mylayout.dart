import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class Mylayout extends StatelessWidget {
  // const Mylayout({super.key});
@override

Widget build(BuildContext context){
  return Scaffold(
    appBar: _buildAppBar(),body: _buildBody(),drawer: _buildDrawer(),
  );
}
AppBar _buildAppBar(){
  return AppBar(title: Text("My"));
}

Widget _buildBody(){
    return _buildListView();
  }

  Widget _buildListView() {
    return SizedBox(
      height: 450,
      child: ListView(
        scrollDirection: .horizontal,
        physics: BouncingScrollPhysics(),
        children: [
          Container(width: 130, height: 170, color: Colors.blue),
          Container(width: 140, height: 180, color: Colors.indigo),
          Container(width: 150, height: 240, color: Colors.purple),
          Container(width: 180, height: 230, color: Colors.pink),
          Container(width: 190, height: 150, color: Colors.lime),
        ],
      ),
    );
  }
  
  Widget _buildCircleImage(String pic){
    return Container(
      alignment: .center,
      // decoration: BoxDecoration(
      //   image: DecorationImage(image: CachedNetworkImageProvider(pic),
      //   fit: .cover,
      //   colorFilter: .mode(Colors.lightBlueAccent.shade700, .colorDodge)),
      // ),
      child:ClipOval(
        child: CachedNetworkImage(
          imageUrl: pic,
          width: 150,
          height: 150,
          fit: .cover,
          ),
      )
    );
  }
  Widget _buildDrawer(){
    final pic="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiIAR3qheP8RDanBhusYYTMIOfElQlhIwvNmmW_d60oA&s=10";
    final ads="https://smartaxiata-website-prod-v2.s3.ap-southeast-1.amazonaws.com/2_3_5158c648cc.png";
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          DrawerHeader(child: _buildCircleImage(pic)),
          ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          trailing: Icon(Icons.navigate_next),
        ),
        ListTile(
          leading: Icon(Icons.account_balance),
          title: Text("Account"),
          trailing: Icon(Icons.navigate_next),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Setting"),
          trailing: Icon(Icons.navigate_next),
        ),
        ListTile(
          leading: Icon(Icons.call),
          title: Text("Contact Us"),
          trailing: Icon(Icons.navigate_next),
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text("Help Desk"),
          trailing: Icon(Icons.navigate_next),
        ),
        Padding(padding: const EdgeInsets.all(8.0 ),child: CachedNetworkImage(imageUrl: ads)),
        Padding(padding: const EdgeInsets.all(8.0  ),child: Text("Version 0.0.1")),
        ],
      ),
    );
  }
}