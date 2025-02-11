import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orbitflow/core/constants/utils.dart';
import 'package:orbitflow/features/home/pages/add_new_task_page.dart';
import 'package:orbitflow/features/home/widgets/date_selector.dart';
import 'package:orbitflow/features/home/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, AddNewTaskPage.route());
            },
            icon: const Icon(
              CupertinoIcons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const DateSelector(),
          Row(
            children: [
              const Expanded(
                child: TaskCard(
                  color: Color.fromRGBO(246, 222, 194, 1),
                  headerText: 'Hello!',
                  descriptionText:
                      'This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!This is a new task!',
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: strengthenColor(
                    const Color.fromRGBO(246, 222, 194, 1),
                    0.69,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  '10:00 Am',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
