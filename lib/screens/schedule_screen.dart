import 'dart:convert';

import 'package:fastf1_app/constants/project_text_styles.dart';
import 'package:fastf1_app/screens/events_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/local_schedule_model.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<ScheduleModelLocalJSON>? schedule;

  Future<void> fetchDrivers() async {
    final response =
        await rootBundle.loadString('assets/schedule_json/schedule.json');

    final List<dynamic> eventList = json.decode(response);
    setState(() {
      schedule = eventList
          .map((event) => ScheduleModelLocalJSON.fromJson(event))
          .toList();
    });
  }

  @override
  void initState() {
    fetchDrivers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Schedule",
        style: ProjectTextStyles().titleTextStyle,
      )),
      body: schedule == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
              child: ListView.builder(
                itemCount: schedule!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EventsDetailPage(
                            roundNumber:
                                schedule![index].roundNumber.toString(),
                            country: schedule![index].country.toString(),
                            location: schedule![index].location.toString(),
                            circuitName:
                                schedule![index].circuitName.toString(),
                            firstGrandPrix:
                                schedule![index].firstGrandPrix.toString(),
                            numberOfLaps:
                                schedule![index].numberOfLaps.toString(),
                            circuitLength:
                                schedule![index].circuitLength.toString(),
                            raceDistance:
                                schedule![index].raceDistance.toString(),
                            lapRecord: schedule![index].lapRecord.toString(),
                            officialEventName:
                                schedule![index].officialEventName.toString(),
                            eventName: schedule![index].eventName.toString(),
                            eventDate: schedule![index].eventDate.toString(),
                            session1: schedule![index].session1.toString(),
                            session1Date:
                                schedule![index].session1Date.toString(),
                            session2: schedule![index].session2.toString(),
                            session2Date:
                                schedule![index].session2Date.toString(),
                            session3: schedule![index].session3.toString(),
                            session3Date:
                                schedule![index].session3Date.toString(),
                            session4: schedule![index].session4.toString(),
                            session4Date:
                                schedule![index].session4Date.toString(),
                            session5: schedule![index].session5.toString(),
                            session5Date:
                                schedule![index].session5Date.toString()),
                      ));
                    },
                    child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          schedule![index].eventName.toString(),
                          style: ProjectTextStyles().scheduleTitleTextStyle,
                        ),
                        subtitle: Text(
                          schedule![index].location.toString(),
                          style: ProjectTextStyles().scheduleSubTitleTextStyle,
                        ),
                        leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/schedule_images/${schedule![index].country.toString()}.png'))),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined)),
                  );
                },
              ),
            ),
    );
  }
}
