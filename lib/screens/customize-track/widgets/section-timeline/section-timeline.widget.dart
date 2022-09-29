import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/screens/customize-track/type/Section.type.dart';
import 'package:melodistic/screens/customize-track/widgets/section-timeline/break-section-tile.widget.dart';
import 'package:melodistic/screens/customize-track/widgets/section-timeline/connector-line.widget.dart';
import 'package:melodistic/screens/customize-track/widgets/section-timeline/exercise-section-tile.widget.dart';
import 'package:melodistic/screens/customize-track/widgets/section-timeline/start-indicator.widget.dart';
import 'package:melodistic/widgets/common/type/section.type.dart';

class SectionTimeLine extends StatelessWidget {
  const SectionTimeLine({Key? key, required this.sectionList})
      : super(key: key);

  final List<Section> sectionList;

  Widget renderSectionTile(Section section) {
    if (section.type == SectionType.exerciseSection) {
      return ExerciseSectionTile(
        section: section,
      );
    } else if (section.type == SectionType.breakSection) {
      return BreakSectionTile(section: section);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: SingleChildScrollView(
            child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: sectionList.isEmpty
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: const <Widget>[
                        StartIndicator(),
                      ],
                    ),
                    for (Section section in sectionList) ...<Widget>[
                      renderSectionTile(section),
                      const ConnectorLine()
                    ]
                  ],
                ))));
  }
}
