import 'package:get/get.dart';

import 'controllers/robot_controller.dart';

class InitDep implements Bindings {
  @override
  void dependencies() {
    Get.put(RobotController());
  }
}
