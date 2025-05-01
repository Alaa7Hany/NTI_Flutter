import 'package:flutter/material.dart';
import 'package:nti_06_task/core/widgets/date_field.dart';
import 'package:nti_06_task/features/add_task/views/widgets/add_task_image.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/my_custom_button.dart';
import '../../../core/widgets/my_text_form_field.dart';
import '../../../core/widgets/simple_appbar.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar.build(
        title: 'Add Task',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                AddTaskImage(),
                SizedBox(height: 30),
                MyTextFormField(
                  fieldType: TextFieldType.taskTitle,
                  controller: titleController,
                ),
                SizedBox(height: 15),
                MyTextFormField(
                  fieldType: TextFieldType.taskDescribtion,
                  controller: descriptionController,
                ),
                SizedBox(height: 15),
                MyTextFormField(
                  fieldType: TextFieldType.group,
                  controller: groupController,
                ),
                SizedBox(height: 15),
                DateField(),
                SizedBox(height: 15),
                MyCustomeButton(
                  text: 'Add Task',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
