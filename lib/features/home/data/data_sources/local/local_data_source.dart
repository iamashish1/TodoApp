import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/home/data/model/todo_model.dart';
import 'package:todo_app/features/home/domain/usecase/create_todo.dart';
import 'package:todo_app/features/home/domain/usecase/delete_todo.dart';

import '../../../../../core/utils/constants.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> fetchTodos();
  Future<List<TodoModel>> deleteTodo(String id);
  Future<List<TodoModel>> addTodo(TodoModel todo);
}

class LocalDataSourceImpl implements TodoLocalDataSource {
  @override
  Future<List<TodoModel>> fetchTodos() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final response = preferences.getString(Consts.todos);
      if (response != null) {
        final todos = jsonDecode(response) as List;
        List<TodoModel> list =
            (todos).map((e) => TodoModel.fromJson(e)).toList();
        return list;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TodoModel>> deleteTodo(id) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final response = preferences.getString(Consts.todos);
      if (response != null) {
        final todos = jsonDecode(response) as List;
        List<TodoModel> list =
            (todos).map((e) => TodoModel.fromJson(e)).toList();

        list.remove(list.firstWhere((element) => element.id == id));

        preferences.setString(
            Consts.todos, jsonEncode(list.map((e) => e.toMap()).toList()));

        debugPrint(jsonEncode(list.map((e) => e.toMap()).toList().toString()));

        return list;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TodoModel>> addTodo(TodoModel todo) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final response = preferences.getString(Consts.todos);
      if (response != null) {
        final todos = jsonDecode(response) as List;

        List<TodoModel> list =
            (todos).map((e) => TodoModel.fromJson(e)).toList();

        list.add(todo);
        final encodedjson = list.map((e) => e.toMap()).toList();

        preferences.setString(Consts.todos, jsonEncode(encodedjson));
        return list;
      } else {
        preferences.setString(Consts.todos, jsonEncode([todo.toMap()]));
        return [todo];
      }
    } catch (e) {
      rethrow;
    }
  }
}
