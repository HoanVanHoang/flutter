import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinder_carousel/components/favouriteList.dart';
import 'package:tinder_carousel/model/dataObject.dart';
import 'package:tinder_carousel/model/memory.dart';
import 'package:tinder_carousel/service/userService.dart';

import 'components/card.dart';
import 'model/User.dart';

void main() {
  runInit();
}

void runInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  Memory.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tinder Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedPage = 0;
  FavoriteList favouriteList;
  List<User> searchList = new List();

  Future<dynamic> getUser() async {
    var response = await UserApi().getUser();
    print(response.data.items.length);
    if (response.data == null) return null;
    setState(() {
      searchList.addAll(response.data.items);
      for(User u in searchList){
        Random random = new Random();
        int randomNumber = random.nextInt(100);
        u.id.name += randomNumber.toString();
      }
    });
    return response.data.items;
  }

  Future<dynamic> getUserSingle() async {
    var response = await UserApi().getUserSingle();
    print(response.data.item);
    if (response.data == null) return null;
    setState(() {
      Random random = new Random();
      int randomNumber = random.nextInt(100);
      response.data.item.id.name += randomNumber.toString();
      searchList.add(response.data.item);
    });
    return response.data.item;
  }

  @override
  initState()  {
    // TODO: implement initState
    super.initState();
    getUser();
    favouriteList = Memory.loadAppState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Offstage(
              offstage: _selectedPage != 0,
              child: TinderCard(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  users: searchList, callBack: actionSwipeCard,),
          ),
          Offstage(
            offstage: _selectedPage != 1,
            child: ListFavourite(
              data: favouriteList,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(),
        currentIndex: _selectedPage,
        onTap: (index) {
          _onChooseTab(index);
        },
        items: listBottomNavBarItem,
      ),
    );
  }

  void _onChooseTab(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void actionSwipeCard(int mode, User user){
    if(mode == SEARCH_MODE){
      getUserSingle();
    }
    else{
      favouriteList.list.add(user);
      print(favouriteList.list.length);
      getUserSingle();
      Memory.saveAppState(favouriteList);
    }
  }

  List<BottomNavigationBarItem> listBottomNavBarItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      activeIcon: Icon(Icons.search),
      title: Text("Search"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      activeIcon: Icon(Icons.favorite),
      title: Text("Search"),
    ),
  ];
}
