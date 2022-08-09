import 'package:evira/model/address_model.dart';
import 'package:evira/services/local/addresses_database.dart';
import 'package:flutter/cupertino.dart';

class AddAddressController with ChangeNotifier{
  var dbHelper = AddressesDatabase.db;
  int _selectedAddressIndex = 0;
  int get selectedAddressIndex => _selectedAddressIndex;

  final List<AddressModel> _addresses = [];
  List<AddressModel> get addresses => _addresses;

  AddAddressController(){
    getAddresses();
    init();
  }

  init()async{
    await dbHelper.initDatabase();
    getAddresses();
    notifyListeners();
  }

  void addAddress(AddressModel address) async {
    _addresses.add(address);
    await dbHelper.insertAddress(address);
    notifyListeners();
  }

  void getAddresses() async {
    final List<AddressModel> addresses = await dbHelper.getAddresses();
    _addresses.clear();
    _addresses.addAll(addresses);
    notifyListeners();
  }

  void deleteAddress(AddressModel address) async {
    _addresses.remove(address);
    await dbHelper.deleteAddress(address.country);
    notifyListeners();
  }

  void clearAddresses() async {
    _addresses.clear();
    await dbHelper.deleteAllAddresses();
    notifyListeners();
  }

  selectAddress(int selectAddress) async {
    _selectedAddressIndex = selectAddress;
    notifyListeners();
  }
}