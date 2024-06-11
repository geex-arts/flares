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

import '../../flutter_flow/upload_data.dart';

import '../../backend/api_requests/api_calls.dart';

Future<String> uploadImageToSupabase(String url) async {
  // Add your function code here!
  //final uri = Uri.parse(url);

  final result = await DownloadImageCall.call(
    url: url,
  );

  if (result.succeeded && result.response?.bodyBytes != null) {
    final bytes = result.response?.bodyBytes;
    final selectedUploadedFiles = bytes!.isNotEmpty
        ? <FFUploadedFile>[new FFUploadedFile(bytes: bytes)]
        : <FFUploadedFile>[];
    final selectedFiles = selectedFilesFromUploadedFiles(
      selectedUploadedFiles,
      storageFolderPath: 'wishImages',
    );
    final downloadUrls = await uploadSupabaseStorageFiles(
      bucketName: 'EdayBucket',
      selectedFiles: selectedFiles,
    );

    if (selectedUploadedFiles.length == selectedFiles.length &&
        downloadUrls.length == selectedFiles.length) {
      return downloadUrls.first;
    } else {
      return '';
    }
  } else {
    return '';
  }
}
