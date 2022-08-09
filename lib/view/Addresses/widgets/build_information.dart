import 'package:evira/components/default_button.dart';
import 'package:evira/components/text_field_app.dart';
import 'package:evira/controller/address_controller.dart';
import 'package:evira/model/address_model.dart';
import 'package:evira/styles/colors.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../controller/add_address_controller.dart';

class BuildInformation extends StatelessWidget {
  const BuildInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AddressController>(context);
    var addAddressController = Provider.of<AddAddressController>(context);
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.screenHeight * .3,
                width: context.screenWidth,
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: AddressController.kGooglePlex,
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      markers: Set<Marker>.of(controller.markers),
                      onMapCreated: (GoogleMapController addresscontroller) {
                        controller.addresscontroller.complete(
                            addresscontroller);
                      },
                    ),
                    Positioned(
                        bottom: 10,
                        left: 10,
                        child: FloatingActionButton(
                          backgroundColor: kPrimaryColor,
                          onPressed: () {
                            controller.getUserCurrentLocation();
                          },
                          child: Icon(Icons.add,
                              color: Colors.white, size: context.height30),
                        ))
                  ],
                ),
              ),
              SizedBox(height: context.height30),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.height10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldApp(
                          label: 'country',
                          hint: 'country',
                          valid: 'country field is required',
                          controller: controller.countryController,
                          icon: Icons.location_on,
                          type: TextInputType.text),
                      SizedBox(height: context.height20),
                      TextFieldApp(
                          label: 'city',
                          hint: 'city',
                          valid: 'city field is required',
                          controller: controller.cityController,
                          icon: Icons.location_city,
                          type: TextInputType.text),
                      SizedBox(height: context.height20),
                      TextFieldApp(
                          label: 'street',
                          hint: 'street',
                          valid: 'street field is required',
                          controller: controller.streetController,
                          icon: Icons.location_searching,
                          type: TextInputType.text),
                      SizedBox(height: context.height20),
                      TextFieldApp(
                          label: 'PostalCode',
                          hint: 'postal code',
                          valid: 'postal code field is required',
                          controller: controller.postalCodeController,
                          icon: Icons.location_searching,
                          type: TextInputType.number),
                      SizedBox(height: context.height30),
                      DefaultButton(
                        text: 'Save',
                        press: () {
                          addAddressController.addAddress(AddressModel(
                              country: controller.countryController.text,
                              city: controller.cityController.text,
                              street: controller.streetController.text,
                              postcode: controller.postalCodeController.text
                          ));
                          AppRoute.pop();
                        },
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
