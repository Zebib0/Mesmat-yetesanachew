import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Transcription',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadFile(),
    );
  }
}

class UploadFile extends StatefulWidget {
  @override
  _UploadFileState createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String? _filePath;
  String _transcription = '';

  Future<void> _pickAudioFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );

      if (result != null) {
        String path = result.files.single.path!;
        setState(() {
          _filePath = path;
        });
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  Future<void> _transcribeAudioFile() async {
    if (_filePath != null) {
      try {
        String transcription = await transcribeAudio(_filePath!);
        setState(() {
          _transcription = transcription;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error transcribing file: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No file selected'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<String> transcribeAudio(String filePath) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:5000/recognize'), // Adjust the URL to your server's address
    );
    request.files.add(await http.MultipartFile.fromPath('audio', filePath));
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      return jsonResponse['transcript'];
    } else {
      throw Exception('Failed to transcribe audio');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Audio Transcription"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _filePath != null
                ? Text('Selected Audio File: $_filePath')
                : Text('No audio file selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickAudioFile,
              child: Text('Pick Audio File'),
            ),
            ElevatedButton(
              onPressed: _transcribeAudioFile,
              child: Text('Transcribe'),
            ),
            SizedBox(height: 20),
            Text(_transcription),
          ],
        ),
      ),
    );
  }
}
