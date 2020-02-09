import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:theme_toggle/routes/home_page.dart';
import 'package:theme_toggle/services/counter.dart';
import 'package:theme_toggle/services/theme.dart';
import 'package:theme_toggle/styles/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterService>(
          create: (_) => CounterService(),
        ),
        ChangeNotifierProvider<ThemeService>(
          create: (_) => ThemeService(),
        )
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  Future _openBoxes() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    return Future.wait([
      Hive.openBox('settings'),
    ]);
  }

  Future _getTheme(BuildContext context) async {
    var settingsBox = Hive.box('settings');
    var theme = settingsBox.get('theme') ?? 'light'; // light theme by default
    var materialTheme;

    switch (theme) {
      case 'light':
        {
          materialTheme = appLightTheme;
          break;
        }
      case 'dark':
        {
          materialTheme = appDarkTheme;
          break;
        }
      default:
        materialTheme = appLightTheme;
    }
    return materialTheme;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context, listen: true);

    return FutureBuilder(
      future: _openBoxes(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FutureBuilder(
          future: _getTheme(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return MaterialApp(
              title: 'Theme Toggle',
              theme: snapshot.hasData? snapshot.data : appLightTheme,
              home: HomePage(title: "Toggle"),
            );
          },
        );
      },
    );
  }
}
