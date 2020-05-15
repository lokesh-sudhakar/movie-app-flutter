import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Genre extends StatefulWidget {
  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre>  with SingleTickerProviderStateMixin{

  List<Widget> tabsList;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 5,vsync: this);

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0), // here the desired height
            child: AppBar(

              backgroundColor: Theme.of(context).primaryColor,
              bottom: _tabBar(),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Container(
                height: 200,
                width: 100,
                color: Colors.red,
              ),
              Container(
                height: 200,
                width: 100,
                color: Colors.yellow,
              ),
              Container(
                height: 200,
                width: 100,
                color: Colors.purple,
              ),
              Container(
                height: 200,
                width: 100,
                color: Colors.green,
              ),
              Container(
                height: 200,
                width: 100,
                color: Colors.red,
              ),

            ],
          ),
        ),
      )
    );
  }

  Widget _tabBar() {
    return TabBar(
      indicatorColor: Theme.of(context).accentColor,
      controller: _tabController,
      labelPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 3.0,
      unselectedLabelColor: Theme.of(context).primaryColorLight,
      labelColor: Colors.white,
      tabs: <Widget>[
          Text("ACTION", style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold
          )),
        Text("ADVENTURE", style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold
        )),
        Text("ANIMATION", style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold
        )),
        Text("COMEDY", style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold
        )),
        Text("DOCUMENTARY", style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold
        )),

      ],
      isScrollable: true,
    );
  }
}
