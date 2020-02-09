import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_toggle/services/counter.dart';
import 'package:theme_toggle/services/theme.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context, listen: false);
    final counter = Provider.of<CounterService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.wb_sunny),
            onPressed: () {
              print('setting dark theme');
              theme.setTheme('dark');
            },
          ),
          IconButton(
            icon: Icon(Icons.surround_sound),
            onPressed: () {
              print('setting light theme');
              theme.setTheme('light');
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<CounterService>(
          builder: (_, counter, child) => Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
