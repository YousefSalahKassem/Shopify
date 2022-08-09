import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AddressController with ChangeNotifier {
  String _address = '';
  String get address => _address;

  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();


  final List<Marker> markers = <Marker>[];
  static  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 14,
  );

  List<Marker> list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(title: 'some Info ')),
  ];

  Completer<GoogleMapController> addresscontroller = Completer();

  getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
    });

    await Geolocator.getCurrentPosition().then((value) async {
      markers.add(
          Marker(
              markerId: const MarkerId('SomeId'),
              position: LatLng(value.latitude ,value.longitude),
              infoWindow:  InfoWindow(
                  title: address
              )
          )
      );
      final GoogleMapController controller = await addresscontroller.future;

      kGooglePlex =  CameraPosition(
        target: LatLng(value.latitude ,value.longitude),
        zoom: 14,
      );
      controller.animateCamera(CameraUpdate.newCameraPosition(kGooglePlex));

      List<Placemark> placemarks = await placemarkFromCoordinates(value.latitude ,value.longitude);


      final add = placemarks.first;
      _address = "${add.locality} ${add.administrativeArea} ${add.subAdministrativeArea} ${add.country}";
      countryController.text=add.country!;
      cityController.text=add.subAdministrativeArea!;
      streetController.text=add.locality!;
      postalCodeController.text=add.postalCode!;



      notifyListeners();
    });
  }

  AddressController() {
    markers.addAll(list);
  }

  loadData() {
    getUserCurrentLocation().then((value) async {
      markers.add(Marker(
          markerId: const MarkerId('SomeId'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: address)));

      final GoogleMapController controller = await addresscontroller.future;
      CameraPosition kGooglePlex = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      controller
          .animateCamera(CameraUpdate.newCameraPosition(kGooglePlex));
      notifyListeners();
    });
  }
}
