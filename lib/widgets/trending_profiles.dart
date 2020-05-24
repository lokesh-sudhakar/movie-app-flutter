import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/trending_person_list_bloc.dart';
import 'package:moviejunction/widgets/error.dart';
import 'package:moviejunction/widgets/profiles_list_widget.dart';
import '../model/persons_response.dart';

class TrendingPersons extends StatefulWidget {

  @override
  _TrendingPersonsState createState() => _TrendingPersonsState();
}

class _TrendingPersonsState extends State<TrendingPersons> {

  TrendingPersonListBloc trendingPersonListBloc;

  @override
  void initState() {
    super.initState();
    trendingPersonListBloc = TrendingPersonListBloc();
    trendingPersonListBloc.getTrendingPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Trending Persons on this week".toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontSize: 12,
            ),
            ),
          ),
          StreamBuilder<PersonsResponse> (
            stream: trendingPersonListBloc.personStream,
            builder: (BuildContext context, AsyncSnapshot<PersonsResponse> snapshot)  {
              if (snapshot.hasData) {
                if (snapshot.data.error != null && snapshot.data.error.isNotEmpty) {
                  return CustomErrorWidget(snapshot.data.error);
                }
                return ProfileList(snapshot.data.results);
              } else if (snapshot.hasError) {
                return CustomErrorWidget(snapshot.data.error);
              } else {
                return Container(
                  height: 120,
                    child: Center(child: CircularProgressIndicator()));
              }
            },
          )
        ],
      ),
    );
  }
}
