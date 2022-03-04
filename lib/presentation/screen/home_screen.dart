import 'package:bloc_training_flutterly/constants/enums.dart';
import 'package:bloc_training_flutterly/logic/cubit/counter_cubit.dart';
import 'package:bloc_training_flutterly/logic/cubit/internet_cubit.dart';
import 'package:bloc_training_flutterly/presentation/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);
  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  String textCounter = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed('/setting');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'WiFi',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.green,
                        ),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Mobile',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.red,
                        ),
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    'Disconnected',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.grey,
                        ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state.counterValue < 0) {
                  textCounter = 'BRR, NEGATIVE ${state.counterValue}';
                } else if (state.counterValue % 2 == 0) {
                  textCounter = 'YAAAY ${state.counterValue}';
                } else if (state.counterValue == 5) {
                  textCounter = 'HMM, NUMNER 5';
                } else {
                  textCounter = state.counterValue.toString();
                }
                return Text(
                  textCounter,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
              listener: (context, state) {
                if (state.wasIncrement) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
            ),
            SizedBox(
              height: 24,
            ),

            Builder(
              builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                final internetState = context.watch<InternetCubit>().state;

                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Counter: ' +
                        counterState.counterValue.toString() +
                        '  Internet: Wifi',
                    style: Theme.of(context).textTheme.headline6,
                  );
                } else if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Counter: ' +
                        counterState.counterValue.toString() +
                        '  Internet: Mobile',
                    style: Theme.of(context).textTheme.headline6,
                  );
                } else {
                  return Text(
                    'Counter: ' +
                        counterState.counterValue.toString() +
                        '  Internet: Disconnected',
                    style: Theme.of(context).textTheme.headline6,
                  );
                }
              },
            ),
            SizedBox(
              height: 24,
            ),

            Builder(
              builder: (context) {
                final counterValue = context
                    .select((CounterCubit cubit) => cubit.state.counterValue);
                return Text(
                  'Counter:   ' + counterValue.toString(),
                  style: Theme.of(context).textTheme.headline6,
                );
              },
            ),

            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title} #1'),
                  backgroundColor: widget.color,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} #1'),
                  backgroundColor: widget.color,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');

                // // هنا لا نستخدم نفس الاسم context كي لا يحدث تعارض مع ال context التي تمرر لل value
                // //لذلك وضعنا _ في builder
                // Navigator.of(context)
                //
                //     .push(MaterialPageRoute(builder: (_) {
                //   return BlocProvider.value(
                //     value: BlocProvider.of<CounterCubit>(context),
                //     child: SecondScreen(
                //       title: 'Second Screen',
                //       color: Colors.redAccent,
                //     ),
                //   );
                // }));
              },
              child: Text(
                'Go To Second Screen',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.redAccent,
              height: 50,
              minWidth: 100,
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: Text(
                'Go To Third Screen',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.greenAccent,
              height: 50,
              minWidth: 100,
            )
          ],
        ),
      ),
    );
  }
}
