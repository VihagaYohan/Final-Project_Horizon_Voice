import 'dart:math';

import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:d_chart/ordinal/pie.dart';
import 'package:feedback_app/UI/admin/summary_page.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:flutter/material.dart';

class QuestionAnalytics extends StatefulWidget {
  final int activePage;
  QuestionAnalytics({super.key, this.activePage = 0});
  @override
  State<QuestionAnalytics> createState() => _QuestionAnalyticsState();
}

class _QuestionAnalyticsState extends State<QuestionAnalytics> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: AppConfigs.inst_stu_questions
          .map((e) => Column(
                children: [
                  ListTile(
                    leading: Text(
                        'Q${AppConfigs.inst_stu_questions.indexOf(e) + 1}'),
                    title: Text(e,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: activeIndex ==
                                    AppConfigs.inst_stu_questions.indexOf(e)
                                ? FontWeight.bold
                                : FontWeight.normal)),
                    onTap: () {
                      setState(() {
                        activeIndex = AppConfigs.inst_stu_questions.indexOf(e);
                      });
                    },
                  ),
                  activeIndex == AppConfigs.inst_stu_questions.indexOf(e)
                      ? Card(
                          elevation: 4,
                          child: Container(
                            color: Colors.white70,
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      RatingDisplay(
                                          rating: 2,
                                          title: 'Rating Index',
                                          isActive: true),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: DChartPieO(
                                          animate: true,
                                          data: {
                                            '5': 23,
                                            '4': 13,
                                            '3': 10,
                                            '2': 21,
                                            '1': 10,
                                          }.entries.map((entry) {
                                            return OrdinalData(
                                              domain: entry.key,
                                              measure: entry.value,
                                              color: getColor(
                                                  int.parse(entry.key)),
                                            );
                                          }).toList(),
                                          customLabel: (ordinalData, index) =>
                                              index.toString(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      // legend of colors
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (int i = 5; i >= 1; i--)
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: getColor(i),
                                                  ),
                                                  margin:
                                                      EdgeInsets.only(right: 2),
                                                  child: Text(
                                                    '> ${i - 1}',
                                                  ),
                                                ),
                                              ],
                                            )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: DChartBarO(
                                            animate: true,
                                            groupList: [
                                              for (var i = 0; i < 4; i++)
                                                OrdinalGroup(
                                                  id: '${i + 1}',
                                                  data: {
                                                    '5': Random().nextInt(100),
                                                    '4': Random().nextInt(100),
                                                    '3': Random().nextInt(100),
                                                    '2': Random().nextInt(100),
                                                    '1': Random().nextInt(100),
                                                  }.entries.map((entry) {
                                                    return OrdinalData(
                                                      domain: entry.key,
                                                      measure: entry.value,
                                                    );
                                                  }).toList(),
                                                  color: widget.activePage == i
                                                      ? Colors.purple
                                                      : AppConfigs
                                                              .facultyColors[
                                                          i %
                                                              AppConfigs
                                                                  .facultyColors
                                                                  .length],
                                                ),
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      // legend of colors
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (int i = 0; i < 4; i++)
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: widget.activePage ==
                                                            i
                                                        ? Colors.purple
                                                        : AppConfigs
                                                                .facultyColors[
                                                            i %
                                                                AppConfigs
                                                                    .facultyColors
                                                                    .length],
                                                  ),
                                                  margin:
                                                      EdgeInsets.only(right: 2),
                                                  child: Text(
                                                    AppConfigs.faculties[i],
                                                  ),
                                                ),
                                              ],
                                            )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
                                    ListTile(
                                      subtitle: Text('Average Score'),
                                      title: Text('2.5'),
                                    ),
                                    ListTile(
                                      subtitle: Text('Most Frequent Rating'),
                                      title: Text('2'),
                                    ),
                                    ListTile(
                                      subtitle:
                                          Text('Range of Satisfaction Scores'),
                                      title: Text('2.5'),
                                    ),
                                    ListTile(
                                      subtitle:
                                          Text('Spread of Satisfaction Scores'),
                                      title: Text('4.2'),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        )
                      : Container()
                ],
              ))
          .toList(),
    );
  }
}
