class District {
  String state;
  List<double> geoCode;
  List<int> pinCodes;

  District({
    this.state,
    this.geoCode,
    this.pinCodes,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
    state: json["State"],
    geoCode: List<double>.from(json["GeoCode"].map((x) => x.toDouble())),
    pinCodes: List<int>.from(json["PinCodes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "State": state,
    "GeoCode": List<dynamic>.from(geoCode.map((x) => x)),
    "PinCodes": List<dynamic>.from(pinCodes.map((x) => x)),
  };
}