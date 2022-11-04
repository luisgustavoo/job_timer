import 'package:flutter/material.dart';
import 'package:job_timer/app/entities/project_status.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          height: constraints.maxHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DropdownButtonFormField<ProjectStatus>(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),

                    enabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    border: OutlineInputBorder(
                      // borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    // contentPadding: EdgeInsets.zero,
                  ),
                  items: ProjectStatus.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.label),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Novo Projeto'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate,
  ) =>
      true;
}
