import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do/features/todo/data/model/todo_model.dart';
import 'package:to_do/features/todo/repo/i_todo_repository.dart';
import 'package:to_do/general/core/failures/main_failure.dart';
import 'package:to_do/general/core/type_def.dart';
import 'package:to_do/general/utils/firebase_collectons.dart';

@LazySingleton(as: ITodoRepository)
class TodoRepository implements ITodoRepository {
  final FirebaseFirestore _db;
  DocumentSnapshot? _lastDoc;

  bool _noMoreData = false;

  TodoRepository(this._db);

  DateTime nextDay(DateTime date) {
    return DateTime(date.year, date.month, date.day + 1);
  }

  @override
  FutureResult<List<TodoModel>> getTodos() async {
    if (_noMoreData) return right([]);

    const limit = 7;

    try {
      Query query = _db
          .collection(FirebaseCollectons.todo)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (_lastDoc != null) {
        query = query.startAfterDocument(_lastDoc!);
      }

      final snapshot = await query.get();
      if (snapshot.docs.isEmpty) {
        _noMoreData = true;
      } else {
        _lastDoc = snapshot.docs.last;
        if (snapshot.docs.length < limit) _noMoreData = true;
      }

      final list = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return TodoModel.fromMap(data);
      }).toList();

      return right(list);
    } catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  @override
  FutureResult<TodoModel> addTodo(TodoModel todo) async {
    try {
      final doc = _db.collection(FirebaseCollectons.todo).doc();
      final now = Timestamp.now();

      await doc.set({
        'id': doc.id,
        'title': todo.title,
        'description': todo.description ?? '',
        'price': todo.price,
        'createdAt': now,
      });

      final model = todo.copyWith(id: doc.id, createdAt: now);
      return right(model);
    } catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  @override
  FutureResult<bool> deleteTodo(String docId) async {
    try {
      await _db.collection(FirebaseCollectons.todo).doc(docId).delete();
      return right(true);
    } catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  @override
  FutureResult<TodoModel> updateTodo(TodoModel todo) async {
    try {
      await _db
          .collection(FirebaseCollectons.todo)
          .doc(todo.id!)
          .update(todo.toMap());
      return right(todo);
    } catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  void resetPagination() {
    _lastDoc = null;
    _noMoreData = false;
  }

 
  @override
  FutureResult<int> getTotalTodoCount() async {
    try {
      final result = await _db.collection(FirebaseCollectons.todo).count().get();
      return right(result.count ?? 0);
    } catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  @override
  FutureResult<num> getTotalPrice() async {
    try {
      final result = await _db
          .collection(FirebaseCollectons.todo)
          .aggregate(sum('price'))
          .get();

      return right(result.getSum('price') ?? 0);
    } catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  @override
  FutureResult<double> getAveragePrice() async {
    try {
      final result = await _db
          .collection(FirebaseCollectons.todo)
          .aggregate(average('price'))
          .get();

      return right(result.getAverage('price') ?? 0.0);
    } catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  
  @override
  FutureResult<List<TodoModel>> getTodosByDate({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    if (_noMoreData) return right([]);

    const limit = 7;

    try {
      final Timestamp startTs = Timestamp.fromDate(startDate);
      final Timestamp endExclusive = Timestamp.fromDate(nextDay(endDate));

      Query query = _db
          .collection(FirebaseCollectons.todo)
          .where('createdAt', isGreaterThanOrEqualTo: startTs)
          .where('createdAt', isLessThan: endExclusive)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (_lastDoc != null) {
        query = query.startAfterDocument(_lastDoc!);
      }

      final snapshot = await query.get();
      if (snapshot.docs.isEmpty) {
        _noMoreData = true;
      } else {
        _lastDoc = snapshot.docs.last;
        if (snapshot.docs.length < limit) _noMoreData = true;
      }

      final list = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return TodoModel.fromMap(data);
      }).toList();

      return right(list);
    } catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  
  @override
  FutureResult<int> getFilteredTodoCount(DateTime start, DateTime end) async {
    try {
      final s = Timestamp.fromDate(start);
      final e = Timestamp.fromDate(nextDay(end));

      final count = await _db
          .collection(FirebaseCollectons.todo)
          .where('createdAt', isGreaterThanOrEqualTo: s)
          .where('createdAt', isLessThan: e)
          .count()
          .get();

      return right(count.count ?? 0);
    } catch (e) {
      return left(MainFailure.generalFailure(errMsg: e.toString()));
    }
  }

  @override
FutureResult<num> getFilteredTotalPrice(DateTime start, DateTime end) async {
  try {
    final s = Timestamp.fromDate(start);
    final e = Timestamp.fromDate(nextDay(end));

    final result = await _db
        .collection(FirebaseCollectons.todo)
        .where('createdAt', isGreaterThanOrEqualTo: s)
        .where('createdAt', isLessThan: e)
        .aggregate(sum('price'))
        .get();

    return right(result.getSum('price') ?? 0);
  } catch (e) {
    return left(MainFailure.generalFailure(errMsg: e.toString()));
  }
}


 @override
FutureResult<double> getFilteredAveragePrice(DateTime start, DateTime end) async {
  try {
    final s = Timestamp.fromDate(start);
    final e = Timestamp.fromDate(nextDay(end));

    final result = await _db
        .collection(FirebaseCollectons.todo)
        .where('createdAt', isGreaterThanOrEqualTo: s)
        .where('createdAt', isLessThan: e)
        .aggregate(average('price'))
        .get();

    return right(result.getAverage('price') ?? 0.0);
  } catch (e) {
    return left(MainFailure.generalFailure(errMsg: e.toString()));
  }
}

}
