import 'package:d_chart/d_chart.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:flutter/material.dart';

class StatCard extends StatefulWidget {
  final Iterable<Map<String, dynamic>> docs;
  final int index;
  List<String> titleList;

  StatCard({required this.docs, required this.index,required this.titleList});

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  int statIndex = 0;
  @override
  Widget build(BuildContext context) {
    final d = widget.docs.map((e) => e[widget.index.toString()]);
    int total = 0;
    for (var e in d) {
      total += e as int;
    }
    double average = total / d.length;

    final Map<int, int> counts = {5: 0, 1: 0, 2: 0, 3: 0, 4: 0};
    d.forEach((number) {
      if (number >= 1 && number <= 5) {
        counts[number] = counts[number]! + 1;
      }
    });
    List<OrdinalData> ordinalDataList = [];
    for (int i = 1; i <= 5; i++) {
      ordinalDataList
          .add(OrdinalData(domain: i.toString(), measure: counts[i] ?? 0));
    }
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                widget.titleList[widget.index],
                style:TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (statIndex == 0)
              Column(
                children: [
                  Text('${(average*100/5).toStringAsFixed(1)} %',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      value: average / 5,
                    ),
                  )
                ],
              ),
            if (statIndex == 1)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPieO(
                  data: ordinalDataList,
                  customLabel: (ordinalData, index) => index.toString(),
                ),
              ),
            if (statIndex == 2)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: [
                    OrdinalGroup(
                      id: '1',
                      data: ordinalDataList,
                    )
                  ],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        statIndex--;
                        if (statIndex < 0) {
                          statIndex = 2;
                        }
                      });
                    },
                    icon: Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        statIndex++;
                        if (statIndex > 2) {
                          statIndex = 0;
                        }
                      });
                    },
                    icon: Icon(Icons.arrow_forward)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
