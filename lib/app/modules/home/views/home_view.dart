import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app2/app/utils/style/AppColors.dart';
import 'package:task_management_app2/app/utils/widget/header.dart';
import 'package:task_management_app2/app/utils/widget/myTask.dart';
import 'package:task_management_app2/app/utils/widget/myfriends.dart';
import 'package:task_management_app2/app/utils/widget/sidebar.dart';
import 'package:task_management_app2/app/utils/widget/PeopleYouMyKnow.dart';
import '../../../data/controller/auth_controller.dart';
import '../../../routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 150, child: SideBar()),
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Row(
          children: [
            !context.isPhone
                ? const Expanded(flex: 2, child: SideBar())
                : const SizedBox(),
            Expanded(
              flex: 16,
              child: Column(children: [
                //Bagian Header
                !context.isPhone
                    ? const header()
                    : Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _drawerKey.currentState!.openDrawer();
                              },
                              icon: const Icon(
                                Ionicons.menu,
                                color: AppColors.primaryText,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Task Management',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                Text(
                                  'Task management terbaik',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Ionicons.notifications,
                              color: AppColors.primaryText,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 25,
                                foregroundImage: NetworkImage(
                                    authC.auth.currentUser!.photoURL!),
                              ),
                            )
                          ],
                        ),
                      ),
                // isi page
                Expanded(
                  child: Container(
                    padding: !context.isPhone
                        ? const EdgeInsets.all(40)
                        : const EdgeInsets.all(20),
                    margin: !context.isPhone ? const EdgeInsets.all(10) : null,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: !context.isPhone
                            ? BorderRadius.circular(40)
                            : BorderRadius.circular(20)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // start MY TASK
                          const Text(
                            'People You May Know',
                            style: TextStyle(
                                color: AppColors.primaryText, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PeopleYouMayKnow(),
                          // end of MY TASK
                          !context.isPhone
                              ? Expanded(
                                  child: Row(
                                    children: [myTask(), MyFriends()],
                                  ),
                                )
                              : myTask(),
                        ]),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
