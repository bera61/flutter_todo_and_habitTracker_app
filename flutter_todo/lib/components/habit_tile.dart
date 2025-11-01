import 'package:flutter/material.dart';

class HabitTile extends StatefulWidget {
  const HabitTile({super.key});

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  late final TextEditingController _habitController;
  List <String> habits = [];

  void _addHabit(){
    if (_habitController.text.isNotEmpty){
      setState((){
        habits.add( _habitController.text);
        _habitController.clear();
      });FocusScope.of(context).unfocus();
    }
  }

  void _deleteHabit(int index){
    setState((){
      habits.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _habitController = TextEditingController();
  }

  @override
  void dispose() {
    _habitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _habitController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your habit',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.add_circle, size: 40.0),
                color: const Color(0xFFFFAA9A),
                onPressed: () {
                  _addHabit();
                },
              ),
            ],
          ),          
        ),
        Expanded(child: ListView.builder(
          itemCount: habits.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onDoubleTap: () => _deleteHabit(index),
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(  habits[index]),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete,
                      color: Color(0xFFFFAA9A)),
                      onPressed: () => _deleteHabit(index),
                  ),                 
                ),
              ),
            );
          },
        ),),
      ],
    );
  }
}
