import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/manager/user_cubit/user_cubit.dart';
import 'update_username._state.dart';

class UpdateUsernameCubit extends Cubit<UpdateUsernameState> {
  UpdateUsernameCubit() : super(UpdateUsernameInitialState());

  static UpdateUsernameCubit get(context) => BlocProvider.of(context);

  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updateUsername(UserCubit userCubit) {
    emit(UpdateUsernameLoadingState());
    log('name from UpdateUsernameCubit: ${usernameController.text}');
    Future.delayed(const Duration(seconds: 2), () {
      if (formKey.currentState!.validate()) {
        userCubit.updateUserName(usernameController.text);
        emit(UpdateUsernameSuccessState(usernameController.text));
      } else {
        emit(UpdateUsernameErrorState('Invalid username'));
      }
    });
  }
}
