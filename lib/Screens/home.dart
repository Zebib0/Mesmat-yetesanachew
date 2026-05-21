import 'package:flutter/material.dart';
import 'package:mesmat_yetesanachew_application/Components/color.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:mesmat_yetesanachew_application/blocs/audioRecorder.dart';
import 'package:mesmat_yetesanachew_application/Screens/fileUpload.dart';
import 'package:mesmat_yetesanachew_application/Components/bottomNavigationBar.dart';
import 'package:mesmat_yetesanachew_application/blocs/save.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});



  @override
  State<SpeechScreen> createState() => _SpeechScreenState();

}


class _SpeechScreenState extends State<SpeechScreen> {
  String _transcription = '';

  void _onTranscriptionComplete(String transcription) {
    setState(() {
      _transcription = transcription;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0.0,
        title: const Text(
          "Hearing_Assistant",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Expanded(
              child: Center(

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AudioRecorderButton(onTranscriptionComplete: _onTranscriptionComplete), // Add the audio recorder button
                SizedBox(width: 20), // Add spacing between buttons
                Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.save),
                    color: Colors.white,
                    iconSize: 30.0,
                    onPressed: _transcription.isEmpty ? null : () => SaveTranscript.save(_transcription, context),
                  ),
                ),
              ],
            ),
          ],
        ),

      ),

    );
  }
}





