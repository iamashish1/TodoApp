import 'package:dartz/dartz.dart';

import '../../data/model/todo_model.dart';
import '../respository/todo_repository.dart';

 class GetTodos {
  final TodosRepository _todoRepository;

  GetTodos(TodosRepository todoRepository) : _todoRepository = todoRepository;

  Future<Either<String, List<TodoModel>>> call() async {
    return await _todoRepository.fetchTodos();
  }
}


