import 'package:flutter/material.dart';
import 'package:nti_06_task/core/utils/app_text_styles.dart';
import 'package:nti_06_task/features/home/data/my_tasks.dart';
import 'package:nti_06_task/features/home/views/widgets/in_progress_task_card.dart';
import 'package:nti_06_task/features/home/views/widgets/overall_task_container.dart';
import 'package:nti_06_task/features/home/views/widgets/task_group_container.dart';
import '../../../core/wrapper/svg_wrapper.dart';
import '../data/models/task_model.dart';
import '../../options/views/options._page.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/home_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  ///////////////____Functions___/////////////////
  void _onAppBartapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OptionsPage();
        },
      ),
    );
  }

  void _onViewTasksPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OptionsPage();
        },
      ),
    );
  }

  void _onTaskTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OptionsPage();
        },
      ),
    );
  }

  void _onGroupTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OptionsPage();
        },
      ),
    );
  }

  void _onaddTaskPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OptionsPage();
        },
      ),
    );
  }
  ///////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    ///////////////____Variables___/////////////////
    final bool isEmpty = MyTasks.myTasks.isEmpty;

    ////////////////////////////////////
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            onPressed: () => _onaddTaskPressed(context),
            backgroundColor: AppColors.primaryColor,
            elevation: 4,
            shape: CircleBorder(),
            child: SvgWrappe(assetName: AppAssets.paperPlus),
          ),
        ),
        appBar: HomeAppBar.build(
          name: 'Alaa Hany',
          onProfilePressed: () => _onAppBartapped(context),
        ),
        body: isEmpty ? _emptyBody() : _normalBody(context),
      ),
    );
  }

  Widget _emptyBody() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            'There are no tasks yet,\nPress the button\nTo add New Task ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SvgWrappe(assetName: AppAssets.emptyHome),
        ],
      ),
    );
  }

  Widget _normalBody(BuildContext context) {
    ////////////////////////////////
    final inProgressTasks =
        MyTasks.myTasks
            .where((task) => task.taskState == TaskStatus.inProgress)
            .toList();
    ////////////////////////////////////
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OverallTaskContainer(
                tasks: MyTasks.myTasks,
                onViewTasksPressed: () => _onViewTasksPressed(context),
              ),
              Row(
                children: [
                  Text('In Progress', style: AppTextStyles.s14w300),
                  Container(
                    margin: const EdgeInsetsDirectional.only(start: 20),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColors.lightGreen,
                    ),
                    child: Text(
                      inProgressTasks.length.toString(),
                      style: AppTextStyles.s14w400.copyWith(
                        color: AppColors.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 23),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: inProgressTasks.length,
                  itemBuilder: (_, index) {
                    return InProgressTaskCard(
                      taskModel: inProgressTasks[index],
                      onTapped: () => _onTaskTapped(context),
                    );
                  },
                ),
              ),
              const SizedBox(height: 26),
              Text('Task Groups', style: AppTextStyles.s14w300),
              const SizedBox(height: 23),
              Column(
                children: [
                  TaskGroupContainer(
                    taskGroup: TaskGroup.personal,
                    tasks: MyTasks.myTasks,
                    onTapped: () => _onGroupTapped(context),
                  ),
                  const SizedBox(height: 10),
                  TaskGroupContainer(
                    taskGroup: TaskGroup.home,
                    tasks: MyTasks.myTasks,
                    onTapped: () => _onGroupTapped(context),
                  ),
                  const SizedBox(height: 10),
                  TaskGroupContainer(
                    taskGroup: TaskGroup.work,
                    tasks: MyTasks.myTasks,
                    onTapped: () => _onGroupTapped(context),
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
