import 'package:flutter/material.dart';
import 'package:personal_task_tracker/app/colors.dart';
import 'package:personal_task_tracker/app/fonts.dart';
import 'package:personal_task_tracker/dashboard/task_model.dart';
import 'package:personal_task_tracker/provider/task_provider.dart';
import 'package:personal_task_tracker/services/supabase_service.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final int taskId;
  final String userId;
  final String title;
  final String description;
  final bool status;
  

  const TaskTile({
    super.key,
    required this.taskId,
    required this.userId,
    required this.title,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 2, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().textFieldDark,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Checkbox
          //
          SizedBox(
            width: 40,
            height: 40,

            child: IconButton(
              onPressed: () async {
                // Update status
                await SupabaseService().updateTask(
                  TaskModel(
                    id: taskId,
                    userId: userId,
                    title: title,
                    description: description,
                    status: status ? false : true,
                  ),
                );
                // Refresh the list
                context.read<TaskProvider>().refreshList(context);
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),

              icon: Icon(
                status ? Icons.check_circle_outline : Icons.circle_outlined,
                color: AppColors().primary,
                size: 20,
              ),
            ),
          ),

          // Details
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(title, style: AppFonts.display16(context)),

                // Description
                Text(description, style: TextStyle(fontSize: 12)),
              ],
            ),
          ),

          // Delete Button
          SizedBox(
            width: 40,
            height: 40,

            child: IconButton(
              onPressed: () async {
                await SupabaseService().deleteTask(taskId);

                context.read<TaskProvider>().refreshList(context);
              },

              icon: Icon(Icons.delete, color: AppColors().primary, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
