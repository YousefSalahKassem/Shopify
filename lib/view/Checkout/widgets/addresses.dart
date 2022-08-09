import 'package:animate_do/animate_do.dart';
import 'package:evira/controller/add_address_controller.dart';
import 'package:evira/model/address_model.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addresses extends StatelessWidget {
  const Addresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressesController = Provider.of<AddAddressController>(context);
    return SizedBox(
      height: context.screenHeight * .3,
      width: context.screenWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: addressesController.addresses.length,
        itemBuilder: (context, index) {
          return AddressItem(
            address: addressesController.addresses[index],
            controller: addressesController,
            index: index,
          );
        },
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  final AddressModel address;
  final AddAddressController controller;
  final int index;

  const AddressItem(
      {Key? key,
      required this.address,
      required this.controller,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInRight(
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
          SizedBox(
            width: context.screenWidth * .8,
            child: Row(
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
          ),
          SizedBox(height: context.height10),
          Text(
            'City: ${address.city}',
            style: TextStyle(fontSize: context.height20),
          ),
          SizedBox(height: context.height10),
          SizedBox(
            width: context.height30 * 11,
            child: Text(
              'Street: ${address.street}',
              maxLines: 2,
              style: TextStyle(fontSize: context.height20),
            ),
          ),
          SizedBox(height: context.height10),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: context.screenWidth * .65),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: controller.selectedAddressIndex != index
                    ? Colors.white
                    : Colors.green,
                child: IconButton(
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (controller.selectedAddressIndex != index) {
                        controller.selectAddress(index);
                      }
                    }),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
