import 'dart:convert';

class CurrentLocation {
  CurrentLocation({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory CurrentLocation.fromJson(Map<String, dynamic> json) =>
      CurrentLocation(
        lat: json["Lat"]?.toDouble() ?? 0.0,
        lng: json["Lng"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "Lat": lat,
        "Lng": lng,
      };
}

class TrackLogModel {
  TrackLogModel({
    required this.crId,
    required this.datetime,
    required this.travelLogId,
    required this.currentLocation,
    required this.status,
  });

  String crId;
  int datetime;
  String travelLogId;
  CurrentLocation currentLocation;
  String status;

  factory TrackLogModel.fromJson(Map<String, dynamic> json) => TrackLogModel(
        crId: json["CrId"],
        datetime: json["Datetime"],
        travelLogId: json["TravelLogId"],
        currentLocation: CurrentLocation.fromJson(json["CurrentLocation"]),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "CrId": crId,
        "Datetime": datetime,
        "TravelLogId": travelLogId,
        "CurrentLocation": currentLocation.toJson(),
        "Status": status,
      };
}

TrackLogModel travelLogModelFromJson(String str) =>
    TrackLogModel.fromJson(json.decode(str));

String travelLogModelToJson(TrackLogModel data) => json.encode(data.toJson());
