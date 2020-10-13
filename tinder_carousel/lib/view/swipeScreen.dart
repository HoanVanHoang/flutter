

import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class ListCardScreen extends StatefulWidget {
  ListCardScreenState createState() => ListCardScreenState();
}
class ListCardScreenState extends State<ListCardScreen>{
  int totalCard;
  @override
  Widget build(BuildContext context) {
   return TinderSwapCard(cardBuilder: (context, index){}, totalNum: null);
  }

}