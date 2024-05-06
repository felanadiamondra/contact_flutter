import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_1/Todo.dart';
import 'package:flutter_1/components/todo_detail.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  final todos = List.generate(
  20,
  (i) => Todo(
    'Todo $i',
    'A description of what needs to be done for Todo $i ',
  ),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> TodoDetailPage(todo: todos[index])),);
            },
          );
        },
      ),
    );
  }
}