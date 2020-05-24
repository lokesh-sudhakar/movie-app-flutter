import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/genre_list_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/genres_response.dart';
import 'package:moviejunction/common_widgets//base_view.dart';
import 'package:moviejunction/common_widgets/error.dart';
import 'genre_movie_list.dart';

class Genre extends StatefulWidget {
  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<GenreViewModel>(
      initState: (model) {
        model.getGenres().then((value) {
          _tabController = TabController(
              initialIndex: 0, length: value.genres.length, vsync: this);
        });
      },
      builder: (context, model, child) => Container(
        color: Theme.of(context).primaryColor,
        height: 320,
        width: double.infinity,
        child: Center(
          child: model.state == ViewState.Busy
              ? CircularProgressIndicator()
              : model.genreResponse.error.isNotEmpty
                  ? CustomErrorWidget(model.genreResponse.error)
                  : Container(
                      child: DefaultTabController(
                      length: model.genreResponse.genres.length,
                      child: Scaffold(
                        appBar: PreferredSize(
                          preferredSize:
                              Size.fromHeight(45.0), // here the desired height
                          child: AppBar(
                            backgroundColor: Theme.of(context).primaryColor,
                            bottom: _tabBar(model.genreResponse),
                          ),
                        ),
                        body: TabBarView(
                          controller: _tabController,
                          children: model.genreResponse.genres.map((genre) {
                            return GenreMovieList(genre.id);
                          }).toList(),
                        ),
                      ),
                    )),
        ),
      ),
    );
  }

  Widget _tabBar(GenresResponse response) {
    return TabBar(
      indicatorColor: Theme.of(context).accentColor,
      controller: _tabController,
      labelPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 3.0,
      unselectedLabelColor: Theme.of(context).primaryColorLight,
      labelColor: Colors.white,
      tabs: response.genres.map((genre) {
        return Text(genre.name.toUpperCase(),
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold));
      }).toList(),
      isScrollable: true,
    );
  }
}
