import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _pairID = prefs.getString('ff_pairID') ?? _pairID;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _pairID = '27a78254-89be-4e9a-80ef-394ebf1e637f';
  String get pairID => _pairID;
  set pairID(String _value) {
    _pairID = _value;
    prefs.setString('ff_pairID', _value);
  }

  dynamic _test = jsonDecode(
      '{\"images\":[\"https://wrenjapan.com/wp-content/uploads/2014/04/arimaonsen5-953x715.jpg\",\"https://wrenjapan.com/wp-content/uploads/2014/04/kamiobo3-620x425.jpg\",\"https://wrenjapan.com/wp-content/uploads/2014/04/kamiobo2-620x649.jpg\",\"https://wrenjapan.com/wp-content/uploads/2021/07/hokkaido.jpg\"],\"videos\":[],\"title\":\"Горячие источники в Арима Онсен - Тот самый Врен\",\"description\":\"В японской культуре это примерно как баня в русской культуре. Но пользуются ими иначе.\",\"link\":\"https://wrenjapan.com/yaponiya/goryachie-istochniki-v-arima-onsen/\"}');
  dynamic get test => _test;
  set test(dynamic _value) {
    _test = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
