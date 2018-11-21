import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_libraries_playground/di/injector.dart';
import 'package:flutter_libraries_playground/movies/model/data/movie.dart';
import 'package:flutter_libraries_playground/movies/presentation/movies_bloc.dart';
import 'package:flutter_libraries_playground/movies/view/movie_item.dart';
import 'package:flutter_libraries_playground/movies/view/movie_list_item.dart';

class MoviesList extends StatefulWidget {
  MoviesList({Key key}) : super(key: key);

  @override
  MoviesListState createState() {
    return MoviesListState();
  }
}

class MoviesListState extends State<MoviesList> {
  final moviesBloc = inject<MoviesBloc>();

  @override
  Widget build(BuildContext context) {
    moviesBloc.fetch();
    return buildWidget();
  }

  Widget buildWidget() {
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
          return MoviesListItem(movieItem: fromMovie(movie));
        });
  }

  @override
  void dispose() {
    super.dispose();
    moviesBloc.cleanup();
  }
}
