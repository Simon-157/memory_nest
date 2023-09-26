import 'dart:convert';
import 'dart:developer';
import 'dart:math' hide log;
import 'dart:typed_data';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:memory_nest/models/patient_model.dart';
import 'package:memory_nest/utils/constants.dart';

/// Service class to interact with application backend.
class CareReceiverService {

  /// Registers a new patient account.
  static Future<http.Response> createCarereceiver(
    String id,
    String name,
    String address,
    String contactNum,
  ) async {
    Uri url = Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.carereceiver}');

    Map data = {
      'CrId': id,
      'Name': name,
      'Address': address,
      'ContactNum': contactNum,
      'CareGiver': [],
    };

    // encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return response;
  }

  /// Retrieves patient information.
  static Future<CarereceiverModel?> getCarereceiver(String id) async {
    try {
      var url =
          Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.carereceiver}/$id');
      var response = await http.get(url);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        CarereceiverModel model = carereceiverFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  /// Updates patient information.
  static Future<http.Response> updateCarereceiver(String id, String name,
      String address, String contactNum, String cgId, String relation) async {
    Uri url =
        Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.carereceiver}/$id');
    debugPrint(url.toString());
    Map data = {
      'Name': name,
      'Address': address,
      'ContactNum': contactNum,
      'CareGiver': [
        {'id': cgId, 'relationship': relation}
      ],
    };

    var body = json.encode(data);

    var response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return response;
  }

  /// Updates the safezone radius for a particular patient.
  static Future<http.Response> updateSafezoneRadius(
      String id, int radius) async {
    Uri url =
        Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.carereceiver}/$id');
    debugPrint(url.toString());
    Map data = {
      'SafezoneRadius': radius,
    };

    var body = json.encode(data);

    var response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return response;
  }

  /// For patient to send an SOS alert to caregivers.
  static Future<http.Response> requestHelp(
    String id,
    LatLng startPos,
    String endLat,
    String endLng,
  ) async {
    int datetime =
        DateTime.now().millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
    Uri url = Uri.parse(
        '${ApiConstants.baseUrl}/${ApiConstants.carereceiver}/$id/help');

    Map data = {
      "CrId": id,
      "Body": "Outside of safezone for too long / Routing service triggered",
      "Start": '${startPos.latitude},${startPos.longitude}',
      "End": '$endLat,$endLng',
      "Datetime": datetime,
    };

    var body = json.encode(data);

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return response;
  }

  /// For patients to receive route back home.
  static Future<http.Response> routingHelp(
      LatLng startPos, String endLat, String endLng) async {
    Uri url =
        Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.carereceiver}/route');
    Map data = {
      "Start": '${startPos.latitude},${startPos.longitude}',
      "End": '$endLat,$endLng',
    };

    var body = json.encode(data);

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return response;
  }
}
