import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/models/task_model.dart';

//consulta no bd
class SupabaseRepository {
  Future<List<TaskGroup>> listTaskGroups() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('task_groups').select();
    return response.map((task) => TaskGroup.fromMap(task)).toList();
  }

  //muda retorno e nome do metodo, lista as tasks do bd
  //quer pegar por id, então passa como parametro
  Future<List<Task>> listTasksByGroup(String groupId) async {
    final supabase = Supabase.instance.client;

    //pega taskgroupid e o groupid que queremos buscar
    final response = await supabase.from('tasks').select().eq('task_group_id', groupId);
    return response.map((task) => Task.fromMap(task)).toList();
  }
}


