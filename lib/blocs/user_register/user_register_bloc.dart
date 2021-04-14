import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user/model/status.dart';
import 'package:user/model/usermodel.dart';
import 'package:user/repository/repository.dart';

part 'user_register_event.dart';
part 'user_register_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  final UserRepository _userRepository;
  UserRegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(UserRegisterInitial());

  @override
  Stream<UserRegisterState> mapEventToState(
    UserRegisterEvent event,
  ) async* {
    if (event is AddRegister) {
      yield RegisterLoadingState();

      final response =
          await _userRepository.registerUser(userModel: event.userModel);
      if (response.isSuccess) {
        yield RegisterAddedState(status: response);
      }
    } else {
      yield RegisterErrorState(errorMessage: "Register Failed");
    }
  }
}
