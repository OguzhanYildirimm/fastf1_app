// ignore_for_file: must_be_immutable

import 'package:fastf1_app/constants/project_text_styles.dart';
import 'package:flutter/material.dart';

class EventsDetailPage extends StatefulWidget {
  EventsDetailPage(
      {super.key,
      required this.roundNumber,
      required this.country,
      required this.location,
      required this.circuitName,
      required this.firstGrandPrix,
      required this.numberOfLaps,
      required this.circuitLength,
      required this.raceDistance,
      required this.lapRecord,
      required this.officialEventName,
      required this.eventName,
      required this.eventDate,
      required this.session1,
      required this.session1Date,
      required this.session2,
      required this.session2Date,
      required this.session3,
      required this.session3Date,
      required this.session4,
      required this.session4Date,
      required this.session5,
      required this.session5Date});
  String roundNumber;
  String country;
  String location;
  String circuitName;
  String firstGrandPrix;
  String numberOfLaps;
  String circuitLength;
  String raceDistance;
  String lapRecord;
  String officialEventName;
  String eventName;
  String eventDate;
  String session1;
  String session1Date;
  String session2;
  String session2Date;
  String session3;
  String session3Date;
  String session4;
  String session4Date;
  String session5;
  String session5Date;

  @override
  State<EventsDetailPage> createState() => _EventsDetailPageState();
}

class _EventsDetailPageState extends State<EventsDetailPage> {
  List<String>? splitSession1Date;
  List<String>? splitSession2Date;
  List<String>? splitSession3Date;
  List<String>? splitSession4Date;
  List<String>? splitSession5Date;

  void split() {
    splitSession1Date = widget.session1Date.split(" ");
    splitSession2Date = widget.session2Date.split(" ");
    splitSession3Date = widget.session3Date.split(" ");
    splitSession4Date = widget.session4Date.split(" ");
    splitSession5Date = widget.session5Date.split(" ");
  }

  @override
  void initState() {
    split();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.eventName,
          style: ProjectTextStyles().scheduleDetailTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Text(
              widget.officialEventName,
              style:
                  ProjectTextStyles().scheduleDetailOfficialEventNameTextStyle,
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 20,
              thickness: 3,
              color: Colors.purple[300],
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                surfaceTintColor: Colors.purple,
                shadowColor: Colors.purple,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Image.asset(
                          'assets/race_circuit_images/${widget.circuitName}.png'),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.circuitName,
                        style: ProjectTextStyles()
                            .scheduleDetailCircuitNameTextStyle,
                      ),
                    ],
                  ),
                )),
            Divider(
              height: 20,
              thickness: 3,
              color: Colors.purple[300],
            ),
            customLocationCardWidget(
                "assets/schedule_images/${widget.country}.png",
                "${widget.country} / ${widget.location}",
                widget.eventDate),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                customSessionCardWidget(
                    120,
                    120,
                    widget.session1,
                    splitSession1Date!.first.toString(),
                    splitSession1Date!.last.toString()),
                customSessionCardWidget(
                    120,
                    120,
                    widget.session2,
                    splitSession2Date!.first.toString(),
                    splitSession2Date!.last.toString()),
                customSessionCardWidget(
                    120,
                    120,
                    widget.session3,
                    splitSession3Date!.first.toString(),
                    splitSession3Date!.last.toString()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                customSessionCardWidget(
                    120,
                    180,
                    widget.session4,
                    splitSession4Date!.first.toString(),
                    splitSession4Date!.last.toString()),
                customSessionCardWidget(
                    120,
                    180,
                    widget.session5,
                    splitSession5Date!.first.toString(),
                    splitSession5Date!.last.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox customSessionCardWidget(double height, double width,
      String sessionName, String sessionDate, String sessionHour) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        surfaceTintColor: Colors.purple,
        shadowColor: Colors.purple,
        elevation: 5,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  sessionName,
                  style: ProjectTextStyles().scheduleSubTitleTextStyle,
                ),
                Text(
                  sessionDate,
                  textAlign: TextAlign.center,
                  style: ProjectTextStyles().scheduleDetailSessionTextStyle,
                ),
                Text(
                  sessionHour,
                  textAlign: TextAlign.center,
                  style: ProjectTextStyles().scheduleDetailSessionTextStyle,
                )
              ],
            )),
      ),
    );
  }

  SizedBox customLocationCardWidget(
    String imageText,
    String titleText,
    String subTitleText,
  ) {
    return SizedBox(
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        surfaceTintColor: Colors.purple,
        shadowColor: Colors.purple,
        elevation: 5,
        child: ListTile(
          leading: Image.asset(imageText),
          title: Text(
            titleText,
            style: ProjectTextStyles().scheduleDetailSessionTitleTextStyle,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              subTitleText,
              style: ProjectTextStyles().scheduleDetailSessionDateTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
