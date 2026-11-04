import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mprofile/basic_module/fooddata.dart';
import 'package:mprofile/basic_module/grid_notifier_provider.dart';
import 'package:mprofile/basic_module/mealdata.dart';
import 'fooddata.dart';

class Foodscreen extends ConsumerStatefulWidget {
  const Foodscreen({super.key});

// const Foodscreen({super.key});

  @override
  ConsumerState<Foodscreen> createState() => _FoodscreenState();
}

class _FoodscreenState extends ConsumerState<Foodscreen> {
@override
  Widget build(BuildContext context) {
    final platform=Theme.of(context).platform;
    debugPrint(platform.toString());

    return Scaffold(
      appBar: _buildAppBar(),
      // body: _buildBody(),
      // body: _buildFoodGridView(),
      body: _buildMainListView(),
      floatingActionButton: platform==TargetPlatform.android?_buildFloating():null,
    );
  }

  Widget _buildFloating(){
    return FloatingActionButton(onPressed: (){},child: Icon(Icons.add));
  }

  // bool _gridStyle=true;

  AppBar _buildAppBar(){
    return AppBar(
      title: Text("Foods"),
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // actions: [IconButton(onPressed: (){
      //   setState((){
      //     _gridStyle= !_gridStyle;
      //   });
      // }, icon: Icon(_gridStyle ? Icons.list :Icons.grid_view))],
    );
  }

   Widget _buildMainListView(){
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
      _buildStoryListView(),
      _buildFoodGridView(),
      // _buildStoryListView(),
      // _buildFoodGridView(),
      ],
    );
  }

  Widget _buildStoryListView(){
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context,index){
          final item=westernFoodList[index];
          return _buildStoryItem(item);
        },
        itemCount: westernFoodList.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: .horizontal,
        ),
    );
  }

  Widget _buildStoryItem(Food item){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children:[
          Expanded(
            child: CircleAvatar(
            radius: 100,
            backgroundImage: CachedNetworkImageProvider(item.image),
          )
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(item.title)),
          Padding(padding: const EdgeInsets.all(4.0),child: Text("USD ${item.price.toStringAsFixed(2)}")),
        ]),
      );
  }

  Widget _buildBody(){
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: khmerFoodList2.length,
      itemBuilder: ((context, index) {
        final item= khmerFoodList2[index];
        return _buildListViewItem(item);
    }));
  }

  Card _buildListViewItem(Food item){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [ClipRRect(
          borderRadius: .circular(8),
          child: CachedNetworkImage(
            imageUrl:item.image,
            fit: .cover,
            width: double.maxFinite,
             ),
        ),
        Padding(padding: const EdgeInsets.all(8.0),child: Text(item.title),)
        ],
        )
      ),
    );
  }

 

  Widget _buildFoodGridView() {
    int gridIndex=ref.watch(gridNotifierProvider);
    int gridCount=gridIndex+1;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: khmerMealList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: gridCount == 1 ? 3/3 :3/5,
        crossAxisCount: gridCount,
      ),
      itemBuilder: (context, index) {
        final item=khmerMealList[index];
        return InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('/detail',arguments: item);
          },
          child: _buildGridViewItem(item),
        );
      },
    );
  }

  Widget _buildGridViewItem(Meal item){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: .circular(8),
                child: CachedNetworkImage(
                  imageUrl: item.images[0],
                  fit: .cover,
                  width: double.maxFinite,
                  ),
            )
            ),
            Padding(padding: const EdgeInsets.all(8.0),child: Text(item.title)),
            Padding(padding: const EdgeInsets.all(8.0),child: Text("USD ${item.price.toStringAsFixed(2)}")),
          ],
        )),
    );
  }
}
