import 'dart:convert';

class StartLocation {
  StartLocation({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory StartLocation.fromJson(Map<String, dynamic> json) => StartLocation(
        lat: json["Lat"]?.toDouble() ?? 0.0,
        lng: json["Lng"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "Lat": lat,
        "Lng": lng,
      };
}

class PushNotifyLogModel {
  PushNotifyLogModel({
    required this.crId,
    required this.datetime,
    required this.pushNotifyId,
    required this.startLocation,
    required this.status,
    required this.vId,
    required this.volunteer,
    required this.volunteerContactNum,
  });

  String crId;
  int datetime;
  String pushNotifyId;
  StartLocation startLocation;
  String status;
  String vId;
  String volunteer;
  String volunteerContactNum;

  factory PushNotifyLogModel.fromJson(Map<String, dynamic> json) =>
      PushNotifyLogModel(
        crId: json["CrId"],
        datetime: json["Datetime"],
        pushNotifyId: json["PushNotifyId"],
        startLocation: StartLocation.fromJson(json["StartLocation"]),
        status: json["Status"],
        vId: json["VId"],
        volunteer: json["Volunteer"],
        volunteerContactNum: json["VolunteerContactNum"],
      );

  Map<String, dynamic> toJson() => {
        "CrId": crId,
        "Datetime": datetime,
        "PushNotifyId": pushNotifyId,
        "StartLocation": startLocation.toJson(),
        "Status": status,
        "VId": vId,
        "Volunteer": volunteer,
        "VolunteerContactNum": volunteerContactNum,
      };
}

AcceptPushNotifyResponse acceptPushNotifyFromJson(String str) =>
    AcceptPushNotifyResponse.fromJson(json.decode(str));

String acceptPushNotifyToJson(AcceptPushNotifyResponse data) =>
    json.encode(data.toJson());

class AcceptPushNotifyResponse {
  AcceptPushNotifyResponse({
    required this.message,
  });

  Message message;

  factory AcceptPushNotifyResponse.fromJson(Map<String, dynamic> json) =>
      AcceptPushNotifyResponse(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  Message({
    required this.address,
    required this.cgContactNum,
    required this.cgName,
    required this.contactNum,
    required this.crId,
    required this.name,
    required this.routeGeom,
  });

  String address;
  String cgContactNum;
  String cgName;
  String contactNum;
  String crId;
  String name;
  String routeGeom;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        address: json["Address"],
        cgContactNum: json["CgContactNum"],
        cgName: json["CgName"],
        contactNum: json["ContactNum"],
        crId: json["CrId"],
        name: json["Name"],
        routeGeom: json["RouteGeom"],
      );

  Map<String, dynamic> toJson() => {
        "Address": address,
        "CgContactNum": cgContactNum,
        "CgName": cgName,
        "ContactNum": contactNum,
        "CrId": crId,
        "Name": name,
        "RouteGeom": routeGeom,
      };
}


PushNotifyLogModel pushNotifyLogModelFromJson(String str) =>
    PushNotifyLogModel.fromJson(json.decode(str));

String sosLogModelToJson(PushNotifyLogModel data) => json.encode(data.toJson());
