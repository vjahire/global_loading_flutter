import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_cubit.dart';
import 'loading_state.dart';

class GlobalLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoadingCubit, LoadingState>(
      listener: (context, state) {
        if (state is LoadingStarted) {
          _showLoadingDialog(context);
        } else if (state is LoadingError) {
          _showErrorDialog(context, state.errorMessage);
        } else {
          print('dismisses the dialog');
          Navigator.of(context, rootNavigator: true)
              .pop(); // dismisses the dialog
        }
      },
      child:
          Container(), // Empty container because we don't need to render anything
    );
  }

  void _showLoadingDialog(BuildContext context) {
    print("showLoadingDialog");
    showDialog(
      context: context,
      barrierDismissible: false,
      // prevents user from dismissing dialog with back button
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading...'), // Your loading message
            ],
          ),
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    print("showErrorDialog");
    showDialog(
      context: context,
      barrierDismissible: false,
      // prevents user from dismissing dialog with back button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(errorMessage), // Display the error message received from API
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // Dismiss the dialog
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
