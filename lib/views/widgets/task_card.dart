import 'package:flutter/material.dart';
import 'package:simple_task_app/core/app_colors.dart';
import 'package:simple_task_app/core/app_styles.dart';
import 'package:simple_task_app/data/models/task_model.dart';
import 'package:simple_task_app/views/widgets/change_status_button.dart';
import 'package:simple_task_app/views/widgets/status_badge.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Color primaryColor;
  final VoidCallback onStatusPressed;
  final bool inGrid;

  const TaskCard({
    super.key,
    this.inGrid = false,
    required this.task,
    required this.primaryColor,
    required this.onStatusPressed,
  });

  bool get isCompleted => task.status == TaskStatus.completed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding:  EdgeInsets.fromLTRB(10, 11, 10, inGrid? 15: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  task.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleBold12(
                    context,
                    color: isCompleted ? AppColors.grey500 : AppColors.black87,
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              StatusBadge(status: task.status),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            task.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleRegular10(
              context,
              color: isCompleted ? AppColors.grey500 : AppColors.grey700,
              decoration: isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),

          const SizedBox(height: 10),
          if (inGrid) Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: ChangeStatusButton(
              onStatusPressed: onStatusPressed,
              isCompleted: isCompleted,
            ),
          ),
        ],
      ),
    );
  }
}
