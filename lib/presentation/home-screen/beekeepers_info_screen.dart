import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_admin_app/models/user_model.dart';
import 'package:traceebee_admin_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_admin_app/services/firestore_service.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

import '../user-screens/user_screen.dart';

class BeeKeepersInfoScreen extends StatefulWidget {
  const BeeKeepersInfoScreen({super.key});

  @override
  State<BeeKeepersInfoScreen> createState() => _BeeKeepersInfoScreenState();
}

class _BeeKeepersInfoScreenState extends State<BeeKeepersInfoScreen> {
  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder<List<UserModel>>(
              stream: FireStoreService().fetchUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  var users = snapshot.data;
                  return Column(
                    children: List.generate(users!.length, (index) {
                      // log(beeKeepersList
                      //     .groupingBy(beeKeepersList[index].userID!)
                      //     .toString());
                      final user = users[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => UserScreen(hive: user),
                              ),
                            );
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
                                            "USER : ${user.name}",
                                            style: subHeadingStyle,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "No. of Hives: ${user.hiveCount}",
                                          style: subHeadingStyle,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          user.createdAt!,
                                          style: subHeadingStyle,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              user.totalAmountOfHoney ?? '0',
                                              style: subHeadingStyle,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'ml',
                                              style: subHeadingStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Image.network(
                                      user.profileImage!,
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
                  );
                }
                return const Center(
                  child: Text('Something went wrong'),
                );
              },
            )),
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
