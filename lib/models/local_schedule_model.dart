class ScheduleModelLocalJSON {
  int? roundNumber;
  String? country;
  String? location;
  String? circuitName;
  String? firstGrandPrix;
  String? numberOfLaps;
  String? circuitLength;
  String? raceDistance;
  String? lapRecord;
  String? officialEventName;
  String? eventDate;
  String? eventName;
  String? eventFormat;
  String? session1;
  String? session1Date;
  String? session2;
  String? session2Date;
  String? session3;
  String? session3Date;
  String? session4;
  String? session4Date;
  String? session5;
  String? session5Date;

  ScheduleModelLocalJSON({
    this.roundNumber,
    this.country,
    this.location,
    this.circuitName,
    this.firstGrandPrix,
    this.numberOfLaps,
    this.circuitLength,
    this.raceDistance,
    this.lapRecord,
    this.officialEventName,
    this.eventDate,
    this.eventName,
    this.eventFormat,
    this.session1,
    this.session1Date,
    this.session2,
    this.session2Date,
    this.session3,
    this.session3Date,
    this.session4,
    this.session4Date,
    this.session5,
    this.session5Date,
  });

  ScheduleModelLocalJSON.fromJson(Map<String, dynamic> json) {
    roundNumber = json['RoundNumber'];
    country = json['Country'];
    location = json['Location'];
    circuitName = json['CircuitName'];
    firstGrandPrix = json['FirstGrandPrix'];
    numberOfLaps = json['NumberOfLaps'];
    circuitLength = json['CircuitLength'];
    raceDistance = json['RaceDistance'];
    lapRecord = json['LapRecord'];
    officialEventName = json['OfficialEventName'];
    eventDate = json['EventDate'];
    eventName = json['EventName'];
    eventFormat = json['EventFormat'];
    session1 = json['Session1'];
    session1Date = json['Session1Date'];
    session2 = json['Session2'];
    session2Date = json['Session2Date'];
    session3 = json['Session3'];
    session3Date = json['Session3Date'];
    session4 = json['Session4'];
    session4Date = json['Session4Date'];
    session5 = json['Session5'];
    session5Date = json['Session5Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RoundNumber'] = roundNumber;
    data['Country'] = country;
    data['Location'] = location;
    data['CircuitName'] = circuitName;
    data['FirstGrandPrix'] = firstGrandPrix;
    data['NumberOfLaps'] = numberOfLaps;
    data['CircuitLength'] = circuitLength;
    data['RaceDistance'] = raceDistance;
    data['LapRecord'] = lapRecord;
    data['OfficialEventName'] = officialEventName;
    data['EventDate'] = eventDate;
    data['EventName'] = eventName;
    data['EventFormat'] = eventFormat;
    data['Session1'] = session1;
    data['Session1Date'] = session1Date;
    data['Session2'] = session2;
    data['Session2Date'] = session2Date;
    data['Session3'] = session3;
    data['Session3Date'] = session3Date;
    data['Session4'] = session4;
    data['Session4Date'] = session4Date;
    data['Session5'] = session5;
    data['Session5Date'] = session5Date;
    return data;
  }
}
