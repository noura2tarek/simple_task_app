import 'package:flutter/material.dart';
import 'package:simple_task_app/core/app_colors.dart';
import 'package:simple_task_app/core/app_strings.dart';
import 'package:simple_task_app/core/app_styles.dart';
import 'package:simple_task_app/data/dummy_list.dart';
import 'package:simple_task_app/data/models/task_model.dart';
import 'package:simple_task_app/views/screens/home_body.dart';
import 'package:simple_task_app/views/widgets/add_task_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        elevation: 1,
        titleSpacing: 0,
        title: Text(
          AppStrings.myTasks,
          style: AppStyles.styleSemiBold16(context),
        ),

        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.white,
          indicatorWeight: 3,
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.white70,
          labelStyle: AppStyles.styleMedium14(context),
          tabs: [
            Tab(text: AppStrings.all),
            Tab(text: AppStrings.pending),
            Tab(text: AppStrings.completed),
          ],
        ),
      ),

      body: HomeBody(
        filteredTasks: filteredTasks,
        onStatusPressed: _toggleTaskStatus,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.primaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(Icons.add),
      ),
    );
  }

  //================= Functions =================
  List<Task> get filteredTasks {
    switch (_tabController.index) {
      case 1:
        return tasks
            .where((task) => task.status == TaskStatus.pending)
            .toList();

      case 2:
        return tasks
            .where((task) => task.status == TaskStatus.completed)
            .toList();

      default:
        return tasks;
    }
  }

  void _toggleTaskStatus(Task task) {
    setState(() {
      task.status = task.status == TaskStatus.pending
          ? TaskStatus.completed
          : TaskStatus.pending;
    });
  }

  void _showAddTaskDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppStrings.addTask),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: AppStrings.title),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: AppStrings.description,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(AppStrings.cancel),
            ),
            AddTaskButton(
              onAddTaskPressed: () {
                if (titleController.text.trim().isEmpty) return;

                setState(() {
                  tasks.add(
                    Task(
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim(),
                      status: TaskStatus.pending,
                    ),
                  );
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
