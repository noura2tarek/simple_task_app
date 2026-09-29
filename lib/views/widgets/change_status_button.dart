import 'package:flutter/material.dart';
import 'package:simple_task_app/core/app_colors.dart';
import 'package:simple_task_app/core/app_strings.dart';
import 'package:simple_task_app/core/app_styles.dart';

class ChangeStatusButton extends StatelessWidget {
  const ChangeStatusButton({
    super.key,
    required this.onStatusPressed,
    required this.isCompleted,
  });

  final VoidCallback onStatusPressed;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onStatusPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isCompleted ? Colors.white : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: isCompleted
              ? Border.all(color: AppColors.primaryColor)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isCompleted ? Icons.undo : Icons.check,
              size: 11,
              color: isCompleted ? AppColors.primaryColor : AppColors.white,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                isCompleted ? AppStrings.markPending : AppStrings.markCompleted,
                style: AppStyles.styleSemiBold9(
                  context,
                  color: isCompleted ? AppColors.primaryColor : AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
