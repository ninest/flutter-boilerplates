import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context, listen: true);

    return MaterialApp(
      title: 'Theme Toggle',
      theme: theme.isDarkTheme? appDarkTheme : appLightTheme,
      home: HomePage(title: "Toggle"),
    );
  }
}
