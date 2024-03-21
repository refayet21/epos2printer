import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PrintpageController extends GetxController {
  final BluetoothPrint _bluetoothPrint = BluetoothPrint.instance;
  final devices = <BluetoothDevice>[].obs;
  final devicesMsg = "".obs;

  final f = NumberFormat("\$###,###.00", "bn_BD");

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance!.addPostFrameCallback((_) => initPrinter());
  }

  Future<void> initPrinter() async {
    _bluetoothPrint.startScan(timeout: Duration(seconds: 2));

    _bluetoothPrint.scanResults.listen((val) {
      devices.value = val;
      if (devices.isEmpty) {
        devicesMsg.value = "কোনো ডিভাইস নেই";
      }
    });
  }

  Future<void> startPrint(
      BluetoothDevice device, List<Map<String, dynamic>> data) async {
    if (device.address != null) {
      await _bluetoothPrint.connect(device);

      List<LineText> list = [];

      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: "মুদি অ্যাপ",
          weight: 2,
          width: 2,
          height: 2,
          align: LineText.ALIGN_CENTER,
          linefeed: 1,
        ),
      );

      for (var i = 0; i < data.length; i++) {
        list.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: data[i]['title'],
            weight: 0,
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );

        list.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: "${f.format(data[i]['price'])} x ${data[i]['qty']}",
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );
      }
    }
  }
}
