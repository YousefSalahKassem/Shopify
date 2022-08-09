import 'package:evira/components/default_button.dart';
import 'package:evira/controller/add_address_controller.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Addresses/screens/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'address_item.dart';

class AddressesBody extends StatelessWidget {
  const AddressesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressController = Provider.of<AddAddressController>(context);
    return SizedBox(
        height: context.screenHeight,
        width: double.maxFinite,
        child: Column(
          children: [
            addressController.addresses.isEmpty
                ? SvgPicture.asset('assets/images/location.svg',
                    height: context.screenHeight * .7)
                : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: addressController.addresses.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              key: Key(
                                  UniqueKey().toString()), // UniqueKey().toString()
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                addressController.deleteAddress(
                                    addressController.addresses[index]);
                              },
                              background: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE6E6),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(
                                        FontAwesomeIcons.trash,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        addressController.deleteAddress(
                                            addressController.addresses[index]);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              child: AddressItem(
                                  address: addressController.addresses[index]));
                        }),
                  ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DefaultButton(
                text: 'Add Address',
                press: () {
                  AppRoute.push(const AddAddressScreens());
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}
