import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_06_task/core/utils/app_assets.dart';
import 'package:nti_06_task/core/widgets/simple_appbar.dart';
import 'package:nti_06_task/features/home/data/my_tasks.dart';
import 'package:nti_06_task/features/home/manager/today_tasks_cubit/today_tasks_cubit.dart';
import 'package:nti_06_task/features/home/manager/today_tasks_cubit/today_tasks_state.dart';
import 'package:nti_06_task/features/home/views/widgets/filter_dialog.dart';
import 'package:nti_06_task/features/home/views/widgets/floating_button.dart';
import 'package:nti_06_task/features/home/views/widgets/search_field.dart';
import 'package:nti_06_task/features/home/views/widgets/task_card.dart';
import 'package:nti_06_task/features/home/views/widgets/title_with_Counter.dart';

class TodayTasksPage extends StatelessWidget {
  const TodayTasksPage({super.key});

  ///////////////____Functions___/////////////////
  void _onTaskTapped(BuildContext context) {
    log('Task tapped');
  }

  void onFilterTapped(BuildContext context, TodayTasksCubit cubit) {
    log('Filter tapped');
    showDialog(
      context: context,
      builder: (_) {
        return FilterDialog(
          groupFilters: cubit.groupFilters,
          statusFilters: cubit.statusFilters,
          onGroupSelected: (group) {
            cubit.onGroupFilterChanged(group);
          },
          onStatusSelected: (status) {
            cubit.onStatusFilterChanged(status);
          },
          onDateSelected: (date) {
            cubit.onDateSelected(date);
          },
          onFilterPressed: () {
            log('Filter pressed');
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => TodayTasksCubit(),
        child: Builder(
          builder: (context) {
            var cubit = TodayTasksCubit.get(context);
            return Scaffold(
              appBar: SimpleAppBar.build(
                title: 'Tasks',
                onBack: () {
                  Navigator.pop(context);
                },
              ),
              floatingActionButton: MyFloatingButton(
                assetName: AppAssets.filter,
                /////// Over Here 👇
                onPressed: () => onFilterTapped(context, cubit),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchField(),
                    const SizedBox(height: 20),
                    TitleWithCounter(counter: 5, title: 'Results'),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, index) {
                          return index != (MyTasks.myTasks.length)
                              ? TaskCard(
                                task: MyTasks.myTasks[index],
                                onTapped: () => _onTaskTapped(context),
                              )
                              : SizedBox(height: 80);
                        },
                        itemCount: MyTasks.myTasks.length + 1,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
