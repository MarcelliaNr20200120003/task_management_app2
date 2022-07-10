import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app2/app/utils/style/AppColors.dart';
import 'package:task_management_app2/app/utils/widget/header.dart';
import 'package:task_management_app2/app/utils/widget/sidebar.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.primaryBg,
      body: Row(
        children: [
          !context.isPhone
              ? const Expanded(
                  flex: 2,
                  child: SideBar(),
                )
              : const SizedBox(),
          Expanded(
            flex: 15,
            child: Column(children: [
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
                              Icons.menu,
                              color: AppColors.primaryText,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Task Management',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.primaryText),
                              ),
                              Text(
                                'Manage task made easy with friends',
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.primaryText),
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
                            width: 15,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: const CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 25,
                              foregroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSibTMP3266859JrPVaoYmIXXinEtq9Bn_hfg&usqp=CAU'),
                            ),
                          )
                        ],
                      ),
                    ),
              // content / isi page / screen
              Expanded(
                child: Container(
                  padding: !context.isPhone
                      ? const EdgeInsets.all(40)
                      : const EdgeInsets.all(20),
                  margin: !context.isPhone
                      ? const EdgeInsets.all(10)
                      : const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: !context.isPhone
                        ? BorderRadius.circular(40)
                        : BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Task',
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 8,
                          clipBehavior: Clip.antiAlias,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.cardBg,
                              ),
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.amber,
                                          radius: 20,
                                          foregroundImage: NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSibTMP3266859JrPVaoYmIXXinEtq9Bn_hfg&usqp=CAU'),
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.amber,
                                          radius: 20,
                                          foregroundImage: NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSibTMP3266859JrPVaoYmIXXinEtq9Bn_hfg&usqp=CAU'),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 25,
                                        width: 80,
                                        color: AppColors.primaryBg,
                                        child: const Center(
                                            child: Text(
                                          '100%',
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    color: AppColors.primaryBg,
                                    child: const Center(
                                      child: Text(
                                        '10 / 10 Task',
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Pemrograman Mobile',
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Text(
                                    'Deadline 2 hari lagi',
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment(0.95, 0.95),
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.bottomSheet(
              Container(
                margin: !context.isPhone
                    ? const EdgeInsets.only(right: 150, left: 150)
                    : null,
                height: Get.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
              ),
            );
          },
          label: Text('Add Task'),
          icon: Icon(Ionicons.add),
        ),
      ),
    );
  }
}
