class HospitalModel {
  static final hospitals = [
    Hospital(
        area: "Bengaluru",
        district: "Bengaluru",
        hospital_name: "Bhagwan Mahaveer Jain Hospital Girinagar",
        available_beds_without_oxygen: 12,
        available_beds_with_oxygen: 8,
        available_icu_beds_without_ventilator: 0,
        available_icu_beds_with_ventilator: 0,
        last_updated_on: 1622336661000,
        hospital_address:
            "Jain Hospital road, Girinagar Banashankari 3rd Stage, Avalahalli New BDA Layout, Avalahalli, Extn, Banashankari, Bengaluru, Karnataka 560085, India",
        pincode: "560085",
        hospital_phone: "080 6176 5555")
  ];
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

  Hospital(
      {this.area,
      this.district,
      this.hospital_name,
      this.available_beds_without_oxygen,
      this.available_beds_with_oxygen,
      this.available_icu_beds_without_ventilator,
      this.available_icu_beds_with_ventilator,
      this.last_updated_on,
      this.hospital_address,
      this.pincode,
      this.hospital_phone});
}
