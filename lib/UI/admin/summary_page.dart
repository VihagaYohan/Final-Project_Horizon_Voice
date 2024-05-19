import 'package:feedback_app/UI/admin/analytics/faculty_summary.dart';
import 'package:feedback_app/UI/admin/analytics/question_analytics.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:feedback_app/widgets/dashboard_section.dart';
import 'package:flutter/material.dart';

class SummaryAnalytics extends StatelessWidget {
  final int activeIndex;

  const SummaryAnalytics({super.key, required this.activeIndex});
  @override
  Widget build(BuildContext context) {
    final starCount = {
      5: 45,
      4: 23,
      3: 10,
      2: 34,
      1: 100,
    };
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ListView(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          children: [
            const Text('Summary Analytics',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('${AppConfigs.faculties[activeIndex]} Faculty',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(
              height: 16,
            ),
            DashboardSection(
              title: 'Rating Summary',
              subtitle: 'from 36 Reviews',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                calculateAveragePercentage(starCount)
                                        .toStringAsFixed(1) +
                                    '%',
                                style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Net score'),
                            ],
                          )),
                      Expanded(
                        flex: 3,
                        child: RatingBar(ratings: starCount),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      // Expanded(
                      //     child: Column(
                      //   children: [
                      //     Text(
                      //       '34',
                      //       style: TextStyle(
                      //           fontSize: 38, fontWeight: FontWeight.bold),
                      //     ),
                      //     Text('Total Ratings'),
                      //   ],
                      // )),
                      // Container(
                      //   width: 2,
                      //   color: Colors.grey,
                      //   height: 100,
                      // ),
                      ...AppConfigs.faculties.map((e) => Expanded(
                              child: RatingDisplay(
                            rating: 3.5,
                            title: '$e Faculty',
                            isActive:
                                activeIndex == AppConfigs.faculties.indexOf(e),
                          )))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DashboardSection(
              title: 'Faculty Summary',
              subtitle: 'from 36 Reviews',
              child: FacultySummary(
                activeIndex: activeIndex,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DashboardSection(
                title: 'Result Analysis - Staff Institution Evaluation',
                subtitle: 'from 36 Reviews',
                child: QuestionAnalytics(
                  activePage: activeIndex,
                  list: AppConfigs.inst_staff_questions,
                )),
            const SizedBox(height: 16),
            DashboardSection(
                title: 'Result Analysis - Staff Batch Rating Form',
                subtitle: 'from 36 Reviews',
                child: QuestionAnalytics(
                    activePage: activeIndex,
                    list: AppConfigs.inst_library_questions)),
            const SizedBox(
              height: 16,
            ),
            DashboardSection(
                title: 'Result Analysis - Staff Course Evaluation Form',
                subtitle: 'from 36 Reviews',
                child: QuestionAnalytics(
                    activePage: activeIndex,
                    list: AppConfigs.inst_library_questions)),
            const SizedBox(
              height: 16,
            ),
            DashboardSection(
                title: 'Result Analysis - Academic Course Evaluation',
                subtitle: 'from 36 Reviews',
                child: QuestionAnalytics(
                    activePage: activeIndex,
                    list: AppConfigs.inst_course_questions)),
            const SizedBox(
              height: 16,
            ),
            DashboardSection(
                title: 'Result Analysis - Academic Batch Rating Form',
                subtitle: 'from 36 Reviews',
                child: QuestionAnalytics(
                    activePage: activeIndex,
                    list: AppConfigs.inst_batch_rating_questions)),
          ],
        ),
      ),
    );
  }
}

class RatingDisplay extends StatelessWidget {
  final double rating;
  final String title;
  final isActive;

  RatingDisplay(
      {required this.rating, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: isActive ? Colors.grey.shade50 : null),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          StarRating(
            rating: rating,
          ),
          Text(
            '$rating/5',
            style: TextStyle(
                fontSize: 34,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500),
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;

  StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating
              ? Icons.star
              : (index < rating + 0.5 ? Icons.star_half : Icons.star_border),
          color: Colors.amber,
          size: 20,
        );
      }),
    );
  }
}

class RatingBar extends StatelessWidget {
  final Map<int, int> ratings;

  RatingBar({required this.ratings});

  @override
  Widget build(BuildContext context) {
    int total = ratings.values.reduce((a, b) => a + b);
    List<Widget> ratingBars = ratings.entries.map((entry) {
      double percentage = (entry.value / total) * 100;
      return Expanded(
        flex: entry.value + 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: getColor(entry.key),
              height: 35,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }).toList();

    return Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: ratingBars,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 5; i >= 1; i--)
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: getColor(i),
                        ),
                        margin: EdgeInsets.only(right: 2),
                      ),
                      Text(
                        '> ${i - 1}',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}

double calculateAveragePercentage(Map<int, int> ratings) {
  int total = ratings.values.reduce((a, b) => a + b);
  int weightedSum =
      ratings.entries.fold(0, (prev, entry) => prev + entry.key * entry.value);
  double average = weightedSum / total;
  return average * 20;
}

Color getColor(int rating) {
  switch (rating) {
    case 5:
      return Colors.green.shade600;
    case 4:
      return Colors.green.shade300;
    case 3:
      return Colors.amber;
    case 2:
      return Colors.orange;
    default:
      return Colors.red;
  }
}
