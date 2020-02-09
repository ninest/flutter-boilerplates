import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:theme_toggle/routes/home_page.dart';
import 'package:theme_toggle/services/counter.dart';
import 'package:theme_toggle/services/theme.dart';
import 'package:theme_toggle/styles/themes.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterService>(
          create: (_) => CounterService(),
        ),
        // ChangeNotifierProvider<ThemeService>(
        //   create: (_) => ThemeService(),
        // )
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeService>(context, listen: true);

    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, box, widget) {
        var theme = box.get('theme');
        ThemeData themeData;
        if (theme == 'dark') {
          themeData = appDarkTheme;
        } else {
          themeData = appLightTheme;
        }

        return MaterialApp(
          title: 'Theme Toggle',
          theme: themeData,
          home: HomePage(title: "Toggle"),
        );
      },
    );

    // return FutureBuilder(
    //   future: _getTheme(context),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     return MaterialApp(
    //       title: 'Theme Toggle',
    //       theme: snapshot.hasData ? snapshot.data : appLightTheme,
    //       home: HomePage(title: "Toggle"),
    //     );
    //   },
    // );
  }
}
