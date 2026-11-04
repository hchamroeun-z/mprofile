import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mprofile/basic_module/mealdata.dart';

class MealdDetailScreen extends StatefulWidget {
  const MealdDetailScreen({super.key});

  @override
  State<MealdDetailScreen> createState() => _MealdDetailScreenState();
}

class _MealdDetailScreenState extends State<MealdDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final item=ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text("Meal Detail"),),
      body: ListView(
        padding: .all(8),
        children: [
          _buildCarouselSlider(item.images),
          // _buildSlideShow(item.images),
          
          // Card(
          //   child: ListTile(
          //   leading: FaIcon(FontAwesomeIcons.bowlFood),
          //   title: Text(item.title),
          //   ),
          // ),
          Card(
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.bowlFood),
              title: Text(item.title),
            ),
          ),
          Card(child: ListTile(title:Text(item.description))),
          Card(
            child: ListTile(
              leading: FaIcon(FontAwesomeIcons.dollarSign),
              title: Text("USD ${item.price}"),
            ),
          ),
        ],
      )
    );
  }
  Widget _buildSlideShow(List<String> images){
    return SizedBox(
      height: 300,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: images.length,
        itemBuilder: (context,index){
          final pic = images[index];
          return Padding(padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: .circular(8),
            child: CachedNetworkImage(imageUrl: pic,fit: .cover,),
          ));
        }
        ),
    );
  }
  Widget _buildCarouselSlider(List<String> images){
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        aspectRatio: 4/3,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, viewIndex){
        final pic =images[index];
          return Padding(padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: .circular(8),
            child: CachedNetworkImage(imageUrl: pic,fit: .cover,),
          ));
    });
  }
}