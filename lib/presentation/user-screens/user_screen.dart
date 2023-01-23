import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:traceebee_admin_app/models/hive_model.dart';
import 'package:traceebee_admin_app/presentation/home-screen/beekeepers_info_screen.dart';
import 'package:traceebee_admin_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_admin_app/services/firestore_service.dart';
import 'package:traceebee_admin_app/utlis/colors.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

class UserScreen extends StatefulWidget {
  final HiveModel hive;
  const UserScreen({
    Key? key,
    required this.hive,
  }) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<HiveData> hiveData = [];

  void listenForChanges() {
    FireStoreService().fetchParticalHives(widget.hive.userID!).listen((event) {
      log(event.toString());
      hiveData = List.from(
        event.map(
          (e) => HiveData(
            'Hive ${e.hiveNumber}',
            int.parse(e.amountHoney!),
          ),
        ),
      );
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    log(widget.hive.userID!);
    listenForChanges();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220.h,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SfCartesianChart(
                  palette: [
                    Colors.teal,
                  ],
                  title: ChartTitle(
                      text: 'Hive ${widget.hive.hiveNumber!}',
                      textStyle: const TextStyle(color: Colors.white)),
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries<HiveData, String>>[
                    ColumnSeries<HiveData, String>(
                        // Bind data source
                        // color: Colors.red,
                        dataSource: hiveData,
                        xValueMapper: (HiveData sales, _) => sales.year,
                        yValueMapper: (HiveData sales, _) => sales.amount)
                  ],
                )),
          ),
          Container(
            height: 400.h,
            width: MediaQuery.of(context).size.width,
            color: lightgreenColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "USER ${widget.hive.userName}",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 320.w,
                    child: Text(
                      "Admins can visually see trends at a glance, a graphical representation gives the users a snapshot view of where the honey production of particular user is at.",
                      style: subHeadingStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "​See the hive count and strength trend over the year.",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "Can view the production of honey in each hive.",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "Can compare the production between each hive",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "Monitor the hives growth.",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const BeeKeepersInfoScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 25.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: const Color(0xff6E6D6D),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                            child: Text(
                              "Return",
                              style: subHeadingStyle.copyWith(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HiveData {
  HiveData(this.year, this.amount);
  final String year;
  final int amount;
}
