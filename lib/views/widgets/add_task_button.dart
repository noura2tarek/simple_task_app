import 'package:flutter/material.dart';
import 'package:simple_task_app/core/app_colors.dart';
import 'package:simple_task_app/core/app_strings.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, required this.onAddTaskPressed});
  final void Function()? onAddTaskPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
      ),
      onPressed: onAddTaskPressed,
      child: const Text(AppStrings.add),
    );
  }
}
