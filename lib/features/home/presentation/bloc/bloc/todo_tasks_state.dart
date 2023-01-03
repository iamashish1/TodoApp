part of 'todo_tasks_bloc.dart';

@freezed
class TodoTasksState with _$TodoTasksState {
  const factory TodoTasksState.initial({
    @Default(false) bool isLoading,
    String? error,
  }) = _Initial;
    const factory TodoTasksState.fetched(
      {
    @Default(false) bool isLoading,
    String? error,
    required List<TodoModel> data,
  }
    ) = _Fetched;

}
