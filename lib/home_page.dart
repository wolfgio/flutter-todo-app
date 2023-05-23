import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sample/active_tab.dart';
import 'package:todo_app_sample/all_tab.dart';
import 'package:todo_app_sample/provider.dart';

import 'completed_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "All"),
              Tab(text: "Active"),
              Tab(text: "Done"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllTabWidget(),
            ActiveTabWidget(),
            CompletedTabWidget(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return BottomSheetWidget();
                },
              );
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}

class BottomSheetWidget extends ConsumerWidget {
  BottomSheetWidget({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Create Item'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(todosProvider.notifier)
                      .addTodo(Todo(title: controller.text));
                  Navigator.of(context).pop();
                },
                child: const Text("Create"))
          ],
        ),
      ),
    );
  }
}
