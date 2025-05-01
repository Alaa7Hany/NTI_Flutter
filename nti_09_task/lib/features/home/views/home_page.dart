import 'package:flutter/material.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../add_task/edit_task_page.dart';
import '../../add_task/views/add_task_page.dart';
import '../data/my_tasks.dart';
import 'today_tasks_page.dart';
import 'widgets/floating_button.dart';
import 'widgets/in_progress_task_card.dart';
import 'widgets/overall_task_container.dart';
import 'widgets/task_group_container.dart';
import 'widgets/title_with_Counter.dart';
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
          return const TodayTasksPage();
        },
      ),
    );
  }

  void _onTaskTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EditTaskPage();
        },
      ),
    );
  }

  void _onGroupTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const TodayTasksPage();
        },
      ),
    );
  }

  void _onaddTaskPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddTaskPage();
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
        floatingActionButton: MyFloatingButton(
          assetName: AppAssets.paperPlus,
          onPressed: () => _onaddTaskPressed(context),
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
              const SizedBox(height: 10),
              OverallTaskContainer(
                tasks: MyTasks.myTasks,
                onViewTasksPressed: () => _onViewTasksPressed(context),
              ),
              TitleWithCounter(
                counter: inProgressTasks.length,
                title: 'In Progress',
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
