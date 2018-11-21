import 'package:flutter_libraries_playground/movies/model/movies_repository.dart';
import 'package:flutter_libraries_playground/movies/presentation/movies_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

part 'injector.g.dart';

abstract class Injector {
  @Register.singleton(MoviesRepository)
  @Register.factory(MoviesBloc)
  void configure();
}

void configureInjector() {
  var injector = _$Injector();
  injector.configure();
}

T inject<T>() {
  return kiwi.Container().resolve<T>();
}