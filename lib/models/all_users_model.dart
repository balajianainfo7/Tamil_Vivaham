class AllUsersModel {
  int? success;
  String? message;
  int? status;
  int? totalCount;
  List<Data>? data;

  AllUsersModel(
      {this.success, this.message, this.status, this.totalCount, this.data});

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    status = json['status'];
    totalCount = json['totalCount'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    data['totalCount'] = this.totalCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  ReligionCommunity? religionCommunity;
  CommunicationDetials? communicationDetials;
  String? sId;
  String? userObjId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? stepperFormStage;
  PermanentAddress? permanentAddress;
  PersonalDetails? personalDetails;
  CarrierAndWorkingDetails? carrierAndWorkingDetails;
  JathagamDetails? jathagamDetails;
  FamilyDetails? familyDetails;

  Data(
      {this.religionCommunity,
        this.communicationDetials,
        this.sId,
        this.userObjId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.stepperFormStage,
        this.permanentAddress,
        this.personalDetails,
        this.carrierAndWorkingDetails,
        this.jathagamDetails,
        this.familyDetails});

  Data.fromJson(Map<String, dynamic> json) {
    religionCommunity = json['religion_community'] != null
        ? new ReligionCommunity.fromJson(json['religion_community'])
        : null;
    communicationDetials = json['communication_detials'] != null
        ? new CommunicationDetials.fromJson(json['communication_detials'])
        : null;
    sId = json['_id'];
    userObjId = json['user_obj_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    stepperFormStage = json['stepper_form_stage'];
    permanentAddress = json['permanent_address'] != null
        ? new PermanentAddress.fromJson(json['permanent_address'])
        : null;
    personalDetails = json['personal_details'] != null
        ? new PersonalDetails.fromJson(json['personal_details'])
        : null;
    carrierAndWorkingDetails = json['carrier_and_working_details'] != null
        ? new CarrierAndWorkingDetails.fromJson(
        json['carrier_and_working_details'])
        : null;
    jathagamDetails = json['jathagam_details'] != null
        ? new JathagamDetails.fromJson(json['jathagam_details'])
        : null;
    familyDetails = json['family_details'] != null
        ? new FamilyDetails.fromJson(json['family_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.religionCommunity != null) {
      data['religion_community'] = this.religionCommunity!.toJson();
    }
    if (this.communicationDetials != null) {
      data['communication_detials'] = this.communicationDetials!.toJson();
    }
    data['_id'] = this.sId;
    data['user_obj_id'] = this.userObjId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['stepper_form_stage'] = this.stepperFormStage;
    if (this.permanentAddress != null) {
      data['permanent_address'] = this.permanentAddress!.toJson();
    }
    if (this.personalDetails != null) {
      data['personal_details'] = this.personalDetails!.toJson();
    }
    if (this.carrierAndWorkingDetails != null) {
      data['carrier_and_working_details'] =
          this.carrierAndWorkingDetails!.toJson();
    }
    if (this.jathagamDetails != null) {
      data['jathagam_details'] = this.jathagamDetails!.toJson();
    }
    if (this.familyDetails != null) {
      data['family_details'] = this.familyDetails!.toJson();
    }
    return data;
  }
}

class ReligionCommunity {
  String? caste;
  String? community;
  String? motherTounge;
  String? religion;
  String? subCaste;

  ReligionCommunity(
      {this.caste,
        this.community,
        this.motherTounge,
        this.religion,
        this.subCaste});

  ReligionCommunity.fromJson(Map<String, dynamic> json) {
    caste = json['caste'];
    community = json['community'];
    motherTounge = json['mother_tounge'];
    religion = json['religion'];
    subCaste = json['sub_caste'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caste'] = this.caste;
    data['community'] = this.community;
    data['mother_tounge'] = this.motherTounge;
    data['religion'] = this.religion;
    data['sub_caste'] = this.subCaste;
    return data;
  }
}

class CommunicationDetials {
  String? area;
  String? city;
  String? country;
  String? district;
  String? doorNo;
  String? nationality;
  String? state;
  String? street;
  Null? currentNationality;

  CommunicationDetials(
      {this.area,
        this.city,
        this.country,
        this.district,
        this.doorNo,
        this.nationality,
        this.state,
        this.street,
        this.currentNationality});

  CommunicationDetials.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    city = json['city'];
    country = json['country'];
    district = json['district'];
    doorNo = json['door_no'];
    nationality = json['nationality'];
    state = json['state'];
    street = json['street'];
    currentNationality = json['current_nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['city'] = this.city;
    data['country'] = this.country;
    data['district'] = this.district;
    data['door_no'] = this.doorNo;
    data['nationality'] = this.nationality;
    data['state'] = this.state;
    data['street'] = this.street;
    data['current_nationality'] = this.currentNationality;
    return data;
  }
}

class PermanentAddress {
  String? area;
  String? city;
  String? country;
  String? district;
  String? doorNo;
  String? state;
  String? street;

  PermanentAddress(
      {this.area,
        this.city,
        this.country,
        this.district,
        this.doorNo,
        this.state,
        this.street});

  PermanentAddress.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    city = json['city'];
    country = json['country'];
    district = json['district'];
    doorNo = json['door_no'];
    state = json['state'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['city'] = this.city;
    data['country'] = this.country;
    data['district'] = this.district;
    data['door_no'] = this.doorNo;
    data['state'] = this.state;
    data['street'] = this.street;
    return data;
  }
}

class PersonalDetails {
  String? hobbies;
  String? diet;
  String? height;
  String? weight;
  String? maritalDetails;
  String? noOfChildren;
  String? skinTone;
  String? childrenStatus;
  String? dOB;
  int? age;
  String? firstName;
  String? gender;
  String? lastName;
  String? nickName;

  PersonalDetails(
      {this.hobbies,
        this.diet,
        this.height,
        this.weight,
        this.maritalDetails,
        this.noOfChildren,
        this.skinTone,
        this.childrenStatus,
        this.dOB,
        this.age,
        this.firstName,
        this.gender,
        this.lastName,
        this.nickName});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    hobbies = json['hobbies'];
    diet = json['diet'];
    height = json['height'];
    weight = json['weight'];
    maritalDetails = json['marital_details'];
    noOfChildren = json['no_of_children'];
    skinTone = json['skin_tone'];
    childrenStatus = json['children_status'];
    dOB = json['DOB'];
    age = json['age'];
    firstName = json['first_name'];
    gender = json['gender'];
    lastName = json['last_name'];
    nickName = json['nick_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hobbies'] = this.hobbies;
    data['diet'] = this.diet;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['marital_details'] = this.maritalDetails;
    data['no_of_children'] = this.noOfChildren;
    data['skin_tone'] = this.skinTone;
    data['children_status'] = this.childrenStatus;
    data['DOB'] = this.dOB;
    data['age'] = this.age;
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    data['last_name'] = this.lastName;
    data['nick_name'] = this.nickName;
    return data;
  }
}

class CarrierAndWorkingDetails {
  String? educationalQualification;
  String? workingIn;
  String? workingAs;
  String? companyDetails;
  String? annualIncome;

  CarrierAndWorkingDetails(
      {this.educationalQualification,
        this.workingIn,
        this.workingAs,
        this.companyDetails,
        this.annualIncome});

  CarrierAndWorkingDetails.fromJson(Map<String, dynamic> json) {
    educationalQualification = json['educational_qualification'];
    workingIn = json['working_in'];
    workingAs = json['working_as'];
    companyDetails = json['company_details'];
    annualIncome = json['annual_income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['educational_qualification'] = this.educationalQualification;
    data['working_in'] = this.workingIn;
    data['working_as'] = this.workingAs;
    data['company_details'] = this.companyDetails;
    data['annual_income'] = this.annualIncome;
    return data;
  }
}

class JathagamDetails {
  String? gothram;
  String? rasi;
  String? natchathiram;
  String? laknam;
  String? kuladeivam;
  String? doshamDetails;

  JathagamDetails(
      {this.gothram,
        this.rasi,
        this.natchathiram,
        this.laknam,
        this.kuladeivam,
        this.doshamDetails});

  JathagamDetails.fromJson(Map<String, dynamic> json) {
    gothram = json['gothram'];
    rasi = json['rasi'];
    natchathiram = json['natchathiram'];
    laknam = json['laknam'];
    kuladeivam = json['kuladeivam'];
    doshamDetails = json['dosham_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gothram'] = this.gothram;
    data['rasi'] = this.rasi;
    data['natchathiram'] = this.natchathiram;
    data['laknam'] = this.laknam;
    data['kuladeivam'] = this.kuladeivam;
    data['dosham_details'] = this.doshamDetails;
    return data;
  }
}

class FamilyDetails {
  String? fatherName;
  String? motherName;
  String? motherOccupation;
  String? noOfBro;
  String? noOfBroMarried;
  String? noOfSis;
  String? noOfSisMarried;
  String? ownVehicle;
  String? ownHouse;
  String? fatherOcuupation;
  String? expectation;
  String? ownFlats;
  String? ownLands;

  FamilyDetails(
      {this.fatherName,
        this.motherName,
        this.motherOccupation,
        this.noOfBro,
        this.noOfBroMarried,
        this.noOfSis,
        this.noOfSisMarried,
        this.ownVehicle,
        this.ownHouse,
        this.fatherOcuupation,
        this.expectation,
        this.ownFlats,
        this.ownLands});

  FamilyDetails.fromJson(Map<String, dynamic> json) {
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    motherOccupation = json['mother_occupation'];
    noOfBro = json['no_of_bro'];
    noOfBroMarried = json['no_of_bro_married'];
    noOfSis = json['no_of_sis'];
    noOfSisMarried = json['no_of_sis_married'];
    ownVehicle = json['own_vehicle'];
    ownHouse = json['own_house'];
    fatherOcuupation = json['father_ocuupation'];
    expectation = json['expectation'];
    ownFlats = json['own_flats'];
    ownLands = json['own_lands'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['father_name'] = this.fatherName;
    data['mother_name'] = this.motherName;
    data['mother_occupation'] = this.motherOccupation;
    data['no_of_bro'] = this.noOfBro;
    data['no_of_bro_married'] = this.noOfBroMarried;
    data['no_of_sis'] = this.noOfSis;
    data['no_of_sis_married'] = this.noOfSisMarried;
    data['own_vehicle'] = this.ownVehicle;
    data['own_house'] = this.ownHouse;
    data['father_ocuupation'] = this.fatherOcuupation;
    data['expectation'] = this.expectation;
    data['own_flats'] = this.ownFlats;
    data['own_lands'] = this.ownLands;
    return data;
  }
}
