import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/repository/supabase_repository.dart';

//controlador
//change notifier - avisa q teve alteraçaõ nos dados e reage na interface

class TaskGroupProvider extends ChangeNotifier {
  //instancia reposi p ocnectar na base
  final _repo = SupabaseRepository();

  List<TaskGroup> _taskGroups = [];
  List<TaskGroup> get taskGroups => _taskGroups;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //n vai retornar, so alterar estado e faz notificacao p redesenhar tela
  Future<void> listTaskGroups() async {
    _isLoading = true;
    notifyListeners();
    try {
      _taskGroups = await _repo.listTaskGroups();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}