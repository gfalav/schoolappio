import 'package:get/get.dart';

class AppController extends GetxController {
  final isMobile = false.obs;
  final codeIcon = 0.obs;
  final title = ''.obs;
  final showActions = true.obs;
  final showDrawer = true.obs;
  final leftProportion = 30.obs;

  void setIsMobile(bool value) {
    isMobile.value = value;
    update();
  }

  void setAppState(
    int codeIcon,
    String title,
    bool showActions,
    bool showDrawer,
    int leftProportion,
  ) {
    this.codeIcon.value = codeIcon;
    this.title.value = title;
    this.showActions.value = showActions;
    this.showDrawer.value = showDrawer;
    this.leftProportion.value = leftProportion;
    update();
  }
}
