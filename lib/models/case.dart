import 'dart:convert';

class CasesModel {
  static List<Case> statewise = [
    Case(
        active: "24127",
        confirmed: "2891699",
        deaths: "36323",
        lastupdatedtime: "23/07/2021 20:22:39",
        recovered: "2831226")

  ];
}

class Case {
  final String active;
  final String confirmed;
  final String deaths;
  final String lastupdatedtime;
  final String recovered;

  Case({
    this.active,
    this.confirmed,
    this.deaths,
    this.lastupdatedtime,
    this.recovered
  });

  

  Case copyWith({
    String  active,
    String confirmed,
    String deaths,
    String lastupdatedtime,
    String recovered,
  }) {
    return Case(
     active : active ?? this.active,
     confirmed :confirmed ?? this.confirmed,
    deaths : deaths ?? this.deaths,
     lastupdatedtime : lastupdatedtime ?? this.lastupdatedtime,
     recovered : recovered ?? this.recovered,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'confirmed': confirmed,
      'deaths': deaths,
      'lastupdatedtime': lastupdatedtime,
      'recovered': recovered,
    };
  }

  factory Case.fromMap(Map<String, dynamic> map) {
    return Case(
     active: map['active'],
     confirmed: map['confirmed'],
      deaths: map['deaths'],
      lastupdatedtime: map['lastupdatedtime'],
      recovered:map['recovered'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Case.fromJson(String source) => Case.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Case(active: $active, confirmed: $confirmed, deaths: $deaths, lastupdatedtime: $lastupdatedtime, recovered: $recovered)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Case &&
      other.active == active &&
      other.confirmed == confirmed &&
      other.deaths == deaths &&
      other.lastupdatedtime == lastupdatedtime &&
      other.recovered == recovered;
  }

  @override
  int get hashCode {
    return active.hashCode ^
      confirmed.hashCode ^
      deaths.hashCode ^
      lastupdatedtime.hashCode ^
      recovered.hashCode;
  }
}
