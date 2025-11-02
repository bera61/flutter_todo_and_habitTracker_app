import 'package:flutter/material.dart';


class HabitTile extends StatefulWidget {
  const HabitTile({super.key});

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  Map<int, bool> checkedStates = {};
  late final TextEditingController _habitController;
  List <String> habits = [];

  void _addHabit(){
    if (_habitController.text.isNotEmpty){
      setState((){
        habits.add( _habitController.text);
        checkedStates[habits.length - 1] = false;
        _habitController.clear();
      });FocusScope.of(context).unfocus();
    }
  }

  void _deleteHabit(int index){
    setState((){
      habits.removeAt(index);
      checkedStates.remove(index);
      final newCheckedStates = <int, bool> {};
      for(var i= 0; i < habits.length; i++){
        newCheckedStates[i] = checkedStates[i+1] ?? false;
      }
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
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(251, 243, 200, 195), 
                      labelText: 'Enter your habit', 
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
                child: Row(
                  children: [  
                    Checkbox(
                      value: checkedStates[index] ?? false,
                      onChanged:(bool? value){
                        setState((){
                          checkedStates[index] = value ?? false;
                        });
                      }
                    ),                 
                    Expanded(
                      child: ListTile(
                        title: Text(  habits[index]),
                        trailing: IconButton(
                            icon: const Icon(Icons.delete,
                            color: Color(0xFFFFAA9A)),
                            onPressed: () => _deleteHabit(index),
                        ),                 
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),),
      ],
    );
  }
}
