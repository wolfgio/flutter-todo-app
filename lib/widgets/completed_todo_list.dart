import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sample/todo_provider.dart';
import 'package:todo_app_sample/widgets/todo_item.dart';

class CompletedTodoList extends ConsumerWidget {
  const CompletedTodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: ListView(
        children: [
          ...ref.watch(completedTodosProvider).map(
                (todo) => TodoItem(
                  id: todo.id,
                  description: todo.description,
                  completed: todo.completed,
                  onPressed: ref.read(todoListProvider.notifier).toggle,
                  onDelete: ref.read(todoListProvider.notifier).remove,
                ),
              ),
        ],
      ),
    );
  }
}
