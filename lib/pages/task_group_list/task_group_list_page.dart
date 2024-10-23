import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/task_list/task_list_page.dart';
import 'package:todo_app/providers/task_group_provider.dart';

class TaskGroupListPage extends StatelessWidget {
  const TaskGroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Groups'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Consumer<TaskGroupProvider>(
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
            itemCount: provider.taskGroups.length,
            //builder tem q retornar widget, é um loop, retorna cada titulo da lista (vem do banco)
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push<void>(
                    context, 
                    //id vem do taskgroup provider
                    MaterialPageRoute<void>(builder: (BuildContext context) => TaskListPage(groupId: provider.taskGroups[index].id),),
                  );
                },
                title: Text(provider.taskGroups[index].name),
              );
            },); 
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
