import 'package:flutter/material.dart';
import 'package:increment_app/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(BlocProvider(
      builder: (BuildContext context) => CounterBloc(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder(
        bloc: counterBloc,
        builder: (BuildContext context, CounterState state) {
          final counter = (state as UpdateCounterState).counter;
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () =>
                      counterBloc.dispatch(IncrementCounter(counter)),
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                Padding(padding: EdgeInsets.only(left: 20),), 
                FloatingActionButton(
                  onPressed: () =>
                      counterBloc.dispatch(DecrementCounter(counter)),
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          );
        });
  }
}
