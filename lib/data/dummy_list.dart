  import 'package:simple_task_app/data/models/task_model.dart';

final List<Task> tasks = [
    Task(
      title: 'Buy Groceries',
      description: 'Milk, eggs, and bread for the week.',
      status: TaskStatus.pending,
    ),
    Task(
      title: 'Finish Project UI',
      description: 'Complete the high-fidelity designs for Tasky app.',
      status: TaskStatus.completed,
    ),
    Task(
      title: 'Call Mom',
      description: 'Discuss the weekend plans and catch up.',
      status: TaskStatus.pending,
    ),
  ];
