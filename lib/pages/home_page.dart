import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futuristic_radio_app/model/radio.dart';
import 'package:futuristic_radio_app/utilities/ai_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<MyRadio> radios;

  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios = MyRadioList.fromJson(radioJson).radios;
    print(radios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(),
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(
                LinearGradient(
                  colors: [
                    AIColors.primarycolor1,
                    AIColors.primarycolor2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
              .make(),
        ],
      ),
      appBar: AppBar(
        title: "AI Radio".text.xl4.bold.make().shimmer(
              primaryColor: Vx.purple300,
              secondaryColor: Vx.white,
            ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
