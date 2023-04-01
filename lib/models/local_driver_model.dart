class DriverModelLocalJSON {
  String? driverNumber;
  String? broadcastName;
  String? abbreviation;
  String? teamName;
  int? teamColor;
  String? firstName;
  String? lastName;
  String? fullName;

  DriverModelLocalJSON(
      {this.driverNumber,
      this.broadcastName,
      this.abbreviation,
      this.teamName,
      this.teamColor,
      this.firstName,
      this.lastName,
      this.fullName});

  DriverModelLocalJSON.fromJson(Map<String, dynamic> json) {
    driverNumber = json['DriverNumber'];
    broadcastName = json['BroadcastName'];
    abbreviation = json['Abbreviation'];
    teamName = json['TeamName'];
    teamColor = json['TeamColor'] as int;
    firstName = json['FirstName'];
    lastName = json['LastName'];
    fullName = json['FullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DriverNumber'] = driverNumber;
    data['BroadcastName'] = broadcastName;
    data['Abbreviation'] = abbreviation;
    data['TeamName'] = teamName;
    data['TeamColor'] = teamColor;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['FullName'] = fullName;
    return data;
  }
}
