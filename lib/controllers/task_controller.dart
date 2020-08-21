import 'package:get/get.dart';
import 'package:get_x_todo/controllers/auth_controller.dart';
import 'package:get_x_todo/models/task_model.dart';
import 'package:get_x_todo/services/database.dart';

class TaskModelController extends GetxController {
  Rx<List<TaskModel>> _taskModelsList = Rx<List<TaskModel>>();

  List<TaskModel> get tasks => _taskModelsList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    _taskModelsList
          .bindStream(Database().taskStream(uid));
  }
}
