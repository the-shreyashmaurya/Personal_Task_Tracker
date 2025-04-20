import 'package:flutter/material.dart';
import 'package:personal_task_tracker/app/colors.dart';
import 'package:personal_task_tracker/app/fonts.dart';
import 'package:personal_task_tracker/auth/auth_service.dart';
import 'package:personal_task_tracker/auth/login_screen.dart';
import 'package:personal_task_tracker/dashboard/add_task_screen.dart';
import 'package:personal_task_tracker/dashboard/task_model.dart';
import 'package:personal_task_tracker/dashboard/task_tile.dart';
import 'package:personal_task_tracker/provider/task_provider.dart';
import 'package:personal_task_tracker/provider/user_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    context.read<TaskProvider>().refreshList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors().primary,
                      ),
                    ),
                    Text(
                      context.watch<UserProvider>().name,
                      style: TextStyle(fontSize: 22, color: AppColors().white),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () async {
                      // Logout
                      await AuthService().signOut();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    icon: Icon(Icons.logout, color: AppColors().primary),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Search Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Search Box
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    height: 35,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search tasks",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // Search Button
                SizedBox(
                  width: 35,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<TaskProvider>().updateSearchText(
                        searchController.text,
                      );

                      context.read<TaskProvider>().refreshList(context);
                    },
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),
                    child: Icon(Icons.search),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Tasks
            Text("Tasks", style: AppFonts.displaySmall(context)),
            SizedBox(height: 20),

            ListView.builder(
              shrinkWrap: true,
              itemCount: context.watch<TaskProvider>().taskList.length,
              itemBuilder: (context, index) {
                TaskModel task = context.watch<TaskProvider>().taskList[index];
                return TaskTile(
                  taskId: task.id!,
                  userId: context.watch<UserProvider>().userId,
                  title: task.title,
                  description: task.description,
                  status: task.status,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 40,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            );
          },
          style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
          child: Text("+"),
        ),
      ),
    );
  }
}
