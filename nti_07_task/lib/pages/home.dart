import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_06_task/models/task_model.dart';
import 'package:nti_06_task/pages/options._page.dart';

import 'package:nti_06_task/utils/app_assets.dart';
import 'package:nti_06_task/utils/app_colors.dart';
import 'package:nti_06_task/widgets/home_appbar.dart';
import 'package:nti_06_task/widgets/task_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isEmpty = true;
  List<TaskModel> tasks = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar.build(
          name: 'Alaa Hany',
          onAddPressed: () {
            int id = tasks.length + 1;
            tasks.add(
              TaskModel(
                id: id,
                title: 'Task $id',
                description: 'Description $id',
                createdAt: DateTime.now(),
                isCompleted: false,
              ),
            );
            setState(() {
              isEmpty = false;
            });
          },
          onProfilePressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const OptionsPage();
                },
              ),
            );
          },
        ),
        backgroundColor: AppColors.scaffoldBackground,
        body: isEmpty ? emptyBody() : normalBody(),
      ),
    );
  }

  Widget emptyBody() {
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
          SvgPicture.asset(AppAssets.emptyHome),
        ],
      ),
    );
  }

  Widget normalBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Tasks',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                ),
                const SizedBox(width: 30),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.lightGreen,
                  ),
                  child: Text(
                    '${tasks.length}',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(
                  tasks.length,
                  (index) => TaskContainer(task: tasks[index]),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
