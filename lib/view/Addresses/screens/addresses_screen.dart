import 'package:evira/view/Addresses/widgets/adresses_body.dart';
import 'package:flutter/material.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFECDF),
      ),
      body: const AddressesBody()
    );
  }
}
