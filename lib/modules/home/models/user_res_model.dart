import 'package:flutter_async_demo/shared/base_res_model.dart';

class UserResModel extends BaseResModel {
  late final List<UserResModelData> data;

  UserResModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = List.from(json['data'])
        .map((e) => UserResModelData.fromJson(e))
        .toList();
  }
}

class UserResModelData {
  late final int id;
  late final String name;
  late final String username;
  late final String email;
  late final Address address;
  late final String phone;
  late final String website;
  late final Company company;

  UserResModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = Address.fromJson(json['address']);
    phone = json['phone'];
    website = json['website'];
    company = Company.fromJson(json['company']);
  }
}

class Address {
  late final String street;
  late final String suite;
  late final String city;
  late final String zipcode;
  late final Geo geo;

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = Geo.fromJson(json['geo']);
  }
}

class Geo {
  late final String lat;
  late final String lng;

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}

class Company {
  late final String name;
  late final String catchPhrase;
  late final String bs;

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }
}
