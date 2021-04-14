part of 'user_register_bloc.dart';

abstract class UserRegisterEvent extends Equatable {
  const UserRegisterEvent();

  @override
  List<Object> get props => [];
}

class AddRegister extends UserRegisterEvent {
  final UserModel userModel;

  AddRegister({this.userModel});
  @override
  List<Object> get props => [userModel];
}
