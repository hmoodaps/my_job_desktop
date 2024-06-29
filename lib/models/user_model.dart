import 'package:intl/intl.dart';

class UserModel {
  String? uid;
  String? name;
  String? bsn;
  double? hourlyRate;
  double? weeklyHours;
  double? taxes;
  double? hoursLastWeek;
  double? hoursMissedLastWeek;
  int? daysMissedLastWeek;
  double? salaryLastMonth;
  String? maritalStatus;
  String? position;
  DateTime? dob;
  String? address;
  String? phoneNumber;
  String? email;
  String? idNumber;
  String? bankAccountIBAN;
  String? contract;
  double? overtimeHoursLastWeek;
  double? healthInsurance;
  String? frontIdPhoto;
  String? backIdPhoto;
  String? frontDrivingLicense;
  String? backDrivingLicense;
  String? passportPhoto;
  String? profilePhoto;
  double? dailyTravelCost;
  String? password;
  String? bonusesAndPromotions;
  List<String>? qualifications; // تم تحديث النوع هنا

  UserModel({
    this.name,
    this.password,
    this.uid,
    this.qualifications,
    this.bonusesAndPromotions,
    this.bsn,
    this.hourlyRate,
    this.weeklyHours,
    this.taxes,
    this.contract,
    this.hoursLastWeek,
    this.hoursMissedLastWeek,
    this.daysMissedLastWeek,
    this.salaryLastMonth,
    this.maritalStatus,
    this.position,
    this.dob,
    this.address,
    this.phoneNumber,
    this.email,
    this.idNumber,
    this.bankAccountIBAN,
    this.overtimeHoursLastWeek,
    this.healthInsurance,
    this.frontIdPhoto,
    this.backIdPhoto,
    this.frontDrivingLicense,
    this.backDrivingLicense,
    this.passportPhoto,
    this.profilePhoto,
    this.dailyTravelCost,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      contract: json['contract'],
      qualifications: (json['qualifications'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      password: json['password'],
      uid: json['uid'],
      bsn: json['bsn'],
      bonusesAndPromotions: json['bonusesAndPromotions'] ?? '',
      hourlyRate: json['hourlyRate'] is String
          ? double.tryParse(json['hourlyRate']) ?? 0.0
          : json['hourlyRate']?.toDouble() ?? 0.0,
      weeklyHours: json['weeklyHours'] is String
          ? double.tryParse(json['weeklyHours']) ?? 0.0
          : json['weeklyHours']?.toDouble() ?? 0.0,
      taxes: json['taxes'] is String
          ? double.tryParse(json['taxes']) ?? 0.0
          : json['taxes']?.toDouble() ?? 0.0,
      hoursLastWeek: json['hoursLastWeek'] is String
          ? double.tryParse(json['hoursLastWeek']) ?? 0.0
          : json['hoursLastWeek']?.toDouble() ?? 0.0,
      hoursMissedLastWeek: json['hoursMissedLastWeek'] is String
          ? double.tryParse(json['hoursMissedLastWeek']) ?? 0.0
          : json['hoursMissedLastWeek']?.toDouble() ?? 0.0,
      daysMissedLastWeek: json['daysMissedLastWeek'],
      salaryLastMonth: json['salaryLastMonth'] is String
          ? double.tryParse(json['salaryLastMonth']) ?? 0.0
          : json['salaryLastMonth']?.toDouble() ?? 0.0,
      maritalStatus: json['maritalStatus'],
      position: json['position'],
      dob: json['dob'] != null ? DateFormat('yyyy/MM/dd').parse(json['dob']) : null,
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      idNumber: json['idNumber'],
      bankAccountIBAN: json['bankAccountIBAN'],
      overtimeHoursLastWeek: json['overtimeHoursLastWeek'] is String
          ? double.tryParse(json['overtimeHoursLastWeek']) ?? 0.0
          : json['overtimeHoursLastWeek']?.toDouble() ?? 0.0,
      healthInsurance: json['healthInsurance'] is String
          ? double.tryParse(json['healthInsurance']) ?? 0.0
          : json['healthInsurance']?.toDouble() ?? 0.0,
      frontIdPhoto: json['frontIdPhoto'],
      backIdPhoto: json['backIdPhoto'],
      frontDrivingLicense: json['frontDrivingLicense'],
      backDrivingLicense: json['backDrivingLicense'],
      passportPhoto: json['passportPhoto'],
      profilePhoto: json['profilePhoto'],
      dailyTravelCost: json['dailyTravelCost'] is String
          ? double.tryParse(json['dailyTravelCost']) ?? 0.0
          : json['dailyTravelCost']?.toDouble() ?? 0.0,
    );}


    Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contract': contract,
      'qualifications': qualifications,
      'password': password,
      'uid': uid,
      'bsn': bsn,
      'bonusesAndPromotions': bonusesAndPromotions,
      'hourlyRate': hourlyRate,
      'weeklyHours': weeklyHours,
      'taxes': taxes,
      'hoursLastWeek': hoursLastWeek,
      'hoursMissedLastWeek': hoursMissedLastWeek,
      'daysMissedLastWeek': daysMissedLastWeek,
      'salaryLastMonth': salaryLastMonth,
      'maritalStatus': maritalStatus,
      'position': position,
      'dob': dob?.toIso8601String(),
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'idNumber': idNumber,
      'bankAccountIBAN': bankAccountIBAN,
      'overtimeHoursLastWeek': overtimeHoursLastWeek,
      'healthInsurance': healthInsurance,
      'frontIdPhoto': frontIdPhoto,
      'backIdPhoto': backIdPhoto,
      'frontDrivingLicense': frontDrivingLicense,
      'backDrivingLicense': backDrivingLicense,
      'passportPhoto': passportPhoto,
      'profilePhoto': profilePhoto,
      'dailyTravelCost': dailyTravelCost,
    };
  }
}
