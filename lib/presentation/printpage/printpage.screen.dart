import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/printpage.controller.dart';

class PrintpageScreen extends GetView<PrintpageController> {
  final List<Map<String, dynamic>>? data;
  PrintpageScreen({this.data});

  final PrintpageController controller = Get.put(PrintpageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('প্রিন্টার নির্বাচন করুন'),
        backgroundColor: Colors.redAccent,
      ),
      body: Obx(
        () => controller.devices.isEmpty
            ? Center(
                child: Text(controller.devicesMsg.value),
              )
            : ListView.builder(
                itemCount: controller.devices.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.print),
                    title: Text(controller.devices[index].name ?? ''),
                    subtitle: Text(controller.devices[index].address ?? ''),
                    onTap: () {
                      controller.startPrint(controller.devices[index], data!);
                    },
                  );
                },
              ),
      ),
    );
  }
}
