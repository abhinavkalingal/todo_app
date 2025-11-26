import 'package:flutter/foundation.dart';
import 'package:to_do/features/todo/data/model/todo_model.dart';
import 'package:to_do/features/todo/repo/todo_repository.dart';

class TodoProvider extends ChangeNotifier {
  final TodoRepository repo;

  TodoProvider(this.repo);

  List<TodoModel> todos = [];
  bool isLoading = false;
  bool noMoreData = false;
  String? error;

  Future<void> fetchTodos() async {
    if (isLoading || noMoreData) return;

    isLoading = true;
    notifyListeners();

    final result = await repo.getTodos();

    result.fold(
      (failure) {
        error = failure.errMsg;
      },
      (list) {
        todos.addAll(list);
        error = null;

        if (list.isEmpty) {
          noMoreData = true; // only when repo hits end
        }
      },
    );

    isLoading = false;
    notifyListeners();
  }


    void resetPagination() {
    repo.resetPagination();
    todos.clear();
    noMoreData = false;
    isLoading = false;
    error = null;
    notifyListeners();
  }


  Future<void> addTodo(TodoModel model) async {
    final result = await repo.addTodo(model);

    result.fold(
      (failure) {
        return error = failure.errMsg;
      },
      (todo) {
        todos.insert(0, todo);
      },
    );

    notifyListeners();
  }

    Future<void> deleteTodo(String docId) async {
    final result = await repo.deleteTodo(docId);

    result.fold(
      (failure) {
        error = failure.errMsg;
      },
      (_) {
        todos.removeWhere((t) => t.id == docId);
        // ❌ don't resetPagination() + fetchTodos() here
      },
    );

    notifyListeners();
  }

  Future<void> updateTodo(TodoModel todo) async {
    final result = await repo.updateTodo(todo);

    result.fold(
      (failure) {
        return error = failure.errMsg;
      },
      (updated) {
        final index = todos.indexWhere((t) {
          return t.id == updated.id;
        });

        if (index != -1) {
          todos[index] = updated;
        }
      },
    );

    notifyListeners();
  }
}
