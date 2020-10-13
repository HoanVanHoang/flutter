import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getCircleImage(String url) {
  return
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          width: 120,
          child: CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(
               url),
          ),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: new Border.all(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
      ],
    );
}