import 'package:flutter_libraries_playground/movies/model/movies_repository.dart';
import 'package:flutter_libraries_playground/movies/presentation/movies_bloc.dart';
import 'package:flutter_libraries_playground/network/api_config.dart';
import 'package:flutter_libraries_playground/network/network_client.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.singleton(ApiConfig)
  @Register.singleton(NetworkClient)
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
