import 'package:dartz/dartz.dart';

import '../../data/model/todo_model.dart';

abstract class TodosRepository {
  TodosRepository(Object object);

  Future<Either<String, List<TodoModel>>> fetchTodos();
  Future<Either<String, List<TodoModel>>> deleteTodo(String id);
  Future<Either<String, List<TodoModel>>> addTodo(TodoModel todo);
}
