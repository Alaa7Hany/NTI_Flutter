import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../auth/data/repo/user_repo.dart';
import '../../data/models/task_model.dart';

import '../../../auth/data/models/user_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  static UserCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void getUser(UserModel user) {
    emit(UserDataSuccessState(userModel: user));
  }

  void getUserFromCache() async {
    var result = await UserRepo().getUserData();
    result.fold(
      (error) {
        emit(UserErrorState(errorMes: error));
        log('get user error: $error');
      },
      (userModel) {
        log('User success: ${userModel.imagePath ?? ''}');
        emit(UserDataSuccessState(userModel: userModel));
      },
    );
  }

  void updateUserName(String name, XFile? image) async {
    var result = await UserRepo().updateProfile(name, image);
    result.fold(
      (error) {
        emit(UserErrorState(errorMes: error));
        log('update error: $error');
      },
      (message) {
        // log('User success: ${userModel.imagePath ?? ''}');
        // getUserFromCache();
        getUserFromCache();
        emit(UserUpdateSuccessState(message: message));
      },
    );
    emit(UpdateUserNameState());
  }

  // void changePassword(
  //   String oldPassword,
  //   String newPassword,
  //   String confirmPassword,
  // ) async {
  //   emit(UserUpdateSuccessState(message: 'Password updated successfully'));
  // }

  void updateUserImage(XFile image) {
    if (userModel == null) {
      userModel = UserModel(imagePath: image.path);
    } else {
      userModel?.imagePath = image.path;
    }
    emit(UpdateUserImageState());
  }

  void addTask(TaskModel task) {
    // if (userModel == null) {
    //   userModel = UserModel(tasks: [task]);
    // } else {
    //   if (userModel?.tasks == null) {
    //     userModel?.tasks = [task];
    //   } else {
    //     userModel?.tasks?.add(task);
    //   }
    // }
    emit((UserAddTaskState()));
  }

  void editTask(TaskModel task) {
    // if (userModel == null) {
    //   userModel = UserModel(tasks: [task]);
    // } else {
    //   userModel?.tasks?.add(task);
    // }
    emit((UserEditTaskState()));
  }
}
