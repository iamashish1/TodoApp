import 'package:dartz/dartz.dart';

import '../../data/model/todo_model.dart';
import '../respository/todo_repository.dart';

class AddTodo {
  final TodosRepository _todoRepository;

  AddTodo(TodosRepository todoRepository) : _todoRepository = todoRepository;

  Future<Either<String, List<TodoModel>>> call(data) async {
    return await _todoRepository.addTodo( data);
  }
}
