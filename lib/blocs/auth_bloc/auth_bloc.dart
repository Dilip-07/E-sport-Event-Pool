import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user/model/status.dart';
import 'package:user/model/usermodel.dart';
import 'package:user/repository/repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield AuthLoadingState();
      final response =
          await _userRepository.loginUser(userModel: event.userModel);
      if (response.isSuccess) {
        yield AuthenticatedState(status: response);
      } else {
        yield AuthErrorState(errorMessage: response.message);
      }
    }
  }
}
