import 'package:get/get.dart';
import 'package:get_x_todo/controllers/auth_controller.dart';
import 'package:get_x_todo/models/task_model.dart';
import 'package:get_x_todo/services/database.dart';

class TaskController extends GetxController {
  Rx<List<Task>> _tasksList = Rx<List<Task>>();

  List<Task> get tasks => _tasksList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    _tasksList.bindStream(Database().taskStream(uid));
  }
}
