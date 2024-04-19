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

import 'package:customer_io/customer_io.dart';
import 'package:customer_io/customer_io_config.dart';

Future<void> initializeCustomerIo(String email) async {
  await CustomerIO.initialize(
    config: CustomerIOConfig(
      siteId: "07abf751adc533b92581",
      apiKey: "27bb4a87e8881a2b2aa8",
      // Region is optional, defaults to Region.US.
      // Use Region.EU for EU-based workspaces.
    ),
  );

  CustomerIO.identify(identifier: email);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
