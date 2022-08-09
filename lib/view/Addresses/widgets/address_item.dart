import 'package:animate_do/animate_do.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import '../../../model/address_model.dart';

class AddressItem extends StatelessWidget {
  final AddressModel address;

  const AddressItem({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInUp(
     child: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFECDF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Country: ${address.country}',
                style: TextStyle(
                    fontSize: context.height20, fontWeight: FontWeight.bold),
              ),
              Text(
                address.postcode,
                style: TextStyle(
                    fontSize: context.height20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: context.height10),
          Text(
            'City: ${address.city}',
            style: TextStyle(fontSize: context.height20),
          ),
          SizedBox(height: context.height10),
          Text(
            'Street: ${address.street}',
            style: TextStyle(fontSize: context.height20),
          ),
        ],
      ),
    ));
  }
}
