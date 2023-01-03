part of 'todo_tasks_bloc.dart';

@freezed
class TodoTasksEvent with _$TodoTasksEvent {
  const factory TodoTasksEvent.started() = _Started;
    const factory TodoTasksEvent.create(
      TodoModel todo
    ) = _Create;
const factory TodoTasksEvent.delete(
      String id
    ) = _Delete;
    const factory TodoTasksEvent.edit(
     TodoModel todo
    ) = _Edit;
  
}