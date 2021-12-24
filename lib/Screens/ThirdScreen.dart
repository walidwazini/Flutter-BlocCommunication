import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  final String title;
  final Color color;

  const ThirdScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  TextStyle style2 = TextStyle(fontSize: 25, color: Colors.black);

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _toggleSnackBar(
      BuildContext ctx, String text, Color indicator) {
    return ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(milliseconds: 400),
        backgroundColor: indicator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  _toggleSnackBar(context, 'Incremented', Colors.green);
                } else {
                  _toggleSnackBar(context, 'Decremented', Colors.red);
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: style2,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  //tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).reset();
                  },
                  //tooltip: 'Increment',
                  child: Icon(Icons.accessibility),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  //tooltip: 'Increment',
                  child: Icon(Icons.add),
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Text('1st Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  },
                  child: Text('2nd Screen'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
