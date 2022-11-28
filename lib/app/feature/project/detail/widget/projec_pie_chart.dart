import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjecPieChart extends StatelessWidget {
  const ProjecPieChart({
    required this.estimatedHours,
    required this.totalTasks,
    Key? key,
  }) : super(key: key);

  final int estimatedHours;
  final int totalTasks;

  @override
  Widget build(BuildContext context) {
    final residual = estimatedHours - totalTasks;

    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: totalTasks.toDouble(),
                  color: Theme.of(context).primaryColor,
                  showTitle: true,
                  title: '${totalTasks}h',
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PieChartSectionData(
                  value: residual.toDouble(),
                  color: Theme.of(context).primaryColorLight,
                  showTitle: true,
                  title: '${residual}h',
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
            child: Text(
              '${estimatedHours}h',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
