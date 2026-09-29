class Task {
  final String title;
  final String description;
  TaskStatus status;

  Task({required this.title, required this.description, required this.status});
}

enum TaskStatus { pending, completed }
