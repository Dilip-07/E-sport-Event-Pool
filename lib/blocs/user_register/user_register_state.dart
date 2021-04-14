part of 'user_register_bloc.dart';

abstract class UserRegisterState extends Equatable {}

class UserRegisterInitial extends UserRegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoadingState extends UserRegisterState {
  @override
  List<Object> get props => [];
}

class RegisterAddedState extends UserRegisterState {
  final Status status;

  RegisterAddedState({this.status});
  @override
  List<Object> get props => [];
}

class RegisterErrorState extends UserRegisterState {
  final String errorMessage;

  RegisterErrorState({this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
