import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/widgets/task_card.dart';

import '../controllers/auth_controller.dart';
import '../controllers/task_controller.dart';
import '../services/database.dart';

class HomePage extends GetWidget<AuthController> {
  final TextEditingController taskController = TextEditingController();

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
                        Text(
                          "You have 8 tasks today",
                          style: TextStyle(fontSize: 16),
                        ),
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
                        controller: taskController,
                        decoration:
                            InputDecoration(hintText: "Nombre de cliente"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.timer),
                      onPressed: () {},
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
                  .addTask(taskController.text, "10:30pm", controller.user.uid);
              taskController.clear();
            }
          },
        ),
      ),
    );
  }

  Container buildCustomAppBar() {
    return Container(
      height: Get.height / 12,
      color: Color(0xff272A27),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("TuTiempo",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xffF2F2F2),
              )),
          Row(
            children: [
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
          )
        ],
      ),
    );
  }
}
