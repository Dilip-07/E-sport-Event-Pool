import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:user/blocs/user_register/user_register_bloc.dart';
import 'package:user/repository/repository.dart';

final GetIt inject = GetIt.instance;
Future<void> initDependencyInjection() async {
  WidgetsFlutterBinding.ensureInitialized();

  _registerRepository();
  _userRegister();
}

void _registerRepository() {
  inject.registerLazySingleton(() => UserRepository());
}

void _userRegister() {
  inject
      .registerLazySingleton(() => UserRegisterBloc(userRepository: inject()));
}
