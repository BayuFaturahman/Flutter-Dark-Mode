import 'package:flutter/material.dart';

typedef ThemeModeChanged = Function(ThemeMode);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  _handleThemeModeChanged(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: HomePage(
          themeMode: _themeMode, onThemeModeChanged: _handleThemeModeChanged),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.themeMode, this.onThemeModeChanged})
      : super(key: key);

  final ThemeMode themeMode;
  final ThemeModeChanged onThemeModeChanged;

  onSwitch(bool value) {
    final newThemeMode = value ? ThemeMode.dark : ThemeMode.light;

    onThemeModeChanged(newThemeMode);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
              title: Text(
                "Dark Theme",
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Switch(value: isDarkMode, onChanged: onSwitch))
        ],
      ),
    );
  }
}
