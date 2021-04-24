import 'package:flutter/material.dart';

abstract class DialogBase<T> {
  const DialogBase();

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      title: title(context) == null
          ? null
          : Padding(
              padding: const EdgeInsets.all(8),
              child: title(context),
            ),
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: content(context),
      ),
      actions: actions(context),
    );
  }

  Future<T?> show(BuildContext context) {
    return showDialog<T>(
      context: context,
      builder: (context) => _dialog(context),
    );
  }

  Widget? title(BuildContext context);

  Widget content(BuildContext context);

  List<Widget> actions(BuildContext context);
}
