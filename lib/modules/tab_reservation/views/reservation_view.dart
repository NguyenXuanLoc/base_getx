import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reservation_controller.dart';

class ReservationView extends GetView<ReservationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReservationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReservationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
