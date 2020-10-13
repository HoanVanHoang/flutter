

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder_carousel/components/components.dart';
import 'package:tinder_carousel/model/User.dart';

class ListFavourite extends StatefulWidget {
  FavoriteList data;
  ListFavouriteState  createState() => ListFavouriteState();
  ListFavourite({this.data});
}
class ListFavouriteState extends State<ListFavourite>{
  @override
  Widget build(BuildContext context) {
  const double SPACE =10;
   return  widget.data.list.isNotEmpty
        ? GridView.builder(
      padding: const EdgeInsets.all(SPACE),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: SPACE,
        mainAxisSpacing: SPACE,
        childAspectRatio: 1,
      ),
      itemCount: widget.data.list.length,
      itemBuilder: (context, index) {
        return getCardFavourite(40, 60, widget.data.list[index]);
      },
    )
        : Center(child: Text("Dont have user in List "));
  }

  Widget getCardFavourite(double width, double height, User user){
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          getCircleImage(user.picture.large),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(user.name.first + " " +user.name.last + " "+ user.id.name,
                style: TextStyle(color: Colors.black, fontSize: 18),overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}