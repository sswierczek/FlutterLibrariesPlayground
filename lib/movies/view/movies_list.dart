import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_libraries_playground/movies/model/movie.dart.dart';
import 'package:flutter_libraries_playground/movies/presentation/movies_bloc.dart';
import 'package:flutter_libraries_playground/movies/view/movie_item.dart';

class MoviesList extends StatelessWidget {
  MoviesList({Key key}) : super(key: key);

  final moviesBloc = MoviesBloc(); // TODO Add DI

  @override
  Widget build(BuildContext context) {
    moviesBloc.fetch();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: StreamBuilder(
        stream: moviesBloc.movies,
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Movie>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          var movie = snapshot.data[index];
          return MoviesListItem(movieItem: MovieItem(name: movie.title));
        });
  }
}
