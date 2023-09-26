import 'dart:convert';

import 'package:memory_nest/models/push_notify_model.dart';
import 'package:memory_nest/models/track_log_model.dart';
import 'package:memory_nest/services/core/push_notify_service.dart';
import 'package:memory_nest/services/core/track_log_service.dart';

class SafezoneCtr {
  SafezoneCtr({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory SafezoneCtr.fromJson(Map<String, dynamic> json) => SafezoneCtr(
        lat: json["Lat"],
        lng: json["Lng"],
      );

  Map<String, dynamic> toJson() => {
        "Lat": lat,
        "Lng": lng,
      };
}

class CareGiver {
  CareGiver({
    required this.id,
    required this.relationship,
  });

  String id;
  String relationship;

  factory CareGiver.fromJson(Map<String, dynamic> json) => CareGiver(
        id: json["Id"],
        relationship: json["Relationship"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Relationship": relationship,
      };
}

class CarereceiverModel {
  CarereceiverModel({
    required this.crId,
    required this.name,
    required this.address,
    required this.contactNum,
    required this.safezoneCtr,
    required this.safezoneRadius,
    required this.careGiver,
    required this.profilePic,
    required this.authId,
    required this.notes,
  });

  String crId;
  String name;
  String address;
  String contactNum;
  SafezoneCtr safezoneCtr;
  int safezoneRadius;
  List<CareGiver> careGiver;
  String profilePic;
  String authId;
  TrackLogModel? travellog;
  PushNotifyLogModel? notifylog;
  String notes;

  factory CarereceiverModel.fromJson(Map<String, dynamic> json) =>
      CarereceiverModel(
        crId: json["CrId"],
        name: json["Name"],
        address: json["Address"],
        contactNum: json["ContactNum"],
        safezoneCtr: SafezoneCtr.fromJson(json["SafezoneCtr"]),
        safezoneRadius: json["SafezoneRadius"],
        careGiver: List<CareGiver>.from(json["CareGiver"] == null
            ? []
            : json["CareGiver"].map((x) => CareGiver.fromJson(x))),
        notes: json["Notes"],
        profilePic: json["ProfilePic"],
        authId: json["AuthID"],
      );

  Map<String, dynamic> toJson() => {
        "CrId": crId,
        "Name": name,
        "Address": address,
        "ContactNum": contactNum,
        "SafezoneCtr": safezoneCtr.toJson(),
        "SafezoneRadius": safezoneRadius,
        "CareGiver": List<dynamic>.from(careGiver.map((x) => x.toJson())),
        "ProfilePic": profilePic,
        "AuthID": authId,
        "Notes": notes,
      };

  Future<void> getCRTravelLog() async {
    travellog = await TrackLogService.getTravelLog(crId);
  }

  Future<void> getCRNotifyLog() async {
   notifylog = await PushNotifyService.getSOSLog(crId);
  }
}


CarereceiverModel carereceiverFromJson(String str) =>
    CarereceiverModel.fromJson(json.decode(str));

String carereceiverToJson(CarereceiverModel data) => json.encode(data.toJson());
