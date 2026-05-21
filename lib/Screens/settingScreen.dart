import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mesmat_yetesanachew_application/Components/themeNotifier.dart';



typedef FontSizeChangedCallback = void Function(double);

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
    this.fontSize = 16.0,
    this.fontFamily = 'Roboto',
  }) : super(key: key);

  final double fontSize;
  final String fontFamily;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late double _fontSize;

  @override
  void initState() {
    super.initState();
    _fontSize = widget.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: themeNotifier.isDarkMode,
              onChanged: (value) {
                themeNotifier.toggleTheme();
              },
            ),
          ),
          ListTile(
            title: Text('Font Size'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (_fontSize > 8.0) {
                      setState(() {
                        _fontSize -= 2.0;
                      });
                    }
                  },
                ),
                Text('${_fontSize.toInt()}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_fontSize < 72.0) {
                      setState(() {
                        _fontSize += 2.0;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          // Other settings options...
        ],
      ),
    );
  }
}
