// ignore_for_file: file_names, prefer_final_fields

import '../Screens/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/counter_cubit.dart';

class FirstScreen extends StatefulWidget {
  static const String id = 'first_screen';

  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextStyle _style2 = TextStyle(fontSize: 25, color: Colors.black);

  // TODO Use provider and builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1st Screen : Bloc Provider and Builder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: _style2,
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
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => BlocProvider.value(
                    //       value: BlocProvider.of<CounterCubit>(context),
                    //       child: SecondScreen(),
                    //     ),
                    //   ),
                    // );
                  },
                  child: Text('2nd Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/third');
                  },
                  child: Text('3rd Screen'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
