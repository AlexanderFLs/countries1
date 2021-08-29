import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:to_do_list/models/city.dart';
import 'package:to_do_list/models/country.dart';
import 'package:to_do_list/ui/page/city.dart';

class Controller extends GetxController {
  final _spinner = RxBool(false);
  List allCountries = RxList();
  List allCities = RxList();
  String countryCode = '';
  final key = GlobalKey<FormState>();
  final textController = TextEditingController();
  int page = 1;

  get spinner => _spinner.value;

  Future getCountries() async {
    var res = await http.get(Uri.parse(
        'https://masters-pages.dev.glob-com.ru/api/location/country?page=1&limit=100'));
    if (res.statusCode == 200) {
      final decode = jsonDecode(res.body);
      List countries = (decode)
          .map((itemCountry) => Countries.fromJson(itemCountry))
          .toList();
      allCountries.addAll(countries);
    } else {
      print('error ${res.statusCode}');
    }
  }

  Future getCities() async {
    var res = await http.get(Uri.parse(
        'https://masters-pages.dev.glob-com.ru/api/location/city?page=$page&limit=10&search=&lang=en&country=$countryCode'));
    if (res.statusCode == 200) {
      final decode = jsonDecode(res.body);
      List cities =
          (decode).map((itemCity) => City.fromJson(itemCity)).toList();
      allCities.addAll(cities);
      cities = [];
    } else {
      print('error ${res.statusCode}');
    }
  }

  nextCityList() async {
    _spinner.value = false;
    print('start ${_spinner.value}');
    print(countryCode);
    page++;
    print(page);
    allCities = [];
    print('Now $allCities');
    await getCities();
    
    print(allCities[0].name);
    _spinner.value = true;
    print('update ${_spinner.value}');
    // update();
  }
  backCityList() async {
    print(countryCode);
    page--;
    print(page);
    allCities = [];
    print('Now $allCities');
    await getCities();
    print(allCities[0].name);
    _spinner.value = true;
    print('update ${_spinner.value}');
    update();
  }

  validate() {
    if (!key.currentState!.validate()) {
      return;
    } else {
      print('Okay');
      int code = int.parse(textController.text) - 1;
      countryCode = allCountries[code].code;

      Get.to(Cities());
    }
  }

  cleare() {
    page = 1;
    allCities = [];
    countryCode = '';
    textController.text = '';
    Get.back();
  }
}
