import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  final box = GetStorage();
  RxDouble textFontSize = 15.0.obs;
  RxString textFontFamily = "Readex Pro".obs;
  RxDouble familyValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  void changeFontSize(double value) {
    textFontSize.value = value;
    saveSettings();
  }

  void changeFontFamily(double value) {
    familyValue.value = value;
    switch (familyValue.value) {
      case 0:
        textFontFamily.value = "Readex Pro";
        break;
      case 1:
        textFontFamily.value = "Lalezar";

        break;
      case 2:
        textFontFamily.value = "Markazi Text";
        break;
      default:
    }
    saveSettings();
  }

  void saveSettings() {
    box.write('fontSize', textFontSize.value);

    box.write('fontFamily', textFontFamily.value);
    box.write('fontFamilyValue', familyValue.value);
  }

  void loadSettings() {
    familyValue.value = box.read('fontFamilyValue') ?? 0.0;

    textFontSize.value = box.read('fontSize') ?? 15.0;

    textFontFamily.value = box.read('fontFamily') ?? "Readex Pro";
  }
}
