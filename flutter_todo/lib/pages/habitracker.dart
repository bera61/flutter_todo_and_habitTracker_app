import 'package:flutter/material.dart';
import '../components/habit_tile.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({super.key});

  @override
  State<HabitTracker> createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE3E0),
      body: SafeArea(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Habit Tracker',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 155, 65, 47),
                ),
              ),
            ),
            Expanded( // 👈 bunu ekle, ana fark bu
              child: HabitTile(),
            ),
          ],
        ),
      ),
    );
  }
}
