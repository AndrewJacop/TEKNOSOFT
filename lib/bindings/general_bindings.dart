import 'package:flutter_t_store/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
