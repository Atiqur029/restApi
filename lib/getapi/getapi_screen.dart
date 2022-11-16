import 'package:apitest/getapi/examole_one.dart';
import 'package:apitest/getapi/example_fiver.dart';
import 'package:apitest/getapi/example_four.dart';
import 'package:apitest/getapi/example_three.dart';
import 'package:apitest/getapi/example_two.dart';
import 'package:apitest/getapi/reausablewidget.dart';
import 'package:flutter/material.dart';

class GetApiTutorials extends StatefulWidget {
  const GetApiTutorials({Key? key}) : super(key: key);

  @override
  _GetApiTutorialsState createState() => _GetApiTutorialsState();
}

class _GetApiTutorialsState extends State<GetApiTutorials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ReusableWidget(
              title: 'Example one',
              subTitle:
                  'Example one where we create model using Plugin,click to see the source code',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExampleOne()));
              },
            ),
            ReusableWidget(
              title: 'Example Two',
              subTitle: 'Example one where we create our own custom model',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleTwo()));
              },
            ),
            ReusableWidget(
              title: 'Example Three',
              subTitle:
                  'Example four with complex JSON but we used plugins to create model and parse JSON data.',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleThree()));
              },
            ),
            ReusableWidget(
              title: 'Example Four',
              subTitle:
                  "Example four where we don't used model to fetch data from server and show in our api. Then we will use this method to fetch api",
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleFour()));
              },
            ),
            ReusableWidget(
              title: 'Example Five',
              subTitle:
                  'Example five, how to parse very complex JSON and show in api',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LastExample()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
