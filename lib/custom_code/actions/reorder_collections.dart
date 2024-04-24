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

Future reorderCollections(
  List<CollectionsRow> list,
  int oldIndex,
  int newIndex,
) async {
  // If the item is being moved down the list, we adjust the newIndex.
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  // Remove the item from its current position in the list.
  final CollectionsRow item = list.removeAt(oldIndex);

  // Insert the item into its new position.
  list.insert(newIndex, item);

  // Create a batch to combine multiple Firestore operations into one.
  final supabase = Supabase.instance.client;
  // Iterate through the list and update the order field for each document in Firestore.
  for (int i = 0; i < list.length; i++) {
    final CollectionsRow row = await list[i];
    await supabase
        .from('collections')
        .update({'order': i}).eq('uuid', row.uuid);
    // Update the 'order' field of the document with its new index.
    // This assumes that you have an 'order' field in Firestore where you store the order of the items.
  }

  // Commit all the batched operations to Firestore.
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
