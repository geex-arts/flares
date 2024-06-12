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
      _isProfileSet = prefs.getBool('ff_isProfileSet') ?? _isProfileSet;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _pairID = '';
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

  String _testUrl = '';
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

  bool _firstNoteSwitch = true;
  bool get firstNoteSwitch => _firstNoteSwitch;
  set firstNoteSwitch(bool value) {
    _firstNoteSwitch = value;
  }

  bool _secondNoteSwitch = true;
  bool get secondNoteSwitch => _secondNoteSwitch;
  set secondNoteSwitch(bool value) {
    _secondNoteSwitch = value;
  }

  String _pairCodeState = '';
  String get pairCodeState => _pairCodeState;
  set pairCodeState(String value) {
    _pairCodeState = value;
  }

  bool _isProfileSet = false;
  bool get isProfileSet => _isProfileSet;
  set isProfileSet(bool value) {
    _isProfileSet = value;
    prefs.setBool('ff_isProfileSet', value);
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
