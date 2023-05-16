import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sample/widgets/active_todo_list.dart';
import 'package:todo_app_sample/widgets/all_todo_list.dart';
import 'package:todo_app_sample/widgets/completed_todo_list.dart';
import 'package:todo_app_sample/widgets/new_todo_bottom_sheet.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Active",
              ),
              Tab(
                text: "Completed",
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          AllTodoList(),
          ActiveTodoList(),
          CompletedTodoList(),
        ]),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (ctx) => NewTodoBottomSheet(),
            constraints: const BoxConstraints(maxHeight: 400),
          ),
        ),
      ),
    );
  }
}
