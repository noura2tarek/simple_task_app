import 'package:flutter/material.dart';
import 'package:simple_task_app/core/app_colors.dart';
import 'package:simple_task_app/core/app_strings.dart';
import 'package:simple_task_app/data/models/task_model.dart';

class StatusBadge extends StatelessWidget {
  final TaskStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final bool completed = status == TaskStatus.completed;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 3),
      decoration: BoxDecoration(
        color: completed ? AppColors.lightGreen : AppColors.lightOrange,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        completed
            ? AppStrings.completed.toUpperCase()
            : AppStrings.pending.toUpperCase(),
        style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          color: completed ? AppColors.greenColor : AppColors.orange,
        ),
      ),
    );
  }
}
