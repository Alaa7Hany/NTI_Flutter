import 'package:image_picker/image_picker.dart';
import 'package:nti_11_task/features/home/data/models/task_model.dart';

class UserModel {
  String? name;
  String? password;
  XFile? image;
  List<TaskModel> tasks;

  UserModel({this.name, this.image, this.password, this.tasks = const []});
}
