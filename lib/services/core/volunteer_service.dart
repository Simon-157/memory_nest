import 'dart:convert';
import 'dart:math';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:memory_nest/models/volunteer_model.dart';
import 'package:memory_nest/utils/constants.dart';


class VolunteerService{
  

   /// Registers a new volunteer account.
  static Future<http.Response> createVolunteer(
      String id, String name, String contactNum) async {
    Uri url = Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.volunteers}');

    int certificationStart = 1609459200 + Random().nextInt(5097600);
    int certificationEnd = 1672531200 + Random().nextInt(5097600);

    Map data = {
      'VId': id,
      'Name': name,
      'ContactNum': contactNum,
      'CertificationStart': certificationStart,
      'CertificationEnd': certificationEnd,
      'ProfilePic': "",
    };

    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return response;
  }

  /// Retrieves volunteer information.
  static Future<VolunteerModel?> getVolunteer(String id) async {
    try {
      var url =
          Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.volunteers}/$id');
      debugPrint(url.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        VolunteerModel model = volunteerFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return null;
  }

  /// Updates volunteer information.
  static Future<UpdateVolResponse> updateVolunteer(
      String contact, String vId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'PUT',
      Uri.parse('${ApiConstants.baseUrl}/volunteers/$vId'),
    );
    request.body = json.encode({"ContactNum": contact});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      UpdateVolResponse model = updateVolResponseFromJson(res);
      return model;
    } else {
      throw Exception(
          'Failed to update volunteer info: ${response.reasonPhrase}');
    }
  }
}