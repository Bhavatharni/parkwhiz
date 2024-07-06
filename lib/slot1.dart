import 'dart:async';
import 'package:ParkWhiz/slot2.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'booking.dart';

Map parkResponse1 = {'new': 0};
double park = 1.0;
Timer? timer;

class SmartParkingScreen extends StatefulWidget {
  @override
  _SmartParkingScreenState createState() => _SmartParkingScreenState();
}

class _SmartParkingScreenState extends State<SmartParkingScreen> {
  Future parking1() async {
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

  Future parking2() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.thingspeak.com/channels/2426579/fields/2.json?results=1"));
    if (response.statusCode == 200) {
      parkResponse1 = json.decode(response.body);
      park = double.parse(parkResponse1['feeds'][0]['field2']);
      print(park);
      setState(() {}); // Update the UI when park value changes
    }
  }

  Future parking3() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.thingspeak.com/channels/2426579/fields/3.json?results=1"));
    if (response.statusCode == 200) {
      parkResponse1 = json.decode(response.body);
      park = double.parse(parkResponse1['feeds'][0]['field3']);
      print(park);
      setState(() {}); // Update the UI when park value changes
    }
  }

  Future parking4() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.thingspeak.com/channels/2426579/fields/4.json?results=1"));
    if (response.statusCode == 200) {
      parkResponse1 = json.decode(response.body);
      park = double.parse(parkResponse1['feeds'][0]['field4']);
      print(park);
      setState(() {}); // Update the UI when park value changes
    }
  }

  Future parking5() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.thingspeak.com/channels/2426579/fields/5.json?results=1"));
    if (response.statusCode == 200) {
      parkResponse1 = json.decode(response.body);
      park = double.parse(parkResponse1['feeds'][0]['field5']);
      print(park);
      setState(() {}); // Update the UI when park value changes
    }
  }

  Future parking6() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.thingspeak.com/channels/2426579/fields/6.json?results=1"));
    if (response.statusCode == 200) {
      parkResponse1 = json.decode(response.body);
      park = double.parse(parkResponse1['feeds'][0]['field6']);
      print(park);
      setState(() {}); // Update the UI when park value changes
    }
  }

  Future parking7() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.thingspeak.com/channels/2426579/fields/7.json?results=1"));
    if (response.statusCode == 200) {
      parkResponse1 = json.decode(response.body);
      park = double.parse(parkResponse1['feeds'][0]['field7']);
      print(park);
      setState(() {}); // Update the UI when park value changes
    }
  }

  Future parking8() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.thingspeak.com/channels/2426579/fields/8.json?results=1"));
    if (response.statusCode == 200) {
      parkResponse1 = json.decode(response.body);
      park = double.parse(parkResponse1['feeds'][0]['field8']);
      print(park);
      setState(() {}); // Update the UI when park value changes
    }
  }

  @override
  void initState() {
    parking1();
    parking2();
    parking3();
    parking4();
    parking5();
    parking6();
    parking7();
    parking8();
    super.initState();
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (Timer t) => parking1());
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (Timer t) => parking2());
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (Timer t) => parking3());
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (Timer t) => parking4());
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (Timer t) => parking5());
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (Timer t) => parking6());
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (Timer t) => parking7());
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (Timer t) => parking8());
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
    bool allSlotsUnavailable = true;
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          // Swiped to the left
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SmartParkingScreen1(), // Replace NextPage with your next page widget
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('In SREC Parking Place'),
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
                      child: Text('slot 2')),
                  Padding(padding: const EdgeInsets.all(5)),
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
                      child: Text('slot 5')),
                  Padding(padding: const EdgeInsets.all(5)),
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
        floatingActionButton: allSlotsUnavailable
            ? Container(
                width: 120, // Adjust width as needed
                height: 40, // Adjust height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      20), // Adjust border radius as needed
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    // Navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SmartParkingScreen1()),
                    );
                  },
                  child: Text(
                    'Next Area',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
