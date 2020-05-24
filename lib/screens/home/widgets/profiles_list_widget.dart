import 'package:flutter/material.dart';
import 'package:moviejunction/model/persons.dart';
import '../../../common_widgets/profile_widget.dart';

class ProfileList extends StatefulWidget {
  final List<Person> _personsList;

  ProfileList(this._personsList);

  @override
  _ProfileListState createState() => _ProfileListState(this._personsList);
}

class _ProfileListState extends State<ProfileList> {
  final List<Person> _personsList;

  _ProfileListState(this._personsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: _personsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _personsList[index].profilePath == null
                ? _getEmptyWidget()
                : _getProfileWidget(index);
          }),
    );
  }

  Widget _getEmptyWidget() {
    return Container(
      width: 0,
      height: 0,
    );
  }

  Widget _getProfileWidget(int index) {
    String profile =
        'https://image.tmdb.org/t/p/w300/' + _personsList[index].profilePath;
    return ProfileWidget(_personsList[index].name,
        _personsList[index].knownForDepartment, profile);
  }
}
