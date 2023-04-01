import 'package:fastf1_app/constants/project_text_styles.dart';
import 'package:fastf1_app/screens/drivers_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DataF1 App',
          style: ProjectTextStyles().titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/home_screen_images/home_screen_image.png'),
          homeScreenButtonWidget(context, () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const DriversScreen(),
            ));
          }, "Driver List"),
          const SizedBox(
            height: 25,
          ),
          homeScreenButtonWidget(context, () {}, "Event List"),
        ],
      ),
    );
  }

  SizedBox homeScreenButtonWidget(
      BuildContext context, Function() onPressed, String buttonName) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
        style: const ButtonStyle(
            shape: MaterialStatePropertyAll<OutlinedBorder>(StadiumBorder())),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: ProjectTextStyles().buttonTextStyle,
        ),
      ),
    );
  }
}
