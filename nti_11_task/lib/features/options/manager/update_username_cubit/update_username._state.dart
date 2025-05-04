abstract class UpdateUsernameState {}

class UpdateUsernameInitialState extends UpdateUsernameState {}

class UpdateUsernameLoadingState extends UpdateUsernameState {}

class UpdateUsernameSuccessState extends UpdateUsernameState {
  final String username;

  UpdateUsernameSuccessState(this.username);
}

class UpdateUsernameErrorState extends UpdateUsernameState {
  final String error;

  UpdateUsernameErrorState(this.error);
}
