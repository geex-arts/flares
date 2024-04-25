// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html' as html;
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = SupaFlow.client;
const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');

Future signInWithGoogle() async {
  await supabase.auth.signInWithOAuth(Provider.google,
      redirectTo: "https://flaresapp.page.link");
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
