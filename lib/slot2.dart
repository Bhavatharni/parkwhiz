import 'dart:async';
import 'package:ParkWhiz/slot1.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'booking.dart';

Map parkResponse1 = {'new': 0};
double park = 1.0;
Timer? timer;

class SmartParkingScreen1 extends StatefulWidget {
  @override
  _SmartParkingScreenState createState() => _SmartParkingScreenState();
}

class _SmartParkingScreenState extends State<SmartParkingScreen1> {
  Future parking() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.thingspeak.com/channels/2426579/fields/1.json?results=1"));
    if (response.statusCode == 200) {
      parkResponse1 = json.decode(response.body);
      park = double.parse(parkResponse1['feeds'][0]['field1']);
      print(park);
      setState(() {}); // Update the UI when park value changes
    }
  }

  @override
  void initState() {
    parking();
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500),
        (Timer t) => parking()); // Adjust the timer duration
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Slot Unavailable"),
          content: Text("The selected slot is currently unavailable."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // Swiped to the left
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SmartParkingScreen(), // Replace NextPage with your next page widget
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('In outside SREC Parking Place'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/background.png'), // Replace 'background_image.jpg' with your image file
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  ElevatedButton(
                    onPressed: () {
                      if (park == 0.0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => booking()),
                        );
                      } else {
                        showAlert(
                            context); // Show alert when slot is unavailable
                      }
                    },
                    child: Text('slot 1'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: park == 0.0
                          ? Colors.green
                          : Colors
                              .red, // Change button color based on park value
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(5)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => booking()),
                        );
                      },
                      child: Text('slot 2')),
                  Padding(padding: const EdgeInsets.all(5)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => booking()),
                        );
                      },
                      child: Text('slot 3')),
                ]),
                Row(children: [
                  ElevatedButton(
                    onPressed: () {
                      if (park == 0.0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => booking()),
                        );
                      } else {
                        showAlert(
                            context); // Show alert when slot is unavailable
                      }
                    },
                    child: Text('slot 4'),
                  ),
                  Padding(padding: const EdgeInsets.all(5)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => booking()),
                        );
                      },
                      child: Text('slot 5')),
                  Padding(padding: const EdgeInsets.all(5)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => booking()),
                        );
                      },
                      child: Text('slot 6')),
                ]),
                Row(children: [
                  ElevatedButton(
                    onPressed: () {
                      if (park == 0.0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => booking()),
                        );
                      } else {
                        showAlert(
                            context); // Show alert when slot is unavailable
                      }
                    },
                    child: Text('slot 7'),
                  ),
                  Padding(padding: const EdgeInsets.all(5)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => booking()),
                        );
                      },
                      child: Text('slot 8')),
                  Padding(padding: const EdgeInsets.all(5)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => booking()),
                        );
                      },
                      child: Text('slot 9')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
