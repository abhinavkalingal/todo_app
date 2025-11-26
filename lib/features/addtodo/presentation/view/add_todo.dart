import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:to_do/features/todo/data/model/todo_model.dart';
import 'package:to_do/features/todo/presentation/provider/todo_provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final addController = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<TodoProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 5,
          children: [
            TextField(
              controller: addController,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                hintText: 'Enter a new todo item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: priceController,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                hintText: 'Enter a  item price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 10.0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (addController.text.isNotEmpty) {
                      final num? price = num.tryParse(
                        priceController.text.trim(),
                      );
                      provider.addTodo(
                        TodoModel(title: addController.text, price: price),
                      );
                      addController.clear();
                      priceController.clear();
                      Navigator.pop(context);
                      MotionToast.success(
                        description: Text(
                          "Todo added successfully",
                          style: TextStyle(color: Colors.white),
                        ),
                      ).show(context);
                    }
                  },
                  label: Text('ADD'),
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


