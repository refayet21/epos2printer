import 'package:epos2printer/presentation/printpage/printpage.screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> data = [
    {'title': 'আয়মান সাদিক', 'price': 15, 'qty': 2},
    {'title': 'শামিম ইসলাম', 'price': 5, 'qty': 5},
    {'title': 'জীবন চৌধুরি', 'price': 20, 'qty': 1},
    {'title': 'সলিম', 'price': 20, 'qty': 5},
    {'title': 'মিষ্টি', 'price': 10, 'qty': 5},
  ];

  final f = NumberFormat("\$###,###.00", "bn_BD");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(
                    data[i]['title'].toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${f.format(data[i]['price'])} x ${data[i]['qty']}",
                  ),
                  trailing: Text(
                    f.format(
                      data[i]['price'] * data[i]['qty'],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                // Text(
                //   "মোট: ${f.format(_total)}",
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(
                  width: 80,
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Get.to(() => PrintpageScreen(data: data));
                    },
                    icon: Icon(Icons.print),
                    label: Text('প্রিন্ট'),
                    style: TextButton.styleFrom(
                        iconColor: Colors.white, backgroundColor: Colors.green),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
