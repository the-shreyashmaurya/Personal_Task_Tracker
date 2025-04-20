import 'package:flutter/material.dart';
import 'package:personal_task_tracker/app/fonts.dart';
import 'package:personal_task_tracker/dashboard/task_model.dart';
import 'package:personal_task_tracker/provider/task_provider.dart';
import 'package:personal_task_tracker/provider/user_provider.dart';
import 'package:personal_task_tracker/services/supabase_service.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbar
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      "Create New Task",
                      style: AppFonts.displayMedium(context),
                    ),
                  ),

                  // Back button
                  Positioned(
                    left: 0,
                    top: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),

                  //
                ],
              ),
            ),
            SizedBox(height: 30),

            // Task Title
            Text("Task Title", style: AppFonts.displaySmall(context)),
            SizedBox(height: 5),
            TextField(controller: titleController),
            SizedBox(height: 20),

            // Task Description
            Text("Task Description", style: AppFonts.displaySmall(context)),
            SizedBox(height: 5),
            TextField(maxLines: 4, controller: descriptionController),
            SizedBox(height: 40),

            // Create Button
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  await SupabaseService().addTask(
                    TaskModel(
                      userId: context.read<UserProvider>().userId,
                      title: titleController.text,
                      description: descriptionController.text,
                      status: false,
                    ),
                  );

                  context.read<TaskProvider>().refreshList(context);

                  Navigator.pop(context);
                },
                child: Text("Create"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
