import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/widgets/task_card.dart';

import '../controllers/auth_controller.dart';
import '../controllers/task_controller.dart';
import '../services/database.dart';

class HomePage extends GetWidget<AuthController> {
  final TextEditingController taskController = TextEditingController();
  String time;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TuTiempo"),
          backgroundColor: Color(0xff272A27),
          actions: [
            GestureDetector(
              onTap: () => controller.signOut(),
              child: Icon(
                Icons.exit_to_app,
                color: Color(0xffF2F2F2),
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.wb_sunny,
              color: Color(0xffF2F2F2),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tasks",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("You have 8 today"),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "clear".toUpperCase(),
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) => {
                          if (taskController.text != "")
                            {
                              Database().addTask(taskController.text, time,
                                  controller.user.uid),
                              taskController.clear()
                            }
                        },
                        controller: taskController,
                        decoration:
                            InputDecoration(hintText: "Nombre de cliente"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.timer),
                      onPressed: () async {
                        TimeOfDay picked = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        time = picked.format(context).toString();
                      },
                    )
                  ],
                ),
              ),
              GetX<TaskModelController>(
                init: Get.put<TaskModelController>(TaskModelController()),
                builder: (TaskModelController tcontroller) {
                  if (tcontroller != null && tcontroller.tasks != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: tcontroller.tasks.length,
                        itemBuilder: (_, index) {
                          return TaskCard(
                            task: tcontroller.tasks[index],
                            uid: controller.user.uid,
                          );
                        },
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (taskController.text != "") {
              Database()
                  .addTask(taskController.text, time, controller.user.uid);
              taskController.clear();
            }
          },
        ),
      ),
    );
  }
}
