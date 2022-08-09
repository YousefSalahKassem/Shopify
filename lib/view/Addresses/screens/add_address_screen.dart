import 'package:evira/view/Addresses/widgets/build_information.dart';
import 'package:flutter/material.dart';

class AddAddressScreens extends StatelessWidget {
  const AddAddressScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFECDF),
      ),
      body: const BuildInformation()
    );
  }
}
