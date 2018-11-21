// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void configure() {
    final Container container = Container();
    container.registerSingleton((c) => ApiConfig());
    container.registerSingleton((c) => NetworkClient(c<ApiConfig>()));
    container.registerSingleton((c) => MoviesRepository(c<NetworkClient>()));
    container.registerFactory((c) => MoviesBloc(c<MoviesRepository>()));
  }
}
