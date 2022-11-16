import 'dart:convert';

import 'package:apitest/page/reasuable.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future getUserApi() async {
    final respons =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (respons.statusCode == 200) {
      return data = jsonDecode(respons.body.toString());
      ;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Course"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUserApi(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ReausibleRow(
                              title: 'name',
                              value: data[index]['name'].toString(),
                            ),
                            ReausibleRow(
                              title: 'Username',
                              value: data[index]['username'].toString(),
                            ),
                            ReausibleRow(
                              title: 'address',
                              value:
                                  data[index]['address']['street'].toString(),
                            ),
                            ReausibleRow(
                              title: 'Lat',
                              value: data[index]['address']['geo']['lat']
                                  .toString(),
                            ),
                            ReausibleRow(
                              title: 'Lat',
                              value: data[index]['address']['geo']['lng']
                                  .toString(),
                            ),
                          ],
                        ),
                      );
                    }));
              }
            }),
          ))
        ],
      ),
    );
  }
}
