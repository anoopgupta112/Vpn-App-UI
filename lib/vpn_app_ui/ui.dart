import 'dart:async';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class VpnHomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<VpnHomePage> {
  Timer connectionTimer;
  String timeText = "";
  int timeCounter = 0;
  bool isConnected = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("newone")
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.menu))),
                      Expanded(
                          child: Center(
                        child: Text(
                          "PubgVpn",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      Expanded(child: Container())
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "status",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        Text(
                          "connected",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "your IP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        Text(
                          "192.224.154.214",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18),
                        )
                      ],
                    )),
                  ],
                )),

            Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "connection Time",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      Text(
                        "$timeText",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 4,
                child: Center(
                  child: Container(
                    height: 240,
                    width: 240,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          if (!isConnected) {
                            connectionTimer =
                                Timer.periodic(Duration(seconds: 1), (timer) {
                              timeCounter++;
                              int min = timeCounter % 60;
                              int sec = timeCounter % 60;

                              setState(() {
                                timeText = "$min:$sec";
                              });
                            });
                          } else {
                            connectionTimer.cancel();
                            setState(() {
                              timeText = "00:00";
                            });
                          }
                          isConnected = !isConnected;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.power_settings_new,
                              color: Colors.white,
                              size: 84,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: Center(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      "us",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "United States",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios), onPressed: () {})
                  ],
                ),
              )),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.pink,
                          ),
                          Text(
                            "124Mb/s",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Download",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.blue,
                          ),
                          Text(
                            "154Mb/s",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            // Implement Button
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text("Get prioum"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
