import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_12_task/features/home/data/models/task_model.dart';
import 'package:nti_12_task/features/home/data/repo/tasks_repo.dart';
import 'package:nti_12_task/features/home/manager/get_tasks/get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitialState());

  static GetTasksCubit get(context) => BlocProvider.of(context);

  List<TaskModel> tasks = [];

  void getTasks() {
    TasksRepo tasksRepo = TasksRepo();
    tasks = tasksRepo.tasks;
    emit(GetTasksSuccess());
  }
}
