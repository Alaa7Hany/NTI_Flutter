import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  static UserCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void getUser(UserModel userModel) {
    this.userModel = userModel;
    emit(UserDataSuccessState());
  }

  void updateUserName(String name) {
    log('name from UserCubit: $name');
    if (userModel == null) {
      userModel = UserModel(name: name);
    } else {
      userModel?.name = name;
    }

    emit(UpdateUserNameState());
  }
}
