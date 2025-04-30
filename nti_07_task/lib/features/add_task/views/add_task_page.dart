import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/my_custom_button.dart';
import '../../../core/widgets/my_text_form_field.dart';
import '../../options/views/widgets/simple_appbar.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar.build('Add Task', () {
        Navigator.pop(context);
      }),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(AppAssets.logo, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 30),
              MyTextFormField(
                fieldType: TextFieldType.taskTitle,
                controller: titleController,
              ),
              SizedBox(height: 20),
              MyTextFormField(
                fieldType: TextFieldType.taskDescribtion,
                controller: descriptionController,
              ),
              SizedBox(height: 30),
              MyCustomeButton(text: 'Add Task', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
