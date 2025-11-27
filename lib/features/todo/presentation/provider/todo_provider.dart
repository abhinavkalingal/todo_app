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

  int totalCount = 0;
  num totalPrice = 0;
  double avgPrice = 0;

  bool isDateFiltered = false;

  Future<void> fetchTodos() async {
  if (isLoading || noMoreData) return;

  isLoading = true;
  notifyListeners();

  final result = await repo.getTodos();

  result.fold(
    (f) => error = f.errMsg,
    (list) {
      if (list.isEmpty) {
        noMoreData = true;
      } else {
        todos.addAll(list); 
      }
    },
  );

  isLoading = false;
  notifyListeners();
}


  void resetPagination() {
    repo.resetPagination();
    todos=[];
    noMoreData = false;
    isLoading = false;
    error = null;
    notifyListeners();
  }

  Future<void> addTodo(TodoModel model) async {
    final result = await repo.addTodo(model);

    result.fold((f) => error = f.errMsg, (todo) => todos.insert(0, todo));

    notifyListeners();
  }

  Future<void> deleteTodo(String docId) async {
    final result = await repo.deleteTodo(docId);

    result.fold(
      (f) => error = f.errMsg,
      (_) => todos.removeWhere((t) => t.id == docId),
    );
    await fetchAnalytics();

    notifyListeners();
  }

  Future<void> updateTodo(TodoModel todo) async {
    final result = await repo.updateTodo(todo);

    result.fold((f) => error = f.errMsg, (updated) {
      final index = todos.indexWhere((t) => t.id == updated.id);
      if (index != -1) todos[index] = updated;
    });

    notifyListeners();
  }

  Future<void> fetchAnalytics() async {
    final count = await repo.getTotalTodoCount();
    count.fold((e) => error = e.errMsg, (v) => totalCount = v);

    final sum = await repo.getTotalPrice();
    sum.fold((e) => error = e.errMsg, (v) => totalPrice = v);

    final avg = await repo.getAveragePrice();
    avg.fold((e) => error = e.errMsg, (v) => avgPrice = v);

    notifyListeners();
  }

  Future<void> applyDateFilter(DateTime start, DateTime end) async {
  isDateFiltered = true;

  resetPagination();


  final endExclusive = DateTime(end.year, end.month, end.day + 1);

  await fetchTodosByDate(start, endExclusive);
  await fetchFilteredAnalytics(start, endExclusive);
}


  Future<void> fetchTodosByDate(DateTime start, DateTime end) async {
    isLoading = true;
    notifyListeners();

    final result = await repo.getTodosByDate(startDate: start, endDate: end);

    result.fold((f) => error = f.errMsg, (list) => todos.addAll(list));

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchFilteredAnalytics(DateTime start, DateTime end) async {
    final count = await repo.getFilteredTodoCount(start, end);
    count.fold((e) => error = e.errMsg, (v) => totalCount = v);

    final sum = await repo.getFilteredTotalPrice(start, end);
    sum.fold((e) => error = e.errMsg, (v) => totalPrice = v);

    final avg = await repo.getFilteredAveragePrice(start, end);
    avg.fold((e) => error = e.errMsg, (v) => avgPrice = v);

    notifyListeners();
  }

  Future<void> clearFilter() async {
    isDateFiltered = false;
    resetPagination();
    await fetchTodos();
    await fetchAnalytics();
  }
}
