import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:flutter/material.dart';

class FacultySummary extends StatelessWidget {
  final int activeIndex;
  const FacultySummary({Key? key, required this.activeIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: AspectRatio(
            aspectRatio: 32 / 9,
            child: DChartBarO(
              animate: true,
              groupList: [
                OrdinalGroup(
                  id: '5',
                  color: activeIndex == 0
                      ? Colors.purple
                      : AppConfigs.facultyColors[0],
                  data: {
                    5: 2,
                    4: 23,
                    3: 20,
                    2: 2,
                    1: 4,
                  }.entries.map((entry) {
                    return OrdinalData(
                      domain: entry.key.toString(),
                      measure: entry.value,
                    );
                  }).toList(),
                ),
                OrdinalGroup(
                  id: 'Institutional',
                  color: activeIndex == 1
                      ? Colors.purple
                      : AppConfigs.facultyColors[1],
                  data: {
                    5: 20,
                    4: 23,
                    3: 12,
                    2: 22,
                    1: 23,
                  }.entries.map((entry) {
                    return OrdinalData(
                      domain: entry.key.toString(),
                      measure: entry.value,
                    );
                  }).toList(),
                ),
                OrdinalGroup(
                  id: '4',
                  color: activeIndex == 2
                      ? Colors.purple
                      : AppConfigs.facultyColors[2],
                  data: {
                    5: 24,
                    4: 12,
                    3: 1,
                    2: 7,
                    1: 27,
                  }.entries.map((entry) {
                    return OrdinalData(
                      domain: entry.key.toString(),
                      measure: entry.value,
                    );
                  }).toList(),
                ),
                OrdinalGroup(
                  id: '3',
                  color: activeIndex == 3
                      ? Colors.purple
                      : AppConfigs.facultyColors[3],
                  data: {
                    5: 23,
                    4: 2,
                    3: 23,
                    2: 10,
                    1: 22,
                  }.entries.map((entry) {
                    return OrdinalData(
                      domain: entry.key.toString(),
                      measure: entry.value,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: AppConfigs.faculties
                .map((e) => Row(children: [
                      Container(
                        width: 16,
                        height: 16,
                        color: activeIndex == AppConfigs.faculties.indexOf(e)
                            ? Colors.purple
                            : AppConfigs
                                .facultyColors[AppConfigs.faculties.indexOf(e)],
                      ),
                      SizedBox(width: 8),
                      Text(e, style: TextStyle(fontWeight: FontWeight.bold)),
                    ]))
                .toList(),
          ),
        )
      ],
    );
  }
}
