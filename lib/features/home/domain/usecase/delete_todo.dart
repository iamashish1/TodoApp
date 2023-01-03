import 'package:dartz/dartz.dart';

import '../../data/model/todo_model.dart';
import '../respository/todo_repository.dart';

class DeleteTodo {
  final TodosRepository _todoRepository;

  DeleteTodo(TodosRepository todoRepository) : _todoRepository = todoRepository;

  Future<Either<String, List<TodoModel>>> call(id) async {
    return await _todoRepository.deleteTodo(id);
  }
}
