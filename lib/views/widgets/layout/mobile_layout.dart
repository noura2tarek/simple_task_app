import 'package:flutter/material.dart';
import 'package:simple_task_app/data/models/task_model.dart';
import 'package:simple_task_app/views/widgets/tasks_list_view.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
    required this.filteredTasks,
    required this.onStatusPressed,
  });
  final List<Task> filteredTasks;
  final void Function(Task task) onStatusPressed;
  @override
  Widget build(BuildContext context) {
    return TasksListView(
      filteredTasks: filteredTasks,
      onStatusPressed: onStatusPressed,
    );
  }
}
