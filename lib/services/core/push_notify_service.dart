import 'package:memory_nest/models/push_notify_model.dart';
import 'package:memory_nest/models/track_log_model.dart';
import 'package:memory_nest/services/core/track_log_service.dart';
import 'package:memory_nest/utils/constants.dart';
import 'dart:convert';
import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:memory_nest/models/care_taker_model.dart';


class PushNotifyService{


    /// Authenticates a volunteer to guide a patient home.
  static Future<AcceptPushNotifyResponse?> acceptSOS(
    String sosId,
    String authID,
    String vId,
  ) async {
    var headers = {'Content-Type': 'application/json'};
    String url = '${ApiConstants.baseUrl}/${ApiConstants.sos}/accept';
    log(url);
    var request = http.Request('PUT', Uri.parse(url));
    request.body = json.encode({"SOSId": sosId, "AuthID": authID, "VId": vId});
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        AcceptPushNotifyResponse model = acceptPushNotifyFromJson(res);
        return model;
      } else {
        throw Exception('Failed to accept SOS: ${response.reasonPhrase}');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  /// Retrieves information about particular sos call.
  static Future<PushNotifyLogModel?> getSOSLog(String id) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.sos}/$id');
      debugPrint(url.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        PushNotifyLogModel model = pushNotifyLogModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  /// Updates information about a particular sos call.
  static Future<void> updateSOS(String id, String status) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.sos}/$id');
      debugPrint('$url');
      await http.put(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"Status": status}),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  /// Sends SOS to volunteers near patient.
  static Future<SosMessage> sendSOS(String crId) async {
    final TrackLogModel? travelLogModel = await TrackLogService.getTravelLog(crId);

    int datetime =
        DateTime.now().millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('${ApiConstants.baseUrl}/sos/'));
    request.body = json.encode({
      "CrId": crId,
      "Datetime": datetime,
      "StartLocation": {
        "Lat": travelLogModel?.currentLocation.lat,
        "Lng": travelLogModel?.currentLocation.lng,
      },
      "Status": "lost",
      "Volunteer": ""
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 202) {
      var res = await response.stream.bytesToString();
      SosMessage model = sosMessageFromJson(res);
      debugPrint("alert sent");
      return model;
    } else {
      throw Exception('Failed to send SOS: ${response.reasonPhrase}');
    }
  }
}