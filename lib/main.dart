import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:slimy_card/slimy_card.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int month = 0;
  int amountToTopup = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),

            Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[

                  SleekCircularSlider(
                    initialValue: 20,
                    appearance: CircularSliderAppearance(
                      size: 300,
                      customColors: CustomSliderColors(
                        hideShadow: true,
                        progressBarColors: [Colors.purpleAccent,Colors.purple],
                        progressBarColor: Colors.deepPurple,
                        trackColor: Colors.deepPurpleAccent,
                      ),
                      customWidths: CustomSliderWidths(
                        trackWidth: 8,
                        progressBarWidth: 20,
                      ),
                      angleRange: 360,
                      startAngle: 270,
                    ),
                    onChange: (v) {
                      // calculating pay amount

                      setState(() {
                        amountToTopup = (v*20).floor();
                      });

                    },
                    innerWidget: (v) {
                      return Container();
                    },
                  ),

                  SleekCircularSlider(
                    initialValue: 50,
                    appearance: CircularSliderAppearance(
                      size: 200,
                      customColors: CustomSliderColors(
                        hideShadow: true,
                        progressBarColors: [Colors.blue,Colors.blueAccent],
                        progressBarColor: Colors.lightBlue,
                        trackColor: Colors.blue,
                      ),
                      customWidths: CustomSliderWidths(
                        trackWidth: 8,
                        progressBarWidth: 20,
                      ),
                      angleRange: 360,
                      startAngle: 270,
                    ),
                    onChange: (v) {
                      setState(() {
                        month = (v/8.33).floor()+1;
                      });
                    },
                    innerWidget: (v) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            Text(
                              "\$$amountToTopup",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "$month month",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          
          
            SizedBox(height: 40,),
            SlimyCard(

              color: Colors.blue,
              borderRadius: 25,
              slimeEnabled: true,
              topCardWidget: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/1624229/pexels-photo-1624229.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"
                        ),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("Natasha",style: TextStyle(color: Colors.white,),),
                  ],
                ),
              ),
              bottomCardWidget: Text("Sample data about person."),
            ),
          ],
        ),
      ),
    );
  }
}