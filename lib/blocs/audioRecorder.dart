import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mesmat_yetesanachew_application/Components/color.dart';
import 'package:mesmat_yetesanachew_application/SpeechRecognition/connect.dart';


class AudioRecorderButton extends StatefulWidget {
  final Function(String) onTranscriptionComplete;

  const AudioRecorderButton({Key? key, required this.onTranscriptionComplete}) : super(key: key);

  @override
  _AudioRecorderButtonState createState() => _AudioRecorderButtonState();
}

class _AudioRecorderButtonState extends State<AudioRecorderButton> {
  late Record audioRecord;
  bool isRecording = false;
  String audioPath = "";

  @override
  void initState() {
    super.initState();
    audioRecord = Record();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    super.dispose();
  }

  Future<void> transcribeAudio(String filePath) async {
    String transcription = await Transcription.transcribeAudio(filePath);
    widget.onTranscriptionComplete(transcription);
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        Directory tempDir = await getTemporaryDirectory();
        audioPath = '${tempDir.path}/temp.wav';
        await audioRecord.start(path: audioPath);
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print("Error starting recording: $e");
    }
  }

  Future<void> stopRecording() async {
    try {
      await audioRecord.stop();
      setState(() {
        isRecording = false;
      });
      transcribeAudio(audioPath);
    } catch (e) {
      print("Error stopping recording: $e");
    }
  }

  void handleOnPressed() {
    if (isRecording) {
      stopRecording();
    } else {
      startRecording();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      animate: isRecording,
      duration: const Duration(milliseconds: 2000),
      glowColor: bgColor,
      repeat: true,
      child: FloatingActionButton(
        backgroundColor: bgColor,
        onPressed: handleOnPressed,
        child: CircleAvatar(
          backgroundColor: bgColor,
          radius: 35,
          child: Icon(
            isRecording ? Icons.stop : Icons.mic,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
