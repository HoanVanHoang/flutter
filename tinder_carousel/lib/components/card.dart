
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tinder_carousel/model/User.dart';
import 'package:tinder_carousel/model/dataObject.dart';

import 'components.dart';

class TinderCard extends StatefulWidget {
  var height, width;
   List<User> users;
   Function(int mode, User) callBack;
  TinderCardState createState() => TinderCardState();

  TinderCard({this.width, this.height, this.users, this.callBack});
}

class TinderCardState extends State<TinderCard> {
  List<bool> statusIconChoose ;
  CardController controller = new CardController();
  String title = "", detail = "";
  User currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statusIconChoose = [true, false, false, false, false];
    Future.delayed(Duration(seconds: 2), () {
      if(widget.users.isNotEmpty){
        currentUser = widget.users[0];
        title = "Full Name";
        detail = currentUser.name.last + " " +currentUser.id.name;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: widget.users!=null ? TinderSwapCard(
        maxWidth: widget.width ,
        maxHeight:widget.height ,
        minWidth: widget.width*0.98,
        minHeight: widget.height*0.98,
        cardController: controller,
        orientation: AmassOrientation.BOTTOM,
        stackNum: 5,
        totalNum: widget?.users?.length ?? 0,
        cardBuilder: (context, index){
          return getCard(widget.users[index]);
        },
        swipeUpdateCallback:
            (DragUpdateDetails details, Alignment align) {
          if (align.x < 0) {
          } else if (align.x > 0) {
          }
        },
        swipeCompleteCallback:
            (CardSwipeOrientation orientation, int index) {
           if(orientation ==CardSwipeOrientation.LEFT){
             widget.callBack(SEARCH_MODE, widget.users[index]);
           }
           else if(orientation == CardSwipeOrientation.RIGHT){
             widget.callBack(ADD_FAVOURITE, widget.users[index]);
           }
           setState(() {
             currentUser = widget.users[widget.users.length-1];
             title = "Full Name";
             detail = currentUser.name.last + " " +currentUser.id.name;
           });
        },
      ):Container(),
    );
  }
  onClickIconMenu(int index){
    setState(() {
      for(int i =0;i <statusIconChoose.length;i++){
        statusIconChoose[i] = (i==index);
      }
      if(currentUser==null&&widget.users.isNotEmpty){
        currentUser = widget.users[widget.users.length-1];
      }
      if(index == 0){
        title = "Full Name";
        detail = currentUser.name.last + " " +currentUser.id.name;
      }else if(index ==1){
        title = "Birthday";
        detail = currentUser.dob.substring(0,12);
      }
      else if(index==2){
        title = "Adrress";
        detail = currentUser.location.street + ", " +currentUser.location.city;
      }
      else if(index ==3){
        title = "Phone";
        detail = currentUser.phone;
      }
      else {
        title = "Status";
        detail = "Active";
      }
    });
  }
  Widget getCard(User user){
    return Container(
      color: Colors.black12,
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Material(
              elevation: 8,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Container(
                  color: Colors.white,
                  width: widget.width,
                  height: widget.height * 2 / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      getInforPanel(),
                      getRowItem()
                    ],
                  )
              ),
            ),
          ),
          Positioned(
              left: widget.width/3,
              top: widget.height/5,
              child: Container(child: getCircleImage(user.picture.large))),
        ],
      ),
    );
  }
  Widget getRowItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getItem(Icons.perm_contact_calendar, statusIconChoose[0],0),
        getItem(Icons.calendar_today, statusIconChoose[1],1),
        getItem(Icons.map, statusIconChoose[2],2),
        getItem(Icons.phone, statusIconChoose[3],3),
        getItem(Icons.lock_outline, statusIconChoose[4],4),
      ],
    );
  }

  Widget getItem(IconData iconData, bool status, int checkIndex){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          onClickIconMenu(checkIndex);
        },
        child: Column(
          children:status==true?[
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Container(color: Colors.lightGreen,height: 1, width: 30),
            ),
            Icon(iconData,size: 40, color: Colors.lightGreen)
          ] : [
            Icon(iconData,size: 40, color: Colors.black12)
          ],
        ),
      ),
    );
  }

  Widget getInforPanel(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(title, style: TextStyle(color: Colors.grey, fontSize: 18),overflow: TextOverflow.ellipsis),
          ),
          Text(detail, style: TextStyle(color: Colors.black, fontSize: 25),overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }

  void convertDateFromString(String strDate){
    DateTime todayDate = DateTime.parse(strDate);
    print(todayDate);
    print(formatDate(todayDate, [yyyy, '/', mm, '/', dd, am]));
  }
}
