import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String id;
  final String description;
  final bool completed;
  final Function(String id) onPressed;
  final Function(String id) onDelete;

  const TodoItem({
    super.key,
    required this.id,
    required this.description,
    required this.onPressed,
    required this.onDelete,
    this.completed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          completed
              ? Icons.check_box_outlined
              : Icons.check_box_outline_blank_outlined,
        ),
        title: Text(description),
        trailing: IconButton(
          icon: const Icon(Icons.delete_forever),
          onPressed: () => onDelete(id),
        ),
        onTap: () => onPressed(id),
      ),
    );
  }
}
