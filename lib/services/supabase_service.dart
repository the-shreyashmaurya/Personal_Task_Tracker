import 'package:personal_task_tracker/dashboard/task_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final database = Supabase.instance.client.from("tasks");

  // Get Task List
  Future<List<TaskModel>> getTaskList(String userId) async {
    final response = await database.select().eq("userId", userId);
    return response.map((e) => TaskModel.fromMap(e)).toList();
  }

  // Get Task List Search
  Future<List<TaskModel>> getTaskListSearch(
    String userId,
    String searchText,
  ) async {
    final response = await database
        .select()
        .eq("userId", userId)
        .ilike("title", '%$searchText%');
    return response.map((e) => TaskModel.fromMap(e)).toList();
  }

  // Add task to database
  Future<void> addTask(TaskModel taskModel) async {
    await database.insert(taskModel.toMap());
  }

  // Update task in Database
  Future<void> updateTask(TaskModel taskModel) async {
    await database.update(taskModel.toMap()).eq("id", taskModel.id!);
  }

  // Delete Task
  Future<void> deleteTask(int taskId) async {
    await database.delete().eq("id", taskId);
  }
}
