import 'package:to_do/features/todo/data/model/todo_model.dart';
import 'package:to_do/general/core/type_def.dart';

abstract class ITodoRepository {
  FutureResult<List<TodoModel>> getTodos();
  FutureResult<TodoModel> addTodo(TodoModel todo);
  FutureResult<bool> deleteTodo(String id);
  FutureResult<TodoModel> updateTodo(TodoModel todo);
}




