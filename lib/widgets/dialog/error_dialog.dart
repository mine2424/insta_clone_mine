import 'package:flutter/material.dart';

import 'package:insta_clone/widgets/dialog/dialog_base.dart';

class ErrorDialog extends DialogBase<void> {
  const ErrorDialog(this.message) : super();

  final String message;

  @override
  Widget? title(BuildContext context) {
    return Text('エラー');
  }

  @override
  Widget content(BuildContext context) {
    return Text(message);
  }

  @override
  List<Widget> actions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {},
        child: Text('閉じる'),
      )
    ];
  }
}
