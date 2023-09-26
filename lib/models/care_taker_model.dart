import 'dart:convert';

CareTakerModel CareTakerFromJson(String str) =>
    CareTakerModel.fromJson(json.decode(str));

String CareTakerToJson(CareTakerModel data) => json.encode(data.toJson());

class CareTakerModel {
  CareTakerModel({
    required this.cgId,
    required this.name,
    required this.address,
    required this.contactNum,
    required this.careReceiver,
    required this.profilePic,
  });

  String cgId;
  String name;
  String address;
  String contactNum;
  List<CareReceiver> careReceiver;
  String profilePic;

  factory CareTakerModel.fromJson(Map<String, dynamic> json) => CareTakerModel(
        cgId: json["CgId"],
        name: json["Name"],
        address: json["Address"],
        contactNum: json["ContactNum"],
        careReceiver: List<CareReceiver>.from(json["CareReceiver"] == null
            ? []
            : json["CareReceiver"].map((x) => CareReceiver.fromJson(x))),
        profilePic: json["ProfilePic"],
      );

  Map<String, dynamic> toJson() => {
        "CgId": cgId,
        "Name": name,
        "Address": address,
        "ContactNum": contactNum,
        "CareReceiver": List<dynamic>.from(careReceiver.map((x) => x.toJson())),
        "ProfilePic": profilePic,
      };
}

class CareReceiver {
  CareReceiver({
    required this.id,
    required this.relationship,
  });

  String id;
  String relationship;

  factory CareReceiver.fromJson(Map<String, dynamic> json) => CareReceiver(
        id: json["Id"],
        relationship: json["Relationship"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Relationship": relationship,
      };
}

UpdateCgResponse updateCgResponseFromJson(String str) => UpdateCgResponse.fromJson(json.decode(str));

String updateCgResponseToJson(UpdateCgResponse data) => json.encode(data.toJson());

class UpdateCgResponse {
    UpdateCgResponse({
        required this.message,
    });

    String message;

    factory UpdateCgResponse.fromJson(Map<String, dynamic> json) => UpdateCgResponse(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}

SosMessage sosMessageFromJson(String str) => SosMessage.fromJson(json.decode(str));

String sosMessageToJson(SosMessage data) => json.encode(data.toJson());

class SosMessage {
    SosMessage({
        required this.sosId,
    });

    String sosId;

    factory SosMessage.fromJson(Map<String, dynamic> json) => SosMessage(
        sosId: json["SOSId"],
    );

    Map<String, dynamic> toJson() => {
        "SOSId": sosId,
    };
}

AddPatientMessage addPatientMessageFromJson(String str) => AddPatientMessage.fromJson(json.decode(str));

String addPatientMessageToJson(AddPatientMessage data) => json.encode(data.toJson());

class AddPatientMessage {
    AddPatientMessage({
        required this.message,
    });

    String message;

    factory AddPatientMessage.fromJson(Map<String, dynamic> json) => AddPatientMessage(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}



ContactNumber contactnumFromJson(String str) => ContactNumber.fromJson(json.decode(str));

String contactnumToJson(ContactNumber data) => json.encode(data.toJson());

class ContactNumber {
    ContactNumber({
        required this.cgContactNum,
    });

    String cgContactNum;

    factory ContactNumber.fromJson(Map<String, dynamic> json) => ContactNumber(
        cgContactNum: json["CgContactNum"],
    );

    Map<String, dynamic> toJson() => {
        "CgContactNum": cgContactNum,
    };
}