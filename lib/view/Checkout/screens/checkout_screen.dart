import 'package:flutter/material.dart';

import '../widgets/checkout_body.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
        backgroundColor: const Color(0xFFFFECDF),
        centerTitle: true,
      ),
      body: const CheckOutBody(),
    );
  }
}
