import 'package:get/get.dart';
import 'package:get_x_todo/controllers/auth_controller.dart';
import 'package:get_x_todo/models/task_model.dart';
import 'package:get_x_todo/services/database.dart';

class TaskController extends GetxController {
  Rx<List<Task>> _tasks = Rx<List<Task>>();

  List<Task> get tasks => _tasks.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    _tasks.bindStream(Database().taskStream(uid));
    super.onInit();
  }
}
