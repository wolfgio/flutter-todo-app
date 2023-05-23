import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sample/provider.dart';

class ActiveTabWidget extends ConsumerWidget {
  const ActiveTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: ref
          .watch(activeTodos)
          .map((todo) => Card(
                child: ListTile(
                  title: Text(todo.title),
                  leading: Icon(todo.completed
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                  onTap: () {
                    ref.read(todosProvider.notifier).toggle(todo.title);
                  },
                  trailing: IconButton(
                      onPressed: () {
                        ref.read(todosProvider.notifier).removeTodo(todo.title);
                      },
                      icon: const Icon(Icons.delete_forever)),
                ),
              ))
          .toList(),
    );
  }
}
