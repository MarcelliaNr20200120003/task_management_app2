import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app2/app/routes/app_pages.dart';
import 'package:task_management_app2/app/utils/widget/sidebar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Row(
          children: [
            const Expanded(
              flex: 2,
              child: SideBar(),
            ),
            Expanded(
              flex: 15,
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
