import 'package:memory_nest/models/track_log_model.dart';
import 'package:memory_nest/utils/constants.dart';
import 'dart:convert';
import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class TrackLogService{


  /// Uploads patient location onto cloud firestore.
  static Future<http.Response> updateCarereceiverLoc(
      String id, double lat, double lng, String status) async {
    int datetime =
        DateTime.now().millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
    String travelLogId = id + datetime.toString();
    Uri url = Uri.parse(
        '${ApiConstants.baseUrl}/${ApiConstants.travellog}/$travelLogId');
    Map data = {
      "CrId": id,
      "Datetime": datetime,
      "CurrentLocation": {"Lat": lat, "Lng": lng},
      "Status": status,
    };

    var body = json.encode(data);

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return response;
  }

  /// Retrieves patient location information.
  static Future<TrackLogModel?> getTravelLog(String id) async {
    try {
      var url =
          Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.travellog}/$id');
      debugPrint(url.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        TrackLogModel model = travelLogModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}