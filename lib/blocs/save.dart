import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SaveTranscript {
  static Future<void> save(String transcription, BuildContext context) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/transcription.txt');
      await file.writeAsString(transcription);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transcription saved!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save transcription: $e')),
      );
    }
  }
}