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
          Switch(
            value: false,
            onChanged: (value) {
              print('toggled! $value');
              theme.toggleTheme();
            },
          )
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
