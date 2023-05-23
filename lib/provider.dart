import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Todo {
  const Todo({required this.title, this.completed = false});

  final String title;
  final bool completed;

  Todo copyWith({String? title, bool? completed}) {
    return Todo(
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier(super.state);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(String title) {
    state = [
      for (final todo in state)
        if (todo.title != title) todo,
    ];
  }

  void toggle(String title) {
    state = [
      for (final todo in state)
        if (todo.title == title)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

final todosProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier([]);
});

final activeTodos = StateProvider(
    (ref) => ref.watch(todosProvider).where((todo) => !todo.completed));

final completedTodos = StateProvider(
    (ref) => ref.watch(todosProvider).where((todo) => todo.completed));
