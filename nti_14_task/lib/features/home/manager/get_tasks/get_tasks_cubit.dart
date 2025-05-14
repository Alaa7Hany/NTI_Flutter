import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/tasks_repo.dart';
import 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitialState());

  static GetTasksCubit get(context) => BlocProvider.of(context);

  void getTasks() async {
    TasksRepo tasksRepo = TasksRepo();
    var result = await tasksRepo.getTasks();
    result.fold(
      (error) {
        emit(GetTasksError(error: error));
      },
      (message) {
        log(message);
        emit(GetTasksSuccess(tasks: tasksRepo.tasks));
      },
    );
    emit(GetTasksSuccess(tasks: tasksRepo.tasks));
  }
}
