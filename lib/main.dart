import 'package:flutter/material.dart';
import 'package:simple_task_app/core/app_colors.dart';
import 'package:simple_task_app/core/app_strings.dart';
import 'package:simple_task_app/views/screens/home_view.dart';

void main() {
  runApp(const TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
      ),
      home: HomeView(),
    );
  }
}

