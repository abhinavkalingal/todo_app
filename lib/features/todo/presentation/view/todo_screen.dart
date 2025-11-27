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
      provider.fetchAnalytics();
      
      // _scrollController.addListener(() {
        
      //   if (_scrollController.position.pixels >=
      //       _scrollController.position.maxScrollExtent - 100) {
      //     final provider = context.read<TodoProvider>();
      //     if (!provider.isLoading && !provider.noMoreData) {
      //       provider.fetchTodos();
      //     }
      //   }
      // });
      _onScroll();
    });
  }

  void _onScroll() {
  _scrollController.addListener(() {
    final provider = context.read<TodoProvider>();

    // Prevent unnecessary pagination
    if (provider.isLoading) return;
    if (provider.noMoreData) return;

    // Do NOT paginate when list is empty
    if (provider.todos.isEmpty) return;

    // Detect bottom safely
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      provider.fetchTodos();
    }
  });
}



  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.dashboard_customize_outlined),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              final range = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );

              if (range != null) {
              await  context.read<TodoProvider>().applyDateFilter(
                  range.start,
                  range.end,
                );
              }
             
            },
            icon: const Icon(Icons.date_range),
            label: const Text("Choose Date Range"),
          ),
        ],
      ),
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
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.isDateFiltered
                        ? "Filtered Analytics"
                        : "All Todos Analytics",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "Total Todos: ${provider.totalCount}",
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Total Price: ₹${provider.totalPrice}",
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 6),
                  

                  Text(
                    "Average Price: ₹${provider.avgPrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            Expanded(
              child: provider.todos.isEmpty && !provider.isLoading
                  ? const Center(child: Text("No todos found"))
                  : ListView.separated(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),

                      itemCount:
                          provider.todos.length +
                          (provider.isLoading && !provider.noMoreData ? 1 : 0),

                      separatorBuilder: (_, __) => const SizedBox(height: 10),

                      itemBuilder: (context, index) {
                        if (index == provider.todos.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final todo = provider.todos[index];

                        return ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          title: Text(todo.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${todo.price}'),
                              Text(
                                "Created At: ${todo.createdAt!.toDate().day}/${todo.createdAt!.toDate().month}/${todo.createdAt!.toDate().year}",
                              ),
                            ],
                          ),

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
                                      builder: (_) => EditTodo(
                                        initialTitle: todo.title,
                                        initialPrice: todo.price,
                                        todo: todo,
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
                                  provider.deleteTodo(todo.id!);
                                  Flushbar(
                                    message: "Deleted Successfully",
                                    duration: const Duration(seconds: 1),
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
