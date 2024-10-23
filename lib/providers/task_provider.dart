import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/repository/supabase_repository.dart';

//controlador
//change notifier - avisa q teve alteraçaõ nos dados e reage na interface

class TaskProvider extends ChangeNotifier {
  //instancia reposi p ocnectar na base
  final _repo = SupabaseRepository();

  //agpra é lista de tasks
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //n vai retornar, so alterar estado e faz notificacao p redesenhar tela
  Future<void> listTasksByGroup(String groupId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _tasks = await _repo.listTasksByGroup(groupId);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
