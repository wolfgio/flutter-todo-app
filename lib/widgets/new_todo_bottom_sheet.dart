import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sample/todo_provider.dart';

class NewTodoBottomSheet extends ConsumerWidget {
  final _textController = TextEditingController();

  NewTodoBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Todo",
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _textController,
              maxLines: 8,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Todo Description....',
                labelText: 'Description',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      ref
                          .read(todoListProvider.notifier)
                          .add(_textController.text);

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
