import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../models/task_model.dart';
import '../../../../core/utils/app_colors.dart';

class TaskContainer extends StatelessWidget {
  final String title;
  final String description;
  final DateTime createdAt;
  final bool isCompleted;
  final TaskModel task;

  TaskContainer({super.key, required this.task})
    : title = task.title,
      description = task.description,
      createdAt = task.createdAt,
      isCompleted = task.isCompleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey,
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Text(
            DateFormat('dd/MM/yyyy\n hh:mm a').format(createdAt),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
