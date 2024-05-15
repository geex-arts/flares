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

import 'dart:io' show Platform;
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

Future appTrackingTransparencyRequest() async {
  // Add your function code here!
  if (Platform.isIOS) {
    //   final TrackingStatus status =
    //       await AppTrackingTransparency.trackingAuthorizationStatus;
    //   if (status == TrackingStatus.notDetermined) {
    //     await Future.delayed(const Duration(milliseconds: 200));
    final TrackingStatus finalStatus =
        await AppTrackingTransparency.requestTrackingAuthorization();
    //     if (finalStatus == TrackingStatus.authorized) {
    //       return true;
    //     } else {
    //       return false;
    //     }
    //   } else if (status == TrackingStatus.authorized) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } else {
    //   return true;
  }
}
