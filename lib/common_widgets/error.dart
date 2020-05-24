import 'package:flutter/material.dart';

class CustomErrorWidget extends StatefulWidget {
  final String _errorMessage;

  CustomErrorWidget(this._errorMessage);

  @override
  _CustomErrorWidgetState createState() =>
      _CustomErrorWidgetState(_errorMessage);
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  final String _errorMessage;
  _CustomErrorWidgetState(this._errorMessage);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white10,
        child: Text(
          _errorMessage,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
