import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libraries_playground/movies/view/movie_item.dart';

const thumb_size = 100.0;

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
      leading: _movieImageBox(CachedNetworkImage(
        imageUrl: movieItem.thumbUrl,
        placeholder: CircularProgressIndicator(),
        errorWidget: Icon(Icons.error),
        fadeOutDuration: Duration(seconds: 1),
        fadeInDuration: Duration(seconds: 3),
      )),
    );
  }

  Widget _movieImageBox(Widget child) {
    return SizedBox(
      width: thumb_size,
      height: thumb_size,
      child: Center(
        child: child,
      ),
    );
  }
}
