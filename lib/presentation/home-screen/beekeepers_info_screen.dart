import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:traceebee_admin_app/models/hive_model.dart';
import 'package:traceebee_admin_app/presentation/user-screens/user_screen.dart';
import 'package:traceebee_admin_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_admin_app/providers/home-provider/home_provider.dart';
import 'package:traceebee_admin_app/services/firestore_service.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

class BeeKeepersInfoScreen extends StatelessWidget {
  const BeeKeepersInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: StreamBuilder<List<HiveModel>>(
        stream: FireStoreService().fetchHives(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            var beeKeepersList = snapshot.data;
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: List.generate(beeKeepersList!.length, (index) {
                    final hive = beeKeepersList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) =>
                          //         UserScreen(beeKeepersEnitity: hive),
                          //   ),
                          // );
                        },
                        child: Container(
                          height: 155.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.w,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      SizedBox(
                                        width: 180,
                                        child: Text(
                                          "USER : ${hive.userID}",
                                          style: subHeadingStyle,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "No. of Hives: ${hive.hiveNumber}",
                                        style: subHeadingStyle,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        hive.createdAt!,
                                        style: subHeadingStyle,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        hive.amountHoney ?? '0',
                                        style: subHeadingStyle,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Image.network(
                                    hive.driveLink!,
                                    height: 130.h,
                                    width: 150.w,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          }
          return const Center(child: Text('No Data'));
        },
      ),

      // body: Consumer<HomeProvider>(
      //   builder: (context, beeKeepersState, child) {
      //     return Column(
      //       children: List.generate(
      //         beeKeepersState.beeKeepersList.length,
      //         (index) {
      //           final beeKeepersList = beeKeepersState.beeKeepersList[index];
      //           return Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 1.w),
      //             child: InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (_) =>
      //                         UserScreen(beeKeepersEnitity: beeKeepersList),
      //                   ),
      //                 );
      //               },
      //               child: Container(
      //                 height: 137.h,
      //                 width: MediaQuery.of(context).size.width,
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   border: Border.all(
      //                     color: Colors.black,
      //                     width: 2.w,
      //                   ),
      //                 ),
      //                 child: Center(
      //                   child: Padding(
      //                     padding: EdgeInsets.symmetric(
      //                         horizontal: 10.w, vertical: 10.h),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       children: [
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             SizedBox(
      //                               height: 10.h,
      //                             ),
      //                             Text(
      //                               "USER ${beeKeepersList.name}",
      //                               style: subHeadingStyle,
      //                             ),
      //                             SizedBox(
      //                               height: 10.h,
      //                             ),
      //                             Text(
      //                               "No. of Hives: ${beeKeepersList.numberOfHives}",
      //                               style: subHeadingStyle,
      //                             ),
      //                             SizedBox(
      //                               height: 10.h,
      //                             ),
      //                             Text(
      //                               beeKeepersList.date,
      //                               style: subHeadingStyle,
      //                             ),
      //                             SizedBox(
      //                               height: 10.h,
      //                             ),
      //                             Text(
      //                               beeKeepersList.size,
      //                               style: subHeadingStyle,
      //                             ),
      //                             SizedBox(
      //                               height: 10.h,
      //                             ),
      //                           ],
      //                         ),
      //                         const Spacer(),
      //                         Image.asset(
      //                           beeKeepersList.image,
      //                           height: 130.h,
      //                           width: 200.w,
      //                           fit: BoxFit.cover,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
