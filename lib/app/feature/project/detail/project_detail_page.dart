import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_timer/app/feature/project/detail/widget/projec_pie_chart.dart';
import 'package:job_timer/app/feature/project/detail/widget/project_detail_appbar.dart';
import 'package:job_timer/app/feature/project/detail/widget/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 50),
                  child: const ProjecPieChart(),
                ),
                ProjectTaskTile(),
                ProjectTaskTile(),
                // ProjectTaskTile(),
                // ProjectTaskTile(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/ic_finish_project.svg'),
                  label: Text('Finalizar projeto'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
