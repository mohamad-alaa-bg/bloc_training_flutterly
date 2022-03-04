import 'package:bloc_training_flutterly/logic/cubit/internet_cubit.dart';
import 'package:bloc_training_flutterly/logic/cubit/setting_cubit.dart';
import 'package:bloc_training_flutterly/presentation/router/app_router.dart';
import 'package:bloc_training_flutterly/presentation/screen/second_screen.dart';
import 'package:bloc_training_flutterly/presentation/screen/third_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubit/counter_cubit.dart';
import 'presentation/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  // CounterCubit _counterCubit = CounterCubit();
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key key,
    @required this.appRouter,
    @required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => SettingCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,

        // routes: {
        //   '/': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: HomeScreen(
        //           title: 'Home Screen',
        //           color: Colors.blueAccent,
        //         ),
        //       ),
        //   '/second': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: SecondScreen(
        //           title: 'Second Screen',
        //           color: Colors.redAccent,
        //         ),
        //       ),
        //   '/third': (context) => BlocProvider.value(
        // value: _counterCubit,
        //         child: ThirdScreen(
        //           title: 'Third Screen',
        //           color: Colors.greenAccent,
        //         ),
        //       ),
        // },
      ),
    );
  }
}
