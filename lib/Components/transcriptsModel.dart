import 'package:flutter/material.dart';

class TranscriptionModel with ChangeNotifier {
  List<String> _transcriptions = [];

  List<String> get transcriptions => _transcriptions;

  void addTranscription(String transcription) {
    _transcriptions.add(transcription);
    notifyListeners();
  }
}
