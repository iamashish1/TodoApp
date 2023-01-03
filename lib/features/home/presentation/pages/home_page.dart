import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/home/data/model/todo_model.dart';
import 'package:todo_app/features/home/presentation/bloc/bloc/todo_tasks_bloc.dart';
import 'package:uuid/uuid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add todo task'),
          content: TextField(
            controller: _textController,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                if (_textController.text.trim().isNotEmpty) {
                  context.read<TodoTasksBloc>().add(TodoTasksEvent.create(
                      TodoModel(
                          id: const Uuid().v4(),
                          description: _textController.text.trim())));
                  _textController.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          snap: false,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("Todo's Tasks",
                style: Theme.of(context).textTheme.headlineMedium //TextStyle
                ), //Text
          ), //FlexibleSpaceBar
          expandedHeight: 150,
          backgroundColor: AppColors.primaryGrey,

          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add Tasks',
              iconSize: 35,
              onPressed: _showDialog,
            ),
          ],
        ),
        Builder(builder: (context) {
          return BlocBuilder<TodoTasksBloc, TodoTasksState>(
            builder: (context, state) {
              return state.when(
                fetched: (isLoading, error, data) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(
                        tileColor:
                            (index % 2 == 0) ? Colors.white : Colors.green[50],
                        leading: data.isEmpty
                            ? const SizedBox.shrink()
                            : const Icon(Icons.circle_outlined),
                        trailing: data.isEmpty
                            ? const SizedBox.shrink()
                            : IconButton(
                                onPressed: () {
                                  context.read<TodoTasksBloc>().add(
                                      TodoTasksEvent.delete(data[index].id));
                                },
                                icon: const Icon(Icons.delete_outline)),
                        title: data.isEmpty
                            ? Center(
                                child: Text('No Todo Tasks Found Yet',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium))
                            : Center(
                                child: Text(data[index].description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                              ),
                      ),
                      childCount: data.isEmpty ? 1 : data.length,
                    ),
                  );
                },
                initial: (bool isLoading, String? error) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                          (context, index) => Center(child: Text("Wait..."))));
                },
              );
            },
          );
        })
      ],
    ));
  }
}
