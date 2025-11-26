import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:to_do/features/todo/data/model/todo_model.dart';
import 'package:to_do/features/todo/presentation/provider/todo_provider.dart';

class EditTodo extends StatelessWidget {
  final TodoModel todo;
  final String? initialTitle;
  final num? initialPrice;

  EditTodo({
    super.key,
    required this.initialTitle,
    required this.initialPrice,
    required this.todo,
  });
  late final _titleController = TextEditingController(text: initialTitle);
  late final _priceController = TextEditingController(text: "$initialPrice");

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TodoProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
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
              controller: _titleController,
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
              controller: _priceController,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                hintText: 'Enter new price',
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
                    final num? price = num.tryParse(
                      _priceController.text.trim(),
                    );
                    provider.updateTodo(
                      todo.copyWith(
                        title: _titleController.text.trim(),
                        price: price,
                      ),
                    );
                    _priceController.clear();
                    _titleController.clear();

                    Navigator.pop(context);
                    MotionToast.success(
                      
                      description: Text("Todo updated successfully",style: TextStyle(color: Colors.white),),
                    ).show(context);
                  },
                  label: Text('Update Todo'),
                  icon: const Icon(Icons.update),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
