import 'package:flutter/material.dart';
import 'package:simple_task_app/data/models/task_model.dart';
import 'package:simple_task_app/views/widgets/tasks_grid_view.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({
    super.key,
    required this.filteredTasks,
    required this.onStatusPressed,
  });
  final List<Task> filteredTasks;
  final void Function(Task task) onStatusPressed;
  @override
  Widget build(BuildContext context) {
    return TasksGridView(
      filteredTasks: filteredTasks,
      onStatusPressed: onStatusPressed,
    );
  }
}
