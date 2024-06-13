import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_loading/loading_indicator.dart';
import 'package:global_loading/login_screen.dart';

import 'loading_cubit.dart';
import 'login_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoadingCubit()),
        BlocProvider(
            create: (_) => LoginCubit(BlocProvider.of<LoadingCubit>(_))),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          LoginScreen(),
          GlobalLoadingIndicator(),
        ],
      ),
    );
  }
}
