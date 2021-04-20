part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class IsAuthenticatedEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final UserModel userModel;
  LoginEvent({this.userModel});
  @override
  List<Object> get props => [];
}
