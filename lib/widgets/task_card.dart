import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_todo/services/database.dart';
import '../models/task_model.dart';

class TaskCard extends StatelessWidget {
  final String uid;
  final TaskModel task;

  const TaskCard({
    Key key,
    this.uid,
    this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: Get.height / 10,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xff272A27)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(task.time, style: Theme.of(context).textTheme.headline1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(task.title, style: Theme.of(context).textTheme.headline2),
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.edit, color: Color(0xff2AA1F6)),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.delete,
                        color: Color(0xffFF5454),
                      ),
                      onTap: () {
                        Database().deleteTask(uid, task.taskId);
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
