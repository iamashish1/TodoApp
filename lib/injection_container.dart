import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/home/data/data_sources/local/local_data_source.dart';
import 'package:todo_app/features/home/domain/usecase/delete_todo.dart';
import 'package:todo_app/features/home/domain/usecase/get_todos.dart';
import 'package:todo_app/features/home/presentation/bloc/bloc/todo_tasks_bloc.dart';

import 'features/home/data/repositories/todo_repository_implementation.dart';
import 'features/home/domain/respository/todo_repository.dart';
import 'features/home/domain/usecase/create_todo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<TodoTasksBloc>(
    () => TodoTasksBloc(
      createTodo: sl(),
      getTodos: sl(),
      deleteTodo: sl()
    ),
  );
sl.registerLazySingleton(()=>DeleteTodo(sl()));
  sl.registerLazySingleton(()=>AddTodo(sl()));
  sl.registerLazySingleton(() => GetTodos(sl()));
  sl.registerLazySingleton<TodosRepository>(
      () => TodoRepositoryImpl(localDataSource: sl()));

  sl.registerLazySingleton<TodoLocalDataSource>(
      () => LocalDataSourceImpl());


}
