import 'dart:convert';

import 'package:fastf1_app/constants/project_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/local_driver_model.dart';

class DriversScreen extends StatefulWidget {
  const DriversScreen({super.key});

  @override
  State<DriversScreen> createState() => _DriversScreenState();
}

class _DriversScreenState extends State<DriversScreen> {
  List<DriverModelLocalJSON>? drivers;

  Future<void> fetchDrivers() async {
    final response =
        await rootBundle.loadString('assets/drivers_json/drivers.json');

    final List<dynamic> driverList = json.decode(response);
    setState(() {
      drivers = driverList
          .map((driver) => DriverModelLocalJSON.fromJson(driver))
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
          'Drivers',
          style: ProjectTextStyles().titleTextStyle,
        ),
      ),
      body: drivers == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: drivers!.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width - 30.0,
                    height: MediaQuery.of(context).size.height - 50.0,
                    child: _driverCard(
                        drivers![index].fullName.toString(),
                        "assets/driver_images/${drivers![index].abbreviation}.png",
                        drivers![index].teamName.toString(),
                        drivers![index].teamColor!.toInt(),
                        drivers![index].driverNumber.toString(),
                        drivers![index].abbreviation.toString(),
                        drivers![index].firstName.toString(),
                        drivers![index].lastName.toString(),
                        context),
                  );
                },
              ),
            ),
    );
  }
}

Widget _driverCard(
    String driverFullName,
    String driverImage,
    String driverTeam,
    int driverTeamColor,
    String driverNumber,
    String driverAbbreviation,
    String driverFirstName,
    String driverLastName,
    context) {
  return Padding(
      padding:
          const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color(driverTeamColor.toInt()),
                        spreadRadius: 1.0,
                        blurRadius: 2.0)
                  ],
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Hero(
                        tag: driverImage,
                        child: Image.asset(driverImage,
                            height: 200.0, width: 200.0, fit: BoxFit.contain)),
                  ),
                  const SizedBox(height: 7.0),
                  Text(
                    driverFullName,
                    style: ProjectTextStyles().driverNameTextStyle,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    driverNumber,
                    style: ProjectTextStyles().driverNumberTextStyle,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: Color(driverTeamColor.toInt()), height: 1.0)),
                  Text(
                    driverTeam,
                    style: ProjectTextStyles().driverTeamTextStyle,
                  ),
                ]),
              ))));
}
