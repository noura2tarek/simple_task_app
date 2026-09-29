import 'package:flutter/material.dart';
import 'package:simple_task_app/data/models/task_model.dart';
import 'package:simple_task_app/views/widgets/layout/adaptive_layout_widget.dart';
import 'package:simple_task_app/views/widgets/layout/desktop_layout.dart';
import 'package:simple_task_app/views/widgets/layout/mobile_layout.dart';
import 'package:simple_task_app/views/widgets/layout/tablet_layout.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.filteredTasks,
    required this.onStatusPressed,
  });

  final List<Task> filteredTasks;
  final Function(Task task) onStatusPressed;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => MobileLayout(
        filteredTasks: filteredTasks,
        onStatusPressed: onStatusPressed,
      ),
      tabletLayout: (context) => TabletLayout(
        filteredTasks: filteredTasks,
        onStatusPressed: onStatusPressed,
      ),
      desktopLayout: (context) => DesktopLayout(
        filteredTasks: filteredTasks,
        onStatusPressed: onStatusPressed,
      ),
    );
  }
}
