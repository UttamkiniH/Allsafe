import 'dart:convert';

class HospitalModel {
  static List<Hospital> hospitals;
}

class Hospital {
  final String area;
  final String district;
  final String hospital_name;
  final int available_beds_without_oxygen;
  final int available_beds_with_oxygen;
  final int available_icu_beds_without_ventilator;
  final int available_icu_beds_with_ventilator;
  final int last_updated_on;
  final String hospital_address;
  final String pincode;
  final String hospital_phone;

  Hospital({
    this.area,
    this.district,
    this.hospital_name,
    this.available_beds_without_oxygen,
    this.available_beds_with_oxygen,
    this.available_icu_beds_without_ventilator,
    this.available_icu_beds_with_ventilator,
    this.last_updated_on,
    this.hospital_address,
    this.pincode,
    this.hospital_phone
  });

  

  Hospital copyWith({
    String  area,
    String  district,
    String hospital_name,
    int available_beds_without_oxygen,
    int available_beds_with_oxygen,
    int available_icu_beds_without_ventilator,
    int available_icu_beds_with_ventilator,
    int last_updated_on,
    String hospital_address,
    String pincode,
    String hospital_phone,
  }) {
    return Hospital(
      area : area ?? this.area,
      district:district ?? this.district,
      hospital_name:hospital_name ?? this.hospital_name,
      available_beds_without_oxygen:available_beds_without_oxygen ?? this.available_beds_without_oxygen,
      available_beds_with_oxygen:available_beds_with_oxygen ?? this.available_beds_with_oxygen,
      available_icu_beds_without_ventilator:available_icu_beds_without_ventilator ?? this.available_icu_beds_without_ventilator,
      available_icu_beds_with_ventilator:available_icu_beds_with_ventilator ?? this.available_icu_beds_with_ventilator,
      last_updated_on:last_updated_on ?? this.last_updated_on,
     hospital_address: hospital_address ?? this.hospital_address,
     pincode: pincode ?? this.pincode,
     hospital_phone: hospital_phone ?? this.hospital_phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'area': area,
      'district': district,
      'hospital_name': hospital_name,
      'available_beds_without_oxygen': available_beds_without_oxygen,
      'available_beds_with_oxygen': available_beds_with_oxygen,
      'available_icu_beds_without_ventilator': available_icu_beds_without_ventilator,
      'available_icu_beds_with_ventilator': available_icu_beds_with_ventilator,
      'last_updated_on': last_updated_on,
      'hospital_address': hospital_address,
      'pincode': pincode,
      'hospital_phone': hospital_phone,
    };
  }

  factory Hospital.fromMap(Map<String, dynamic> map) {
    
    // if(map==null) return null;
    
    return Hospital(
     area: map['area'],
     district: map['district'],
    hospital_name:  map['hospital_name'],
     available_beds_without_oxygen: map['available_beds_without_oxygen'],
     available_beds_with_oxygen: map['available_beds_with_oxygen'],
    available_icu_beds_without_ventilator:  map['available_icu_beds_without_ventilator'],
     available_icu_beds_with_ventilator: map['available_icu_beds_with_ventilator'],
     last_updated_on: map['last_updated_on'],
     hospital_address: map['hospital_address'],
      pincode:map['pincode'],
    hospital_phone:  map['hospital_phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Hospital.fromJson(String source) => Hospital.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hospital(area: $area, district: $district, hospital_name: $hospital_name, available_beds_without_oxygen: $available_beds_without_oxygen, available_beds_with_oxygen: $available_beds_with_oxygen, available_icu_beds_without_ventilator: $available_icu_beds_without_ventilator, available_icu_beds_with_ventilator: $available_icu_beds_with_ventilator, last_updated_on: $last_updated_on, hospital_address: $hospital_address, pincode: $pincode, hospital_phone: $hospital_phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Hospital &&
      other.area == area &&
      other.district == district &&
      other.hospital_name == hospital_name &&
      other.available_beds_without_oxygen == available_beds_without_oxygen &&
      other.available_beds_with_oxygen == available_beds_with_oxygen &&
      other.available_icu_beds_without_ventilator == available_icu_beds_without_ventilator &&
      other.available_icu_beds_with_ventilator == available_icu_beds_with_ventilator &&
      other.last_updated_on == last_updated_on &&
      other.hospital_address == hospital_address &&
      other.pincode == pincode &&
      other.hospital_phone == hospital_phone;
  }

  @override
  int get hashCode {
    return area.hashCode ^
      district.hashCode ^
      hospital_name.hashCode ^
      available_beds_without_oxygen.hashCode ^
      available_beds_with_oxygen.hashCode ^
      available_icu_beds_without_ventilator.hashCode ^
      available_icu_beds_with_ventilator.hashCode ^
      last_updated_on.hashCode ^
      hospital_address.hashCode ^
      pincode.hashCode ^
      hospital_phone.hashCode;
  }
}
