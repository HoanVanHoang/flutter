import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinder_carousel/model/User.dart';

class Memory {
  static const String KEY_APPSTATE = 'AppState';
  static const String KEY_SCAN_CART_STATE = 'ScanCartState';
  static SharedPreferences prefs;

  static FavoriteList _appState;

  static saveAppState(FavoriteList state) {
    String appState = json.encode(state.toJson());
    prefs.setString(KEY_APPSTATE, appState);
  }

  static FavoriteList loadAppState() {
    if (_appState == null) {
      _appState = _loadAppState();
    }

    return _appState;
  }

  static FavoriteList _loadAppState() {
    final String appState = prefs.getString(KEY_APPSTATE);
    if (appState == null) {
      return FavoriteList();
    }

    try {
      final data = json.decode(appState) as Map;
      final state = FavoriteList.fromJson(data);
      return state;
    } catch (e) {
      return FavoriteList();
    }
  }

}