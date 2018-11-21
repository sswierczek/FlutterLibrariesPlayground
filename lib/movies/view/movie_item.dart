import 'package:cached_network_image/cached_network_image.dart';
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
      // TODO Load movie image
      leading: _movieImageBox(new CachedNetworkImage(
        imageUrl: "http://via.placeholder.com/350x200",
        placeholder: new CircularProgressIndicator(),
        errorWidget: new Icon(Icons.error),
        fadeOutDuration: new Duration(seconds: 1),
        fadeInDuration: new Duration(seconds: 3),
      )),
    );
  }

  Widget _movieImageBox(Widget child) {
    return new SizedBox(
      width: 100.0,
      height: 100.0,
      child: new Center(
        child: child,
      ),
    );
  }
}
