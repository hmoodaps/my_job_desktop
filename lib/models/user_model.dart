class UserModel {
  String ? uid;
  String? name;
  String? bsn;
  double? hourlyRate;
  double? weeklyHours;
  double? taxes;
  double? basicSalary;
  double? hoursLastWeek;
  double? hoursMissedLastWeek;
  int ? daysMissedLastWeek;
  double? salaryLastMonth;
  String? maritalStatus;
  String? position;
  DateTime? dob;
  DateTime? startDate;
  String? address;
  String? phoneNumber;
  String? email;
  String? idNumber;
  String? bankAccountIBAN;
  DateTime? contractEndDate;
  double? overtimeHoursLastWeek;
  double ? healthInsurance;
  String? idPhoto;
  String? passportPhoto;
  String? profilePhoto;
  double? dailyTravelCost;
  String ? password ;

  UserModel({
    this.name,
    this.password,
    this.uid,
    this.bsn,
    this.hourlyRate,
    this.weeklyHours,
    this.taxes,
    this.basicSalary,
    this.hoursLastWeek,
    this.hoursMissedLastWeek,
    this.daysMissedLastWeek,
    this.salaryLastMonth,
    this.maritalStatus,
    this.position,
    this.dob,
    this.startDate,
    this.address,
    this.phoneNumber,
    this.email,
    this.idNumber,
    this.bankAccountIBAN,
    this.contractEndDate,
    this.overtimeHoursLastWeek,
    this.healthInsurance,
    this.idPhoto,
    this.passportPhoto,
    this.profilePhoto,
    this.dailyTravelCost,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      password: json['password'],
      uid: json['uid'],
      bsn: json['bsn'],
      hourlyRate: json['hourlyRate']?.toDouble(),
      weeklyHours: json['weeklyHours']?.toDouble(),
      taxes: json['taxes']?.toDouble(),
      basicSalary: json['basicSalary']?.toDouble(),
      hoursLastWeek: json['hoursLastWeek']?.toDouble(),
      hoursMissedLastWeek: json['hoursMissedLastWeek']?.toDouble(),
      daysMissedLastWeek: json['daysMissedLastWeek']?.toDouble(),
      salaryLastMonth: json['salaryLastMonth']?.toDouble(),
      maritalStatus: json['maritalStatus'],
      position: json['position'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      idNumber: json['idNumber'],
      bankAccountIBAN: json['bankAccountIBAN'],
      contractEndDate: json['contractEndDate'] != null ? DateTime.parse(json['contractEndDate']) : null,
      overtimeHoursLastWeek: json['overtimeHoursLastWeek']?.toDouble(),
      healthInsurance: json['healthInsurance'],
      idPhoto: json['idPhoto'],
      passportPhoto: json['passportPhoto'],
      profilePhoto: json['profilePhoto'],
      dailyTravelCost: json['dailyTravelCost']?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'uid': uid,
      'bsn': bsn,
      'hourlyRate': hourlyRate,
      'weeklyHours': weeklyHours,
      'taxes': taxes,
      'basicSalary': basicSalary,
      'hoursLastWeek': hoursLastWeek,
      'hoursMissedLastWeek': hoursMissedLastWeek,
      'daysMissedLastWeek': daysMissedLastWeek,
      'salaryLastMonth': salaryLastMonth,
      'maritalStatus': maritalStatus,
      'position': position,
      'dob': dob?.toIso8601String(), // تحويل التاريخ إلى ISO String
      'startDate': startDate?.toIso8601String(), // تحويل التاريخ إلى ISO String
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'idNumber': idNumber,
      'bankAccountIBAN': bankAccountIBAN,
      'contractEndDate': contractEndDate?.toIso8601String(), // تحويل التاريخ إلى ISO String
      'overtimeHoursLastWeek': overtimeHoursLastWeek,
      'healthInsurance': healthInsurance,
      'idPhoto': idPhoto,
      'passportPhoto': passportPhoto,
      'profilePhoto': profilePhoto,
      'dailyTravelCost': dailyTravelCost,
    };
  }
}
