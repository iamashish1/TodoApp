import 'package:dartz/dartz.dart';
import 'package:todo_app/features/home/data/data_sources/local/local_data_source.dart';
import 'package:todo_app/features/home/data/model/todo_model.dart';
import 'package:todo_app/features/home/domain/respository/todo_repository.dart';

class TodoRepositoryImpl implements TodosRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<String, List<TodoModel>>> fetchTodos() async {
    try {
      final response = await localDataSource.fetchTodos();
      return Right(response);
    } catch (e) {
      return const Left('An Error occured');
    }
  }

  @override
  Future<Either<String, List<TodoModel>>> deleteTodo(id) async {
    try {
      final response = await localDataSource.deleteTodo(id);
      return Right(response);
    } catch (e) {
      return const Left('An Error occured');
    }
  }
  
  @override
  Future<Either<String, List<TodoModel>>> addTodo(TodoModel todo)async {
     try {
      final response = await localDataSource.addTodo(todo);
      return Right(response);
    } catch (e) {
      return const Left('An Error occured');
    }
   
  }
  
  @override
  Future<Either<String, List<TodoModel>>> editTodo(TodoModel todo)async {

      try {
      final response = await localDataSource.editTodo(todo);
      return Right(response);
    } catch (e) {
      return const Left('An Error occured');
    }
 
  }
}
