import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:flutter/material.dart';

class DialogUtility {
  bool isShowing = false;

  void showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const LoadingWidget();
        });
    isShowing = true;
  }

  void hide(BuildContext context) {
    if (isShowing) {
      Navigator.pop(context);
      isShowing = false;
    }
  }
}

class EasyLoading {
  EasyLoading._();
  static OverlayEntry? _overlayEntry;
  static bool _isShow = false;

  static void show(BuildContext context) {
    dismiss();
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.white38,
        alignment: Alignment.center,
        child: const LoadingWidget(),
      ),
    );
    if (overlay != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        overlay.insert(_overlayEntry!);
        _isShow = true;
      });
    }
  }

  static void dismiss() {
    if (_isShow) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _isShow = false;
    }
  }
}
