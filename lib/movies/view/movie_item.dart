import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieItem {
  final String name;

  MovieItem({this.name});
}

class MoviesListItem extends StatelessWidget {
  MoviesListItem({this.movieItem}) : super(key: ObjectKey(movieItem));

  final MovieItem movieItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movieItem.name,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            decoration: TextDecoration.none,
          )),
    );
  }
}
