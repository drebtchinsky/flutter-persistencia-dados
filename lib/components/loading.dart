import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String _message;
  const Loading({
    Key key,
    String message = 'Loading',
  })  : _message = message,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(_message),
        ],
      ),
    );
  }
}
