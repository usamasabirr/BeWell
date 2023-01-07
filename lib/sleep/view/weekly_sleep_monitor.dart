// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:stacked_bar_chart/stacked_bar_chart.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class WeeklySleepMonitor extends StatefulWidget {
//   const WeeklySleepMonitor({super.key});

//   @override
//   State<WeeklySleepMonitor> createState() => _WeeklySleepMonitorState();
// }

// class ChartSampleData {
//   final String x;
//   final double y;

//   ChartSampleData({required this.x, required this.y});
// }

// class _WeeklySleepMonitorState extends State<WeeklySleepMonitor> {
//   // List<ChartData> chartData = [
//   //   ChartData(3, 15),
//   //   ChartData(4, 5),
//   //   ChartData(4, 5),
//   //   ChartData(4, 5),
//   //   ChartData(4, 5),
//   //   ChartData(4, 5),
//   //   ChartData(4, 5)
//   // ];

//   List<ChartSampleData> chartData = <ChartSampleData>[
//     ChartSampleData(x: 'France', y: 84452000),
//     ChartSampleData(x: 'Spain', y: 68175000),
//     ChartSampleData(x: 'US', y: 77774000),
//     ChartSampleData(x: 'Italy', y: 50732000),
//     ChartSampleData(x: 'Mexico', y: 32093000),
//     ChartSampleData(x: 'UK', y: 34436000),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var mediaHeight = MediaQuery.of(context).size.height;
//     var mediaWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           //app bar
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             height: mediaHeight * 0.1,
//             width: mediaWidth,
//             child: Row(children: [
//               Icon(Icons.arrow_back),
//               Expanded(
//                 child: SizedBox(),
//               ),
//               Text(
//                 'Weekly Sleep Monitor',
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//               Expanded(
//                 child: SizedBox(),
//               ),
//               Opacity(opacity: 0.0, child: Icon(Icons.arrow_back))
//             ]),
//           ),

//           //graph
//           SfCartesianChart(
//             isTransposed: true,
//             series: <BarSeries<ChartSampleData, String>>[
//               BarSeries<ChartSampleData, String>(
//                   // Binding the chartData to the dataSource of the column series.
//                   dataSource: chartData,
//                   xValueMapper: (ChartSampleData sales, _) => sales.x,
//                   yValueMapper: (ChartSampleData sales, _) => sales.y,
//                   name: 'Sleep'),
//             ],
//           ),
//         ],
//       )),
//     );
//   }
// }

import 'package:be_well/sleep/controller/sleepController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeeklySleepMonitor extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  WeeklySleepMonitor({Key? key}) : super(key: key);

  @override
  WeeklySleepMonitorState createState() => WeeklySleepMonitorState();
}

class WeeklySleepMonitorState extends State<WeeklySleepMonitor> {
  SleepController sleepController = Get.find();

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    // data = [
    //   _ChartData('Mon', 12),
    //   _ChartData('Tue', 8),
    //   _ChartData('Wed', 7),
    //   _ChartData('Thrus', 2),
    //   _ChartData('Fri', 14),
    //   _ChartData('Sat', 2),
    //   _ChartData('Sun', 14)
    // ];
    sleepController.getSleepData();
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          //app bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: mediaHeight * 0.1,
            width: mediaWidth,
            child: Row(children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back)),
              Expanded(
                child: SizedBox(),
              ),
              Text(
                'Sleep Monitor',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Opacity(opacity: 0.0, child: Icon(Icons.arrow_back))
            ]),
          ),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 24, interval: 10),
              tooltipBehavior: _tooltip,
              series: <ChartSeries<ChartData, String>>[
                ColumnSeries<ChartData, String>(
                    borderRadius: BorderRadius.circular(20),
                    dataSource: sleepController.data,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    name: 'Sleep',
                    color: Color.fromRGBO(8, 142, 255, 1))
              ]),
        ],
      ),
    ));
  }
}
