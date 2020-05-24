import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  final String _photoUrl;
  final String _title;
  final String _subTitle;

  ProfileWidget(this._title, this._subTitle, this._photoUrl);

  @override
  _ProfileWidgetState createState() =>
      _ProfileWidgetState(_title, _subTitle, _photoUrl);
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final String _photoUrl;
  final String _title;
  final String _subTitle;

  _ProfileWidgetState(this._title, this._subTitle, this._photoUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: 100,
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColorLight,
                backgroundImage: NetworkImage(_photoUrl)),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              _title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2),
            child: Text(
              _subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 8,
                  fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}
