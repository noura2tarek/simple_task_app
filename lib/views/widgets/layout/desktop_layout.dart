import 'package:flutter/material.dart';
import 'package:simple_task_app/data/models/task_model.dart';
import 'package:simple_task_app/views/widgets/layout/tablet_layout.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({
    super.key,
    required this.filteredTasks,
    required this.onStatusPressed,
  });
  final List<Task> filteredTasks;
  final void Function(Task task) onStatusPressed;
  @override
  Widget build(BuildContext context) {
    return TabletLayout(
      filteredTasks: filteredTasks,
      onStatusPressed: onStatusPressed,
    );
  }
}
