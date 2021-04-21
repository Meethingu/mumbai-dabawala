import 'district.dart';

class Locations {
  List<String> state;
  Map<String, District> district;

  Locations({
    this.state,
    this.district,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        state: List<String>.from(json["State"].map((x) => x)),
        district: Map.from(json["District"])
            .map((k, v) => MapEntry<String, District>(k, District.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "State": List<dynamic>.from(state.map((x) => x)),
        "District": Map.from(district)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}
