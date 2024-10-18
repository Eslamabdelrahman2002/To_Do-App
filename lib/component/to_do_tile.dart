import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final bool value;
  final String taskName;
  final Function(bool?) onChanged;
  final Function(BuildContext) deleteFunction;

  const ToDoTile({
    super.key,
    required this.value,
    required this.taskName,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        // The action pane defines the side of the slidable
        endActionPane: ActionPane(
          motion: const DrawerMotion(), // Motion for sliding animation
          children: [
            // Delete button
            SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: value,
                onChanged: onChanged,
              ),
              // Task Name
              Expanded(child: Text(taskName)),
            ],
          ),
        ),
      ),
    );
  }
}
