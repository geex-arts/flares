import 'package:flutter/material.dart';
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
  set pairID(String value) {
    _pairID = value;
    prefs.setString('ff_pairID', value);
  }

  dynamic _test = jsonDecode('null');
  dynamic get test => _test;
  set test(dynamic value) {
    _test = value;
  }

  String _testUrl =
      'https://wrenjapan.com/yaponiya/goryachie-istochniki-v-arima-onsen/';
  String get testUrl => _testUrl;
  set testUrl(String value) {
    _testUrl = value;
  }

  String _previousUrl = '';
  String get previousUrl => _previousUrl;
  set previousUrl(String value) {
    _previousUrl = value;
  }

  String _currentUrl = '';
  String get currentUrl => _currentUrl;
  set currentUrl(String value) {
    _currentUrl = value;
  }

  List<Color> _colorsList = [
    const Color(0xff182def),
    const Color(0xff931293),
    const Color(0xffe81542),
    const Color(0xffff2c96),
    const Color(0xffe38dba)
  ];
  List<Color> get colorsList => _colorsList;
  set colorsList(List<Color> value) {
    _colorsList = value;
    prefs.setStringList(
        'ff_colorsList', value.map((x) => x.value.toString()).toList());
  }

  void addToColorsList(Color value) {
    _colorsList.add(value);
    prefs.setStringList(
        'ff_colorsList', _colorsList.map((x) => x.value.toString()).toList());
  }

  void removeFromColorsList(Color value) {
    _colorsList.remove(value);
    prefs.setStringList(
        'ff_colorsList', _colorsList.map((x) => x.value.toString()).toList());
  }

  void removeAtIndexFromColorsList(int index) {
    _colorsList.removeAt(index);
    prefs.setStringList(
        'ff_colorsList', _colorsList.map((x) => x.value.toString()).toList());
  }

  void updateColorsListAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    _colorsList[index] = updateFn(_colorsList[index]);
    prefs.setStringList(
        'ff_colorsList', _colorsList.map((x) => x.value.toString()).toList());
  }

  void insertAtIndexInColorsList(int index, Color value) {
    _colorsList.insert(index, value);
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
