import 'package:flutter_easyloading/flutter_easyloading.dart';

class ToastView {
  static void show(String content) {
    EasyLoading.dismiss();
    EasyLoading.showToast(
      content,
      dismissOnTap: true,
      toastPosition: EasyLoadingToastPosition.center,
      maskType: EasyLoadingMaskType.clear,
    );
  }

  static void withBottom(String content) {
    EasyLoading.dismiss();
    EasyLoading.showToast(
      content,
      dismissOnTap: true,
      toastPosition: EasyLoadingToastPosition.bottom,
      maskType: EasyLoadingMaskType.clear,
    );
  }
}
