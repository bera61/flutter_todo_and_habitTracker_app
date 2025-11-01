import 'package:flutter/material.dart';
import 'habitracker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> tasks = [];

  void _addTask() {
    if (_textEditingController.text.isNotEmpty) {
      setState(() {
        tasks.add(_textEditingController.text);
        _textEditingController.clear();
      });
      FocusScope.of(context).unfocus();
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFE3E0),
        appBar: AppBar(
          title: const Text(
            "To Do",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 155, 65, 47),
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(3.0, 3.0),
                  color: Color.fromARGB(255, 107, 36, 36),
                ),
              ],
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFAA9A),
          toolbarHeight: 80,
          bottom: const TabBar(
            labelColor: Color.fromARGB(255, 155, 65, 47),
            unselectedLabelColor: Color.fromARGB(255, 100, 70, 60),
            indicatorColor: Color.fromARGB(255, 155, 65, 47),
            tabs: [
              Tab(text: "To Do", icon: Icon(Icons.list)),
              Tab(text: "Done", icon: Icon(Icons.check_circle)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                const Color.fromARGB(251, 243, 200, 195),
                            hintText: "Enter task",
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 150, 81, 73),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 221, 221),
                                width: 4.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFFFAA9A),
                                width: 4.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.add_circle, size: 40.0),
                        color: const Color(0xFFFFAA9A),
                        onPressed: _addTask,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onDoubleTap: () => _deleteTask(index),
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: ListTile(
                            title: Text(
                              tasks[index],
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 102, 39, 29),
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Color(0xFFFFAA9A)),
                              onPressed: () => _deleteTask(index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const HabitTracker(),
          ],
        ),
      ),
    );
  }
}
