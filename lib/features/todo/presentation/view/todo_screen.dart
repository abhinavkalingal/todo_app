import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/features/addtodo/presentation/view/add_todo.dart';
import 'package:to_do/features/edit_todo/presentation/view/edit_todo.dart';
import 'package:to_do/features/todo/presentation/provider/todo_provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<TodoProvider>();

      provider.resetPagination();
      provider.fetchTodos();
      _scrollController.addListener(() {
        final provider = context.read<TodoProvider>();

        // preload slightly before the absolute bottom
        final reachedBottom =
            _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200;

        if (reachedBottom && !provider.isLoading && !provider.noMoreData) {
          provider.fetchTodos();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodo()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: provider.todos.isEmpty && !provider.isLoading
                  ? const Center(child: Text("No todos found"))
                  : ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _scrollController,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemCount:
                          provider.todos.length +
                          (provider.isLoading && !provider.noMoreData ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == provider.todos.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final todolist = provider.todos[index];
                        return ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          title: Text(todolist.title),
                          subtitle: Text('${todolist.price}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.deepPurple,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditTodo(
                                        initialTitle: todolist.title,
                                        initialPrice: todolist.price,
                                        todo: todolist,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  provider.deleteTodo(todolist.id!);

                                  Flushbar(
                                    message: "Deleted Successfully",
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: Colors.red,
                                  ).show(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
