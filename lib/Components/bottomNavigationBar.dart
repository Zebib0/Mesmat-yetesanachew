import 'package:flutter/material.dart';
import 'package:hearing_assistant/Screens/fileUpload.dart';
import 'package:hearing_assistant/Screens/home.dart';
import 'package:hearing_assistant/Components/color.dart';
import 'package:hearing_assistant/Screens/SettingScreen.dart';
import 'package:hearing_assistant/Screens/savedTranscripts.dart';


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
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final UploadFile uploadAudio = UploadFile();
  static List<Widget> _screens = <Widget>[
    SpeechScreen(),
    UploadFile(),
    SettingsPage(),
    SavedTranscription(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home, color: bgColor,),
          ),
          BottomNavigationBarItem(
            label: 'uplaoad files',
            icon: Icon(Icons.file_upload, color: bgColor,),
          ),
          BottomNavigationBarItem(
            label: 'setting',
            icon: Icon(Icons.settings, color: bgColor,),
          ),
          BottomNavigationBarItem(
            label: 'saves',
            icon: Icon(Icons.sort_rounded, color: bgColor,),
          ),
          /*BottomNavigationBarItem(
            label: 'save',
            icon: Icon(Icons.save, color: bgColor,),
          ),*/
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }


}


