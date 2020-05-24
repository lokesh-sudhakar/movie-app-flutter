import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviejunction/model/genres_response.dart';
import 'package:moviejunction/repository/movie_repository.dart';
import 'package:moviejunction/widgets/genre_movie_list.dart';

class Genre extends StatefulWidget {
  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre>  with SingleTickerProviderStateMixin{

  MovieRepository repository;
  GenresResponse genresResponse;
  List<Widget> tabsList;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    repository = MovieRepository();
    getMovieGenres();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void getMovieGenres() async {
    GenresResponse response = await repository.getGenres();
    setState(() {
      genresResponse = response;
      _tabController = TabController(initialIndex: 0,length: genresResponse.genres.length,vsync: this);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 320,
      width: double.infinity,
      child: Center(
        child: genresResponse == null ? CircularProgressIndicator() : Container(
          child: DefaultTabController(
            length: genresResponse.genres.length,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(45.0), // here the desired height
                child: AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  bottom: _tabBar(),
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: genresResponse.genres.map((genre) {
                  return   GenreMovieList(genre.id);
                }).toList(),
              ),
            ),
          )
        ),
      ),
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
      tabs: genresResponse.genres.map((genre){
        return Text(genre.name.toUpperCase(), style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold
        ));
      }).toList(),
      isScrollable: true,
    );
  }
}
