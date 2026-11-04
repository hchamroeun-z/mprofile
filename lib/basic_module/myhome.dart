import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  
  final _scaffoldkey=GlobalKey<ScaffoldState>();
  final pics="https://i.pinimg.com/736x/34/5f/bc/345fbc875fb6566838e37914d4bc1e0b.jpg";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key:_scaffoldkey,
      
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      endDrawer: _buildEndDrawer(),
      body: _buildBody2(),
    );
  }

  Widget _buildDrawer()=>Drawer();
  Widget _buildEndDrawer()=>Drawer();

  final gif="https://i.imgur.com/Vz7C2sO.gif";

  Widget _buildBody2(){
    // final bg="https://img.magnific.com/free-vector/background-banner-colorful-gradient-design_677411-3543.jpg?semt=ais_hybrid&w=740&q=80";
    return Container(
      alignment: .center,
      decoration: BoxDecoration(
        image: DecorationImage(image: CachedNetworkImageProvider(gif),
        fit: .cover,
        colorFilter: .mode(Colors.lightBlueAccent.shade700, .colorDodge)),
      ),
      // child: ClipRRect(
      //   borderRadius: .circular(16),
      //   child: Container(width: 150,height: 150,color: Colors.yellow),
      // ),
      child:ClipOval(
        child: CachedNetworkImage(
          imageUrl: pics,
          width: 250,
          height: 250,
          fit: .cover,
          ),
      )
    );
  }
  
  Widget _buildBody(String pics) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: pics,
        placeholder: (_, _)=>Container(color: Colors.grey.shade800),
        errorWidget: (_, _, _)=>Container(color: Colors.grey.shade900),
      ),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
        flexibleSpace: CachedNetworkImage(imageUrl: gif,fit:.cover),
        leading: IconButton(onPressed: (){
          _scaffoldkey.currentState!.openDrawer();
        }, 
        icon: Image.asset("images/picasa.png")),
        backgroundColor: Colors.blueAccent.shade100,
        foregroundColor: Colors.white,
        title: Text("កម្មវិធីខ្មែរ",
        style: GoogleFonts.siemreap(fontWeight: .bold,fontStyle: .italic),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.twitter)),
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.share)),
          IconButton(onPressed: (){
            _scaffoldkey.currentState!.openEndDrawer();
          }, icon: Icon(Icons.more_vert)),
        ],
      );
  }
}