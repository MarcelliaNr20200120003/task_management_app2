import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app2/app/utils/style/AppColors.dart';
import 'package:task_management_app2/app/utils/widget/SideBar.dart';
import 'package:task_management_app2/app/utils/widget/header.dart';
import '../../../data/controller/auth_controller.dart';
import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 170, child: SideBar()),
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Row(
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
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Task Management",
                                  style: TextStyle(fontSize: 21),
                                ),
                                Text(
                                  "Manage Task Easy",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryText),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Ionicons.notifications,
                                color: AppColors.primaryText, size: 25),
                            const SizedBox(width: 15),
                            const ClipRRect(
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 24,
                                  foregroundImage: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSibTMP3266859JrPVaoYmIXXinEtq9Bn_hfg&usqp=CAU')),
                            )
                          ],
                        ),
                      ),
                //content / isi page / screen
                Expanded(
                  child: Container(
                    padding: !context.isPhone
                        ? const EdgeInsets.all(30)
                        : const EdgeInsets.all(10),
                    margin: !context.isPhone
                        ? const EdgeInsets.all(15)
                        : const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: !context.isPhone
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: !context.isPhone
                                ? const EdgeInsets.only(left: 20)
                                : const EdgeInsets.only(left: 20, top: 20),
                            child: const Text(
                              'My Task',
                              style: TextStyle(
                                color: Color.fromARGB(221, 128, 128, 128),
                                fontSize: 23,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 8,
                              clipBehavior: Clip.antiAlias,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onLongPress: () {
                                    addEditTask(
                                        context: context,
                                        type: 'Update',
                                        docId: '2022-08-12T14:06:54.560');
                                  },
                                  child: Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.cardBg,
                                    ),
                                    margin: const EdgeInsets.all(15),
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const ClipRRect(
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSibTMP3266859JrPVaoYmIXXinEtq9Bn_hfg&usqp=CAU')),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 3)),
                                              const ClipRRect(
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSibTMP3266859JrPVaoYmIXXinEtq9Bn_hfg&usqp=CAU')),
                                              ),
                                              const Spacer(),
                                              Container(
                                                height: 25,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: AppColors.primaryBg,
                                                ),
                                                child: const Center(
                                                    child: Text('100%')),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 25,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColors.primaryBg,
                                            ),
                                            child: const Center(
                                                child: Text('10 / 10 task')),
                                          ),
                                          const Text(
                                            'Pemrogramana Desktop',
                                            style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 20),
                                          ),
                                          const Text(
                                            'Deadline 2 hari lagi',
                                            style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 15),
                                          ),
                                        ]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.95, 0.95),
        child: FloatingActionButton.extended(
          onPressed: () {
            addEditTask(context: context, type: 'Add', docId: '');
          },
          label: const Text("Add Task"),
          icon: const Icon(Ionicons.add),
        ),
      ),
    );
  }

  addEditTask({BuildContext? context, String? type, String? docId}) {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        margin: context!.isPhone
            ? const EdgeInsets.only()
            : const EdgeInsets.only(left: 120, right: 120),
        height: 500,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text(
                  '$type Task',
                  style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Tittle',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  controller: controller.tittleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  controller: controller.descriptionsController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                DateTimePicker(
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    decoration: InputDecoration(
                        hintText: 'Due Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    controller: controller.dueDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    }),
                const SizedBox(height: 15),
                ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: Get.width, height: 40),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.saveUpdateTask(
                            controller.tittleController.text,
                            controller.descriptionsController.text,
                            controller.dueDateController.text,
                            docId!,
                            type!,
                          );
                        },
                        child: Text(type!)))
              ],
            )),
      ),
    ));
  }
}
