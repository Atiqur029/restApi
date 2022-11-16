import 'dart:convert';

import 'package:apitest/model/usermodel.dart';
import 'package:apitest/page/reasuable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> usermodel = [];

  Future<List<UserModel>> getUsermodelApi() async {
    String uri = 'https://jsonplaceholder.typicode.com/users';
    final respons = await http.get(Uri.parse(uri));
    var data = jsonDecode(respons.body.toString());

    if (respons.statusCode == 200) {
      for (Map i in data) {
        usermodel.add(UserModel.fromJson(i));
      }
      return usermodel;
    }
    return usermodel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUsermodelApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: usermodel.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ReausibleRow(
                                    title: 'Name',
                                    value:
                                        snapshot.data![index].name.toString()),
                                ReausibleRow(
                                    title: 'username',
                                    value: snapshot.data![index].username
                                        .toString()),
                                ReausibleRow(
                                    title: 'email',
                                    value:
                                        snapshot.data![index].email.toString()),
                                ReausibleRow(
                                    title: 'Address',
                                    value: snapshot
                                        .data![index].address!.geo!.lat
                                        .toString())
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
