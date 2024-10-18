import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController Controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.Controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade300,
      title: Text('New Task'),
      content: TextField(
        controller: Controller,
        decoration: InputDecoration(hintText: 'Enter your task'),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: onSave,
          child: Text('Save'),
        ),
      ],
    );
  }
}
