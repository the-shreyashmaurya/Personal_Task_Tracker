import 'package:flutter/material.dart';
import 'package:personal_task_tracker/dashboard/task_model.dart';
import 'package:personal_task_tracker/provider/user_provider.dart';
import 'package:personal_task_tracker/services/supabase_service.dart';
import 'package:provider/provider.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskList = [];
  String searchText = "";

  // Refresh List
  void refreshList(BuildContext context) async {
    if (searchText == "") {
      taskList = await SupabaseService().getTaskList(
        context.read<UserProvider>().userId,
      );
    } else {
      taskList = await SupabaseService().getTaskListSearch(
        context.read<UserProvider>().userId,
        searchText,
      );
    }
    notifyListeners();
  }

  // Update Search Text
  void updateSearchText(String newText) {
    searchText = newText;
  }
}
