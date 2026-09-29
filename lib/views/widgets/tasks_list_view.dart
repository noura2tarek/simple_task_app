import 'package:flutter/material.dart';
import 'package:simple_task_app/core/app_colors.dart';
import 'package:simple_task_app/data/models/task_model.dart';
import 'package:simple_task_app/views/widgets/task_card.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
    required this.filteredTasks,
    required this.onStatusPressed,
  });
  final List<Task> filteredTasks;
  final Function(Task) onStatusPressed;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 90),
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        final task = filteredTasks[index];
        return TaskCard(
          task: task,
          primaryColor: AppColors.primaryColor,
          onStatusPressed: () => onStatusPressed(task),
        );
      },
    );
  }
}
