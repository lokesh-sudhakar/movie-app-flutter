import 'package:flutter/material.dart';
import 'package:moviejunction/repository/movie_repository.dart';
import 'package:moviejunction/widgets/genre.dart';
import 'package:moviejunction/widgets/now_playing.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
        leading: IconButton(
          icon: Icon(Icons.dehaze, color: Colors.white,),
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        textTheme: Theme.of(context).appBarTheme.textTheme,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            NowPlaying(),
            Genre(),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.green,
            ),
          ],

        ),
      ),
    );
  }
}
