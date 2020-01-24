import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_boilerplate/services/counter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Consumer<Counter>(
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
