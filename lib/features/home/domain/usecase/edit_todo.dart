import 'package:dartz/dartz.dart';

import '../../data/model/todo_model.dart';
import '../respository/todo_repository.dart';

class EditTodo {
  final TodosRepository _todoRepository;

  EditTodo(TodosRepository todoRepository) : _todoRepository = todoRepository;

  Future<Either<String, List<TodoModel>>> call(data) async {
    return await _todoRepository.editTodo( data);
  }
}
