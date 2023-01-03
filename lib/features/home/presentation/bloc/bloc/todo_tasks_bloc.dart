import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/features/home/data/model/todo_model.dart';
import 'package:todo_app/features/home/domain/usecase/delete_todo.dart';
import 'package:todo_app/features/home/domain/usecase/edit_todo.dart';

import '../../../domain/usecase/create_todo.dart';
import '../../../domain/usecase/get_todos.dart';

part 'todo_tasks_event.dart';
part 'todo_tasks_state.dart';
part 'todo_tasks_bloc.freezed.dart';

class TodoTasksBloc extends Bloc<TodoTasksEvent, TodoTasksState> {
  final GetTodos _getTodos;
  final AddTodo _createTodo;
  final DeleteTodo _deleteTodo;
  final EditTodo _editTodo;
  TodoTasksBloc({required GetTodos getTodos,
  required AddTodo createTodo,
  required EditTodo editTodo,
  required DeleteTodo deleteTodo
  
  })
      : _getTodos = getTodos,
      _editTodo=editTodo,
      _deleteTodo=deleteTodo,
      _createTodo=createTodo,
        super(const _Initial()) {
    on<TodoTasksEvent>((event, emit) {
    });
     on<_Started>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final isSuccessful = await _getTodos.call();
      
      isSuccessful.fold(
        (l) => {emit(state.copyWith(isLoading: false, error: 'Load Failed'))},
        (r) => emit(
          TodoTasksState.fetched(isLoading: false, error: null, data: r),
        ),
      );
    });
     on<_Create>((event, emit) async {
     
      final isSuccessful = await _createTodo.call(event.todo);
      
      isSuccessful.fold(
        (l) => {emit(state.copyWith(isLoading: false, error: 'Add Failed'))},
        (r) => emit(
          TodoTasksState.fetched(isLoading: false, error: null, data: r),
        ),
      );
    });

    on<_Delete>((event, emit) async {
     
      final isSuccessful = await _deleteTodo.call(event.id);
      
      isSuccessful.fold(
        (l) => {emit(state.copyWith(isLoading: false, error: 'Delete Failed'))},
        (r) => emit(
          TodoTasksState.fetched(isLoading: false, error: null, data: r),
        ),
      );
    });

     on<_Edit>((event, emit) async {
     
      final isSuccessful = await _editTodo.call(event.todo);
      
      isSuccessful.fold(
        (l) => {emit(state.copyWith(isLoading: false, error: 'Edit Failed'))},
        (r) => emit(
          TodoTasksState.fetched(isLoading: false, error: null, data: r),
        ),
      );
    });
  }
}
