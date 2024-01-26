import 'dart:io';

class TodoList {
  List<Map<String, dynamic>> tasks;

  TodoList() : tasks = [];

  void addTask(String task) {
    tasks.add({'task': task, 'completed': false});
  }

  void viewTasks() {
    for (int i = 0; i < tasks.length; i++) {
      String status = tasks[i]['completed'] ? 'Done' : 'Pending';
      print("${i + 1}. ${tasks[i]['task']} - $status");
    }
  }

  void completeTask(int taskNumber) {
    if (taskNumber > 0 && taskNumber <= tasks.length) {
      tasks[taskNumber - 1]['completed'] = true;
      print("Task marked as completed.");
    } else {
      print("Invalid task number.");
    }
  }

  void deleteTask(int taskNumber) {
    if (taskNumber > 0 && taskNumber <= tasks.length) {
      tasks.removeAt(taskNumber - 1);
      print("Task deleted.");
    } else {
      print("Invalid task number.");
    }
  }
}

void main() {
  TodoList todoList = TodoList();

  while (true) {
    print("\nTo-Do List");
    print("1. Add Task");
    print("2. View Tasks");
    print("3. Complete Task");
    print("4. Delete Task");
    print("5. Exit");
    print("Enter your choice: ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        print("Enter the task: ");
        String task = stdin.readLineSync()!;
        todoList.addTask(task);
        break;
      case '2':
        todoList.viewTasks();
        break;
      case '3':
        print("Enter task number to mark as complete: ");
        int taskNumber = int.parse(stdin.readLineSync()!);
        todoList.completeTask(taskNumber);
        break;
      case '4':
        print("Enter task number to delete: ");
        taskNumber = int.parse(stdin.readLineSync()!);
        todoList.deleteTask(taskNumber);
        break;
      case '5':
        return;
      default:
        print("Invalid choice. Please enter a number between 1 and 5.");
    }
  }
}
