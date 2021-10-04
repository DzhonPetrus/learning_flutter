import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dart_ipify/dart_ipify.dart';
import 'dart:convert';

class LocationPage extends StatefulWidget {
  static const String routeName = "/mylocation";
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var _myIP;
  var _data;

  _fetchData () async {
    _myIP = await Ipify.ipv64();

    var _url = Uri.http("ipapi.co" , "/$_myIP/json/");
    var res = await http.get(_url);
    _data = json.decode(res.body);

    setState(() { });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Location")),
      body: Center(
        child: _data == null 
              ? const CircularProgressIndicator()
              : Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height: 250,
                  width: 500,
                  padding: const EdgeInsets.all(25),
                  color: Colors.amber[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("IP Address:", style: TextStyle(fontSize: 14)),
                      Text("${_data['ip']}", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const Padding(padding: EdgeInsets.all(10)),
                      const Text("Telcom Provider:", style: TextStyle(fontSize: 14)),
                      Text("${_data['org']}", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const Padding(padding: EdgeInsets.all(10)),
                      const Text("Location:", style: TextStyle(fontSize: 14)),
                      Text("${_data['city']}, ${_data['region']}, ${_data['country_name']}", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const Padding(padding: EdgeInsets.all(10)),
                      Text("Latitude: ${_data['latitude']}, Longitude: ${_data['longitude']}", style: const TextStyle(fontSize: 14)),
                    ],
                                 ),
                ),
              ),
      )
    );
  }
}