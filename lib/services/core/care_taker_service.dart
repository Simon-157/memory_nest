import 'dart:convert';
import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:memory_nest/models/care_taker_model.dart';
import 'package:memory_nest/utils/constants.dart';


class CareTakerService {


  /// Registers a new CareTaker account.
  static Future<http.Response> createCareTaker(
      String id, String name, String address, String contactNum) async {
    Uri url = Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.caretaker}');

    Map data = {
      'CgId': id,
      'Name': name,
      'Address': address,
      'ContactNum': contactNum,
      'CareReceiver': [],
    };

    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    return response;
  }

  /// Retrieves CareTaker information.
  static Future<CareTakerModel?> getCareTaker(String id) async {
    try {
      var url =
          Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.caretaker}/$id');
      debugPrint(url.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        CareTakerModel model = CareTakerFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  /// Retrieves CareTaker contact.
  static Future<ContactNumber?> getCgContact(String cgId, crId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'GET',
      Uri.parse('${ApiConstants.baseUrl}/carereceiver/contactcg?CrId=$crId&CgId=$cgId'),
    );
    debugPrint("$cgId $crId");
    // request.body = json.encode({"CrId": crId, "CgId": cgId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      ContactNumber model = contactnumFromJson(res);
      return model;
    } else {
      debugPrint(response.reasonPhrase);
      return null;
    }
  }

  /// Updates patient information.
  static Future<UpdateCgResponse> updateCg(String contact, String cgId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT', Uri.parse('${ApiConstants.baseUrl}/CareTaker/$cgId'));
    request.body = json.encode({"ContactNum": contact});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      UpdateCgResponse model = updateCgResponseFromJson(res);
      return model;
    } else {
      throw Exception('Failed to update CG: ${response.reasonPhrase}');
    }
  }

  /// Adds a new patient under the CareTaker.
  static Future<AddPatientMessage> addPatient(
      String cgId, String crId, String relationship) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'PUT',
      Uri.parse('${ApiConstants.baseUrl}/CareTaker/$cgId/newcr'),
    );
    request.body = json.encode({"Id": crId, "Relationship": relationship});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 202) {
      var res = await response.stream.bytesToString();
      AddPatientMessage model = addPatientMessageFromJson(res);
      debugPrint("alert sent");
      return model;
    } else {
      throw Exception('Failed to add patient: ${response.reasonPhrase}');
    }
  }

}