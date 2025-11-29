// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import '/flutter_flow/uploaded_file.dart';

Future<bool> uploadImageToS3(String uploadUrl, FFUploadedFile file) async {
  try {
    final response = await http.put(
      Uri.parse(uploadUrl),
      body: file.bytes, // FFUploadedFile에도 bytes 있음
    );
    return response.statusCode == 200;
  } catch (e) {
    print("Upload failed: $e");
    return false;
  }
}
