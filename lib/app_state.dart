import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
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
    _safeInit(() {
      _colorsList = prefs
              .getStringList('ff_colorsList')
              ?.map((x) => Color(int.tryParse(x) ?? 0))
              .toList() ??
          _colorsList;
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

  dynamic _test = jsonDecode('null');
  dynamic get test => _test;
  set test(dynamic _value) {
    _test = _value;
  }

  String _testUrl =
      'https://wrenjapan.com/yaponiya/goryachie-istochniki-v-arima-onsen/';
  String get testUrl => _testUrl;
  set testUrl(String _value) {
    _testUrl = _value;
  }

  String _previousUrl = '';
  String get previousUrl => _previousUrl;
  set previousUrl(String _value) {
    _previousUrl = _value;
  }

  String _currentUrl = '';
  String get currentUrl => _currentUrl;
  set currentUrl(String _value) {
    _currentUrl = _value;
  }

  List<Color> _colorsList = [
    Color(4279774703),
    Color(4287828627),
    Color(4293399874),
    Color(4294913174),
    Color(4293103034)
  ];
  List<Color> get colorsList => _colorsList;
  set colorsList(List<Color> _value) {
    _colorsList = _value;
    prefs.setStringList(
        'ff_colorsList', _value.map((x) => x.value.toString()).toList());
  }

  void addToColorsList(Color _value) {
    _colorsList.add(_value);
    prefs.setStringList(
        'ff_colorsList', _colorsList.map((x) => x.value.toString()).toList());
  }

  void removeFromColorsList(Color _value) {
    _colorsList.remove(_value);
    prefs.setStringList(
        'ff_colorsList', _colorsList.map((x) => x.value.toString()).toList());
  }

  void removeAtIndexFromColorsList(int _index) {
    _colorsList.removeAt(_index);
    prefs.setStringList(
        'ff_colorsList', _colorsList.map((x) => x.value.toString()).toList());
  }

  void updateColorsListAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _colorsList[_index] = updateFn(_colorsList[_index]);
    prefs.setStringList(
        'ff_colorsList', _colorsList.map((x) => x.value.toString()).toList());
  }

  void insertAtIndexInColorsList(int _index, Color _value) {
    _colorsList.insert(_index, _value);
    prefs.setStringList(
        'ff_colorsList', _colorsList.map((x) => x.value.toString()).toList());
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

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
