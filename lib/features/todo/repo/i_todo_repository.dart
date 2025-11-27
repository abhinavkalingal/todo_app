import 'package:to_do/features/todo/data/model/todo_model.dart';
import 'package:to_do/general/core/type_def.dart';

abstract class ITodoRepository {
  FutureResult<List<TodoModel>> getTodos();
  FutureResult<TodoModel> addTodo(TodoModel todo);
  FutureResult<bool> deleteTodo(String id);
  FutureResult<TodoModel> updateTodo(TodoModel todo);

  FutureResult<int> getTotalTodoCount();
  FutureResult<num> getTotalPrice();
  FutureResult<double> getAveragePrice();

  FutureResult<List<TodoModel>> getTodosByDate({
    required DateTime startDate,
    required DateTime endDate,
  });

  FutureResult<int> getFilteredTodoCount(DateTime start, DateTime end);
  FutureResult<num> getFilteredTotalPrice(DateTime start, DateTime end);
  FutureResult<double> getFilteredAveragePrice(DateTime start, DateTime end);
}


