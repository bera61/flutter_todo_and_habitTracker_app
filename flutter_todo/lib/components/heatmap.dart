import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
  datasets: {
    DateTime(2025, 11, 2): 3,
    DateTime(2025, 11, 3): 7,
    DateTime(2025, 11, 4): 10,
    DateTime(2025, 11, 5): 13,
    DateTime(2025, 11, 6): 6,
  },
  colorMode: ColorMode.opacity,
  showText: false,
  scrollable: true,
  colorsets: {
    1:Color.fromARGB(255, 223, 94, 173),
    2:Color.fromARGB(255, 207, 56, 149),
    3:Color.fromARGB(255, 209, 32, 141),
    4:Color.fromARGB(255, 179, 28, 121),
    5:Color.fromARGB(255, 167, 27, 113),
    6:Color.fromARGB(255, 95, 2, 59),
    6:Color.fromARGB(255, 51, 0, 31),
  },
  onClick: (value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
  },
);
  }
}