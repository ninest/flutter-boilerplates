import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multiprovider/routes/home_page.dart';
import 'package:multiprovider/services/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme().copyWith(
          display1: TextStyle(
            fontSize: 250.0,
            fontWeight: FontWeight.w900,
            color: Colors.black
          )
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Counter>(
            create: (_) => Counter(),
          )
        ],
        child: HomePage(title: "MultiProvider"),
      ),
    );
  }
}