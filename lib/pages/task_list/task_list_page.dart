import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/task_list/widgets/task_widget.dart';
import 'package:todo_app/providers/task_provider.dart';

//p passar parametro é por aqui, precisa do id de grupo
class TaskListPage extends StatefulWidget {
  final String groupId;
  const TaskListPage({super.key, required this.groupId});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  //qdo iniciar a tela, buscar dados no bd
  void initState() {
    final provider = context.read<TaskProvider>();
    provider.listTasksByGroup(widget.groupId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Consumer<TaskProvider>(
        //builder constroi tela, nesse caso a oartir do provider, retorna widget (obrigatorio)
        builder: (context, provider, _) {
          if(provider.isLoading) {
            //esta carregando e retorna o loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //retorna a lista
          return ListView.builder(
            //quantos itens retorna
            itemCount: provider.tasks.length,
            //builder tem q retornar widget, é um loop, retorna cada titulo da lista (vem do banco)
            itemBuilder: (context, index) {
              return TaskWidget(task: provider.tasks[index], color: Colors.red);
            },); 
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
