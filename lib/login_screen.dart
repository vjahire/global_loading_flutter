import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_cubit.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          // Your login form widget
          ElevatedButton(
            onPressed: () {
              loginCubit.login();
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
