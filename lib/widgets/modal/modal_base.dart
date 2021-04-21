import 'package:flutter/material.dart';

abstract class ModalBase<T> {
  const ModalBase();

  Widget _modal(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: modalContent(context),
      ),
    );
  }

  Future<T?> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return _modal(context);
      },
    );
  }

  Widget modalContent(BuildContext context);
}
